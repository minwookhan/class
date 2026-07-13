---
title: "Example"
linkTitle: "Example"
weight: 1
toc: true
---



# 비트코인 가격 예측 예제 - 단계별 역할과 코드


## 1. 라이브러리 임포트 및 설치

```python
# 최초 1회만 실행: pip install yfinance
import numpy as np
import pandas as pd
import yfinance as yf
import matplotlib.pyplot as plt
import tensorflow as tf
from sklearn.preprocessing import MinMaxScaler
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import LSTM, Dense, Input, Dropout

tf.random.set_seed(42)
np.random.seed(42)
```


## 2. 데이터 다운로드 (Yahoo Finance)

```python
# BTC-USD 일별 시세, 최근 약 3년치
btc = yf.download("BTC-USD",
                  start="2022-01-01",
                  end="2026-01-01",
                  progress=False)
print(f"데이터 기간: {btc.index.min()} ~ {btc.index.max()}")
print(f"전체 일수: {len(btc)}")
btc.head()
```


## 3. 종가(Close) 추출 및 시각화

```python
prices = btc[['Close']].values  # shape: (N, 1)

plt.figure(figsize=(12, 4))
plt.plot(btc.index, prices)
plt.title("Bitcoin Close Price (USD)")
plt.xlabel("Date")
plt.ylabel("Price")
plt.grid(True)
plt.show()
```


## 4. 정규화 (0~1 범위로 스케일링)

```python
scaler = MinMaxScaler(feature_range=(0, 1))
prices_scaled = scaler.fit_transform(prices)

print(f"원본 범위: {prices.min():.0f} ~ {prices.max():.0f}")
print(f"정규화 후: {prices_scaled.min():.4f} ~ {prices_scaled.max():.4f}")
```


## 5. 슬라이딩 윈도우 (입력/정답 쌍 생성)

```python
def make_sequences(data, window_size=60):
    """과거 window_size일 → 다음날 가격 예측"""
    X, y = [], []
    for i in range(len(data) - window_size):
        X.append(data[i:i+window_size])
        y.append(data[i+window_size])
    return np.array(X), np.array(y)

WINDOW = 60  # 과거 60일 보고 다음날 예측
X, y = make_sequences(prices_scaled, WINDOW)
print(f"X shape: {X.shape}")  # (샘플수, 60, 1)
print(f"y shape: {y.shape}")  # (샘플수, 1)
```


## 6. 학습/테스트 분리 (시간 순서 유지)

```python
# 시계열은 셔플 금지! 시간 순서대로 80:20 분할
split = int(len(X) * 0.8)
X_train, X_test = X[:split], X[split:]
y_train, y_test = y[:split], y[split:]

print(f"학습: {X_train.shape}, 테스트: {X_test.shape}")
```


## 7. LSTM 모델 구성

```python
model = Sequential([
    Input(shape=(WINDOW, 1)),
    LSTM(50, return_sequences=True),
    Dropout(0.2),
    LSTM(50),
    Dropout(0.2),
    Dense(1)  # 회귀: 활성화 함수 없음
])
model.compile(loss='mean_squared_error',
              optimizer='adam',
              metrics=['mae'])
model.summary()
```


## 8. 학습

```python
history = model.fit(X_train, y_train,
                    epochs=30,
                    batch_size=32,
                    validation_split=0.1,
                    verbose=1)
```


## 9. 학습 곡선 시각화

```python
fig, axes = plt.subplots(1, 2, figsize=(12, 4))
axes[0].plot(history.history['loss'], label='train')
axes[0].plot(history.history['val_loss'], label='val')
axes[0].set_title('Loss (MSE)')
axes[0].legend(); axes[0].grid(True)

axes[1].plot(history.history['mae'], label='train')
axes[1].plot(history.history['val_mae'], label='val')
axes[1].set_title('MAE')
axes[1].legend(); axes[1].grid(True)
plt.show()
```


## 10. 테스트셋 예측

```python
y_pred_scaled = model.predict(X_test, verbose=0)

# 역정규화: 0~1 → 실제 USD 값
y_pred = scaler.inverse_transform(y_pred_scaled)
y_true = scaler.inverse_transform(y_test)

print(f"예측 첫 5개: {y_pred[:5].flatten()}")
print(f"실제 첫 5개: {y_true[:5].flatten()}")
```


## 11. 예측 결과 시각화

```python
plt.figure(figsize=(12, 5))
plt.plot(y_true, label='Actual', color='blue')
plt.plot(y_pred, label='Predicted', color='red', alpha=0.7)
plt.title("Bitcoin Price: Actual vs Predicted")
plt.xlabel("Day")
plt.ylabel("Price (USD)")
plt.legend()
plt.grid(True)
plt.show()
```


## 12. 오차 측정

```python
from sklearn.metrics import mean_absolute_error, mean_squared_error

mae = mean_absolute_error(y_true, y_pred)
rmse = np.sqrt(mean_squared_error(y_true, y_pred))
mape = np.mean(np.abs((y_true - y_pred) / y_true)) * 100

print(f"MAE:  ${mae:,.2f}")
print(f"RMSE: ${rmse:,.2f}")
print(f"MAPE: {mape:.2f}%")
```


## 13. 미래 예측 함수 (다음날 1일 예측)

```python
def predict_next_day(recent_60_days):
    """최근 60일 가격 → 다음날 가격 예측"""
    scaled = scaler.transform(np.array(recent_60_days).reshape(-1, 1))
    X_input = scaled.reshape(1, WINDOW, 1)
    pred_scaled = model.predict(X_input, verbose=0)
    pred = scaler.inverse_transform(pred_scaled)
    return pred[0][0]

# 가장 최근 60일로 다음날 예측
last_60 = prices[-WINDOW:].flatten()
next_price = predict_next_day(last_60)
print(f"최근 종가: ${prices[-1][0]:,.2f}")
print(f"다음날 예측: ${next_price:,.2f}")
```


## 14. 한계 확인 (다중일 예측)

```python
def predict_n_days(recent_60_days, n_days=30):
    """예측값을 다시 입력으로 사용해 n일 연속 예측"""
    history = list(recent_60_days)
    predictions = []
    for _ in range(n_days):
        next_p = predict_next_day(history[-WINDOW:])
        predictions.append(next_p)
        history.append(next_p)
    return predictions

future_30 = predict_n_days(prices[-WINDOW:].flatten(), n_days=30)

plt.figure(figsize=(12, 4))
plt.plot(range(-WINDOW, 0), prices[-WINDOW:], label='Past 60 days', color='blue')
plt.plot(range(0, 30), future_30, label='Predicted 30 days', color='red')
plt.axvline(x=0, color='gray', linestyle='--')
plt.title("Bitcoin: Past + 30-day Forecast")
plt.legend(); plt.grid(True)
plt.show()
```


## 15. 토론 거리 (학생용)

> -   예측이 실제보다 1일 늦는 현상 ("따라가기" 효과) 관찰
> -   30일 예측이 점점 평평해지는 이유?
> -   종가만 사용 vs 거래량/고가/저가도 함께 사용 비교
> -   LSTM units, window\_size, epochs 변경 실험
> -   "이걸로 부자 될 수 있나요?" → 시장 효율성 가설 토론

