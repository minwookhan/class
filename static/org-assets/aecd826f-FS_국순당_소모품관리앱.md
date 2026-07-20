# FS - 국순당 소모품 구매신청 및 재고관리 앱 기능명세서

## 1. 시스템 구성

| 영역 | 사용 기술 |
|---|---|
| 프론트엔드 | Google AI Studio 생성 웹앱(반응형) |
| 인증 | Firebase Authentication (이메일/비밀번호) |
| 데이터베이스 | Firebase Firestore |
| 파일 저장(엑셀 업로드 등) | Firebase Storage |
| 엑셀 출력 | SheetJS(xlsx) |
| PDF 출력 | jsPDF 또는 html2pdf |
| 알림 | Firestore 기반 인앱 알림 컬렉션(웹푸시 미사용) |

---

## 2. 권한 매트릭스

| 기능 | 일반회원 | 관리자 |
|---|:---:|:---:|
| 회원가입/로그인 | O | O |
| 회원 승인 | X | O |
| 회원 권한 승격 | X | O |
| 품목 신청(고정/추가/탕비) | O | X |
| 본인 신청현황 조회 | O | O(전체) |
| 신청 취소(대기 상태) | O(본인 건) | O(전체) |
| 신청 승인/거절/취소 처리 | X | O |
| 구매완료 처리 | X | O |
| 고정/탕비 품목 관리(CRUD) | X | O |
| 재고 수동 수정/엑셀 업로드 | X | O |
| 부서 예산 설정 | X | O |
| 통계 리포트 조회 | X | O |
| 통합신청내역 엑셀 출력 | X | O |
| 전체불출내역 PDF 출력 | X | O |

---

## 3. 데이터 모델 (Firestore Collection)

### users
| 필드 | 타입 | 설명 |
|---|---|---|
| uid | string | Firebase Auth UID |
| email | string | 이메일 |
| name | string | 이름 |
| department | string | 소속부서(5개 팀 중 1) |
| role | string | general \| admin |
| status | string | pending \| approved \| disabled |
| createdAt | timestamp | 가입일 |

### items (고정품목/탕비위생품목 공용, type으로 구분)
| 필드 | 타입 | 설명 |
|---|---|---|
| itemId | string | 상품코드(고유값) |
| name | string | 품목명 |
| unit | string | 단위(EA, 켤레, box 등) |
| price | number | 단가 |
| type | string | fixed \| pantry |
| stockQty | number | 현재 재고수량 |
| minStockAlertYn | boolean | false 고정(기능 미사용) |
| createdAt | timestamp | 등록일 |
| updatedAt | timestamp | 최종수정일 |

### extraItems (추가품목 - 신청 건 종속, 공용목록 아님)
| 필드 | 타입 | 설명 |
|---|---|---|
| extraItemId | string | 자동 생성 고유번호(중복검사 로직 포함) |
| requestId | string | 소속 신청 건 ID |
| name | string | 품목명 |
| unit | string | 단위 |
| price | number | 단가(신청자 입력) |

### requests (신청 건 = 장바구니 단위)
| 필드 | 타입 | 설명 |
|---|---|---|
| requestId | string | 신청 건 ID |
| userId | string | 신청자 UID |
| department | string | 신청자 부서 |
| status | string | pending \| approved \| rejected \| canceled \| purchased |
| totalAmount | number | 신청금액 합계(자동계산) |
| createdAt | timestamp | 신청일 |
| processedAt | timestamp | 관리자 처리일 |
| processedBy | string | 처리 관리자 UID |
| canceledReason | string | 취소(반려) 사유 |
| year | number | 귀속 연도(연도 초기화 기준) |

### requestItems (신청 건 내 품목 라인)
| 필드 | 타입 | 설명 |
|---|---|---|
| requestId | string | 상위 신청 건 ID |
| itemType | string | fixed \| pantry \| extra |
| itemId | string | items 또는 extraItems 참조 |
| itemName | string | 품목명(스냅샷) |
| unitPrice | number | 단가(스냅샷) |
| qty | number | 신청수량 |
| lineAmount | number | 단가×수량 |
| receivedQty | number | 구매완료 시 입고수량 |

### budgets (부서별 월 예산)
| 필드 | 타입 | 설명 |
|---|---|---|
| department | string | 부서명 |
| yearMonth | string | YYYY-MM |
| limitAmount | number | 예산 한도 |
| usedAmount | number | 사용(승인) 누적금액 |

### notifications
| 필드 | 타입 | 설명 |
|---|---|---|
| userId | string | 수신자 UID |
| type | string | approved \| rejected \| canceled \| newRequest |
| requestId | string | 관련 신청 건 |
| isRead | boolean | 읽음 여부 |
| createdAt | timestamp | 생성일 |

---

## 4. 화면 목록

### 일반회원
1. 로그인 / 회원가입 (부서 선택 포함)
2. 승인대기 안내 화면
3. 홈(신청하기 진입)
4. 품목 검색/선택 화면(고정품목 / 탕비위생품목 - 이름·상품코드 검색)
5. 추가품목 등록 화면(품목명/단위/단가/수량 입력)
6. 장바구니 화면(담은 품목 리스트, 수량 수정, 합계금액 표시)
7. 신청 완료 화면
8. 내 신청현황 리스트/상세(상태별 필터, 대기 건 취소 버튼)
9. 알림함(뱃지)

### 관리자
1. 회원 승인 관리(가입대기 리스트 승인/거절)
2. 회원 관리(부서/권한 수정, 비활성화)
3. 부서별 통합 신청 현황(대시보드)
4. 신청 상세/처리(승인/거절/취소 버튼, 취소사유 입력)
5. 구매예정 내역서(승인된 건 목록)
6. 구매완료 처리 화면(입고수량 입력 → 재고 자동반영)
7. 품목 관리(고정품목/탕비위생품목 CRUD)
8. 재고 관리(현재고 조회, 수동수정, 엑셀 일괄 업로드)
9. 부서별 예산 설정 화면
10. 통계 리포트 화면(부서별/품목별/기간별 표+그래프, 기간 필터)
11. 통합신청내역 엑셀 출력(월 선택)
12. 전체불출내역 PDF 출력(기간 선택)
13. 알림함(뱃지)

---

## 5. 상태 흐름(신청 건 status)

```
[대기 pending]
   ├─(본인 취소)→ [canceled-by-user] (완전 종료)
   ├─(관리자 거절)→ [rejected] (완전 종료, 신청 삭제 처리)
   ├─(관리자 취소=반려)→ [canceled] → 신청자 수정 후 재제출 → [대기 pending] 복귀
   └─(관리자 승인)→ [approved] → 구매예정 내역서 등재
                          └─(구매완료 처리, 입고수량 입력)→ [purchased]
                                  └─ 재고 자동 차감 + 전체불출내역 데이터 반영
```

---

## 6. 주요 로직 명세

### 6-1. 추가품목 고유번호 생성
- 규칙: `EXT-{연도}-{일련번호 6자리}` 형태 등 기존 items.itemId와 겹치지 않는 채번
- 신청 저장 시 extraItems 컬�션에서 최대 일련번호 조회 후 +1 채번, 트랜잭션으로 중복 방지

### 6-2. 신청금액 자동계산
- `lineAmount = unitPrice × qty`
- `requests.totalAmount = Σ requestItems.lineAmount`

### 6-3. 예산 초과 체크
- 신청 승인 시점에 `budgets.usedAmount += totalAmount`
- `usedAmount > limitAmount` 이면 관리자 화면에 경고 배지 표시(승인 자체를 막지는 않음, 경고만)

### 6-4. 재고 자동 차감
- 구매완료 처리 시: `items.stockQty = items.stockQty + receivedQty - approvedQty(그동안 승인되어 대기중인 지급수량)`
- 관리자가 화면에서 수동 값 수정 가능(변경이력 로그 권장)
- 엑셀 일괄 업로드 시 상품코드 기준 매칭 후 재고수량 일괄 갱신

### 6-5. 알림 트리거
| 이벤트 | 수신자 | 알림 타입 |
|---|---|---|
| 회원가입 발생 | 관리자 | newMember |
| 회원가입 승인 | 해당 회원 | memberApproved |
| 신규 신청 제출 | 관리자 | newRequest |
| 신청 승인 | 신청자 | approved |
| 신청 거절 | 신청자 | rejected |
| 신청 취소(반려) | 신청자 | canceled |

### 6-6. 연도 초기화
- 매년 1/1 기준 신규 `year` 값으로 신청/통계 데이터 구분
- 리포트/대시보드 기본 조회 범위는 당해 연도, 과거 연도는 별도 선택하여 조회만 가능(수정 불가)

---

## 7. 리포트 출력 명세

### 7-1. 통합신청내역(엑셀) - `2_통합신청내역.xlsx` 양식 기준
- 시트 구성: 고정품목 섹션 / 탕비실·위생용품 섹션 / 추가발주용품 섹션
- 컬럼: NO, 품명, 상품코드, 단위, 단가, 1~12월 구입량/구입금액, 구입량·금액 누계
- 관리자가 출력 시 연도 및 월 범위를 선택하여 생성
- 부서 필터 선택 가능(부서별 출력 지원)

### 7-2. 전체불출내역(PDF) - `1_전체불출내역.pdf` 양식 기준
- 부서별로 페이지 구성(부서명 헤더 표시)
- 컬럼: No, 날짜, 품목, 입고수량, 사용수량, 재고수량, 사용처, 비고
- "구매완료" 처리된 신청 건 데이터를 기간(시작일~종료일) 선택 후 관리자가 수동 생성

### 7-3. 통계 리포트(화면 + 엑셀)
- 필터: 부서, 품목, 기간(주/월/분기/연)
- 표: 선택 조건별 신청수량/금액 집계
- 그래프: 기간별 추이(라인/바 차트), 부서별 비중(파이/바 차트)
- 엑셀 다운로드 지원

---

## 8. 예외/에러 처리
- 재고수량보다 많은 수량 신청 시: 신청은 허용(재고는 발주로 채워지는 구조), 단 관리자 화면에 재고부족 표시
- 동일 추가품목 중복 채번 방지: 트랜잭션 처리
- 승인 처리 중 예산초과 시: 승인은 가능하되 경고 노출(강제 차단 아님)
- 관리자 승인 전 미승인 회원 로그인 시: 승인대기 안내화면으로 리다이렉트
- 비활성화된 계정 로그인 시: 로그인 차단 안내

---

## 9. 향후 검토(이번 범위 제외, 후속 검토 대상)
- 최소재고 미달 알림
- 웹푸시/이메일 알림 연동
- 품목별 개별 승인
- 신청 첨부파일/링크
