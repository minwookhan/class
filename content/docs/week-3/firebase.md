---
title: "Firebase 설정하기"
linkTitle: "Firebase 설정하기"
weight: 1
toc: true
---



# Firebase Project와 App  소개


## 1. Project 와 App

-   **프로젝트(Project)**: 데이터와 서비스를 실제로 담고 있는 그릇. 소유의 단위.
-   **앱(App)**: 그 프로젝트에 접속하기 위해 등록한 클라이언트. 접근의 단위.
-   하나의 프로젝트 안에 여러 App  있을 수 있다.
-   회원 정보는 하나의 Project 단위에 공유 하고
-   그 회원 정보로 여러 서비스(쇼핑, 메일, 블로그) 등 여러개 가능


## 2. 프로젝트(Project)


### 프로젝트 소유

| 서비스 | 내용 | 개수 |
| --- | --- | --- |
| Authentication | 회원 계정 목록 | 프로젝트당 1벌 |
| Firestore | 문서형 데이터베이스 | 프로젝트당 1개(기본) |
| Realtime Database | 실시간 DB | 필요 시 |
| Storage | 이미지·파일 저장소 | 기본 버킷 1개 |
| Hosting | 정적 웹 배포 | 프로젝트당 여러 사이트 가능 |
| Cloud Functions | 서버 로직 | 프로젝트 단위 배포 |


### 프로젝트 단위로 결정되는 것

-   **결제와 요금제**: Spark(무료) / Blaze(종량제) 선택은 프로젝트 단위
-   **사용량 한도**: 읽기·쓰기 횟수, 저장 용량 집계 단위
-   **리전(위치)**: Firestore 리전은 =asia-northeast3=(서울) 등으로 지정
    -   주의: **한 번 정하면 변경 불가**. 생성 시점에 확정해야 한다.
-   **권한 관리**: 어떤 구글 계정이 콘솔에 들어올 수 있는지
-   **삭제 범위**: 프로젝트를 지우면 안의 데이터가 전부 사라진다


### 프로젝트 ID

-   전 세계에서 유일한 값 (예: `bookclub-app-4f21`)
-   생성 후 변경 불가
-   모든 앱 설정에 동일하게 들어간다


## 3. 앱(App)


### 앱이 하는 일

-   프로젝트에 "나는 이런 서비스하는것"
-   등록하면 접속용 설정값(config)을 발급받는다
-   이 설정값을 코드에 넣어야 Firebase SDK가 연결된다


### 앱 종류와 식별자

| 유형 | 식별 기준 | 발급물 |
| --- | --- | --- |
| **웹 앱** | 자동 생성 appId | firebaseConfig 객체 |
| Android | 패키지명 (com.example.app) | google-services.json |
| iOS | 번들 ID | GoogleService-Info.plist |
| Flutter/Unity | 플랫폼별 동일 | 각 플랫폼 설정 파일 |


### 웹 앱 설정값 예시

~~~js
const firebaseConfig = {
  apiKey: "AIzaSy...",              // 공개되어도 되는 값
  authDomain: "bookclub.firebaseapp.com",
  projectId: "bookclub-app",        // 프로젝트 식별자 — 앱끼리 동일
  storageBucket: "bookclub-app.appspot.com",
  messagingSenderId: "123456789",
  appId: "1:123456789:web:abc123"   // 앱 식별자 — 앱마다 다름
};
~~~

-   `projectId` 가 같으면 같은 데이터를 본다
-   `appId` 는 앱마다 다르지만, 이것은 통계·분석 구분용이지 접근 권한과는 무관하다


### 앱을 여러 개 등록하면

-   회원 DB를 공유한다 → 웹에서 가입한 사람이 앱에서도 그대로 로그인
-   Firestore 데이터를 공유한다 → 별도 동기화 코드가 필요 없다
-   삭제해도 데이터는 남는다 → 앱 삭제는 등록 해제일 뿐


## 4. 비유: 은행 계좌와 카드


### 대응 관계

| Firebase | 은행 |
| --- | --- |
| 프로젝트 | **계좌** |
| Firestore 데이터 | 계좌의 잔고와 거래내역 |
| 앱 | **그 계좌에 연결된 카드** |
| 웹 앱 / 안드로이드 앱 / 관리자 화면 | 실물카드 / 모바일페이 / 인터넷뱅킹 |
| apiKey, appId | 카드에 적힌 번호 |
| 보안 규칙 | 비밀번호와 인증 절차 |
| 프로젝트 삭제 | 계좌 해지 |


## 5. 판단 기준


### 프로젝트 1개 + 앱 여러 개 (대부분의 경우)

-   사용자용 웹 + 관리자용 웹
-   웹 + 안드로이드 + iOS
-   즉, **같은 회원과 같은 데이터를 쓰는 모든 화면**


### 프로젝트를 분리 (데이터가 섞이면 안 될 때)

-   개발/테스트용 vs 실서비스용
-   완전히 다른 서비스 (독서모임 앱과 쇼핑몰)
-   고객사별로 데이터가 완전히 격리되어야 하는 경우


## 6. 실전 예시: 독서모임 출석 앱


### 구성

    프로젝트: bookclub-app  (asia-northeast3 / 서울)
    ├─ Authentication : 회원 계정 (김철수, 이영희 …)
    ├─ Firestore      : members, attendance, books
    ├─ Storage        : 프로필 사진
    └─ 등록된 앱
       ├─ 웹 앱 "출석"    appId: 1:123:web:aaa   ← 회원용
       ├─ 웹 앱 "관리자"  appId: 1:123:web:bbb   ← 총무용
       └─ Android 앱     com.bookclub           ← 추후 추가


### 동작

1.  김철수가 회원용 웹에서 가입 → Authentication에 계정 생성
2.  출석 버튼 → Firestore `attendance` 에 문서 추가
3.  총무가 관리자 웹 접속 → **데이터 이전 작업 없이** 김철수의 출석 기록이 보임
4.  나중에 안드로이드 앱 출시 → 김철수는 같은 이메일로 그대로 로그인


## 7. 체크리스트

-   [ ] 프로젝트 리전을 서울(asia-northeast3)로 지정했는가 — 변경 불가
-   [ ] 개발용/실서비스용 프로젝트를 분리했는가
-   [ ] 같은 데이터를 쓰는 화면들은 같은 프로젝트에 앱으로 등록했는가
-   [ ] Firestore 보안 규칙을 테스트 모드에서 잠금 모드로 바꿨는가
-   [ ] 배포 도메인을 Authentication 승인 도메인 목록에 추가했는가
-   [ ] apiKey를 숨기려 애쓰는 대신 보안 규칙을 점검했는가


# Firebase Project 생성


## project 생성

-   Project 를 생성 하거나 기존 Project 를 생성 합니다

    <img src="/org-assets/4bc6f3fa-20260719_183404_screenshot.png" alt="20260719_183404_screenshot.png" width="800">


## App 추가

-   project 안에 속하는 app 을 등록합니다
-   "web app"  선택

![20260719_183841_screenshot.png](/org-assets/4af35a71-20260719_183841_screenshot.png)

![20260719_184511_screenshot.png](/org-assets/a55c67d0-20260719_184511_screenshot.png)

<img src="/org-assets/a8584e01-20260719_184557_screenshot.png" alt="20260719_184557_screenshot.png" width="400">


# 설정값 확인하기


## 설정값 확인

-   프로젝트 개요&ndash;> 설정(톱니바퀴)&ndash;> 일반 &ndash;>앱 이름선택&ndash;> 복사 아이콘 클릭
    ![20260218_170715_screenshot.png](/org-assets/064aca57-20260218_170715_screenshot.png)


## firebase 설정

Firebase  설정확인
각자 설정한 계정, Projet, app 이름을 확인합니다
  (minux4air@gmail.com, myProject, cccf\_webinput)

<img src="/org-assets/0c889801-20260218_164702_screenshot.png" alt="20260218_164702_screenshot.png" width="800">


# 가입 방법 추가

-   Authenticifcation &ndash;> 로그인방법 &ndash;> email 추가

![20260218_165055_screenshot.png](/org-assets/7741bade-20260218_165055_screenshot.png)


# Firestore Database 보안설정

-   Firestore Database 를 설정합니다.
-   Firestore Database 는 text 기반 데이터 저장 전용 입니다
    (이미지도 가능하지만 한번에 저장될 때 최대 1M 를 넘지 못합니다)

-   "true"  설정은 테스트,개발용 입니다. 추후 보안 설정을 변경해야 합니다

<img src="/org-assets/74660230-20260218_165801_screenshot.png" alt="20260218_165801_screenshot.png" width="800" class="hover-pop">


# 예제: 회원가입 만들기

-   회원가입 기능을 만듭니다.
-   일반회원/ 관리자 레벨 2가지로 구성합니다
-   일반회원은 간단한글쓰기 ,관리자는 일반회원을관리하고 일반회원이 쓴 글을 관리/삭제 합니다
-   자신의 앱의 Config 정보를 firebase에서 확인하고 같이 제공합니다(수동설정)
    (자동설정: AI Studio 에서 firebase 사용을 명시하면 &ndash;> 같은 계정으로 자동으로  설정 됩니다.)

~~~markdown
## Instruction
- 회원가입 기능을 만듭니다.
- 일반회원/ 관리자 레벨 2가지로 구성합니다
- firebase를 이용하여 {firebase config}  를 이용하여 구현하라
- 언어: 한글
- 디자인: 모던,심플, 세련
## firebase config
```
// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "발급 받은 API key",
  authDomain: "앱 도메인 주소",
  projectId: "org-prac",
  storageBucket: "org-prac.firebasestorage.app",
  messagingSenderId: "265376769133",
  appId: "앱 ID",
  measurementId: "*******"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
```
~~~


## 결과

<img src="/org-assets/c2308fbe-20260719_191038_screenshot.png" alt="20260719_191038_screenshot.png" width="300">


# ****&mdash; 체크포인트 ---****

[https://ai.studio/apps/93bfa46a-c03d-4303-8921-4b4cd2c4aef0](https://ai.studio/apps/93bfa46a-c03d-4303-8921-4b4cd2c4aef0)


# 회원가입

-   Authentification 의 email  항목 데이터 추가 확인
-   회원가입으로 DB확인


## 이메일 로그인 추가

1.  로그인 방법추가
    -   Authenticifcation &ndash;> 로그인방법 &ndash;> email 추가

<img src="/org-assets/02bf94a7-20260718_140239_screenshot.png" alt="20260718_140239_screenshot.png" width="800">

1.  회원가입

<img src="/org-assets/fc826ea4-20260719_191224_screenshot.png" alt="20260719_191224_screenshot.png" width="400">

1.  로그인 후 화면

<img src="/org-assets/f3d4a8a8-20260719_191511_screenshot.png" alt="20260719_191511_screenshot.png" width="800">


## DB  확인

-   Authentification DB 확인

![20260719_191430_screenshot.png](/org-assets/d3798390-20260719_191430_screenshot.png)

-   FireStore DB 확인
    -   "role" 의 값이 member  입니다.
    -   관리자는 보통 "admin", "root" 와 같은 값으로 구분합니다

<img src="/org-assets/4004d025-20260719_192032_screenshot.png" alt="20260719_192032_screenshot.png" width="800">


# 관리자 화면

-   관리자로 가입합니다


## 관리자 화면

-   회원관리 메뉴에서 회원관리 기능 ![20260719_192300_screenshot.png](/org-assets/226cd2a6-20260719_192300_screenshot.png)


## 관리자 DB

![20260719_192434_screenshot.png](/org-assets/d7542269-20260719_192434_screenshot.png)

![20260719_192402_screenshot.png](/org-assets/484407ef-20260719_192402_screenshot.png)
