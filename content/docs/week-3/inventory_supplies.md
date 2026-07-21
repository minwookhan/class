---
title: "재고 소모품관리"
linkTitle: "재고 소모품관리"
weight: 4
toc: true
---



# PRD , FS 생성


## PRD 요청 양식

-   PRD 요청용 프롬프트 양식
-   [prd\_요청\_ 양식보기](/org-assets/440251a2-prd-template.html)
-   [prd\_요청\_프롬트프 양식 다운로드](/org-assets/ed3c2837-prd_template.md)


## PRD 요청 Prompt

-   내게 꼭 맞고 정확한 PRM 문서 작성을 위해서 충분한 정보를 제공해야 합니다.
-   혼자 고민하면 놓치는 것도 많고 전문적인 영역의 정보가 부족합니다
-   LLM 에게 나의 제작배경을 충분히 설명 하고 필요한 기능을 대화로 구체화 합니다.
-   대화가 끌나면 먼저 앱의 제작 설계도인 **PRM** 문서를 생성합니다
-   PRM 문서 기반으로 어떻게 기능이 기술적으로 구현 할지 **FS** (Functional Specification) 문서를 작성합니다

~~~markdown
# Instruction
1. 너는 웹앱 기획 전문가이다.
2. 나는 초보자 이다. . 전문용어는 쉽게 설명하라(용어 해설 추가)
3. 나는 {개발앱목적}을 만들고 싶다.
4. google ai studio 를 사용한다.
5. PRD문서, FS 문서를 작성하려 한다. 
6. PRD 문서 작성을 위한 토론을 하자.
7. 필요한 정보는 나에게 질문하라
8. 서술어, 수식어 없이 핵심만 간단한 대화식 진행
9. 대답은 선택 질문시 객관식 선택사항 또는 단답형
10. 웹앱의 기능 정보는 {Rule} 을 참고해.
## 개발앱목적
- 소모품 구매 신청 및 소모품 재고 관리 앱 제작
- 일반사원이 신청하면 관리자가 승인,관리한다.
## Strong Rule
1. 내가 "됐어" 할 때 까지 PRD관련 검토와 질문을 이어가라.
2. 답변을 받으면 예상되는 문제와 개선책을 고민해서 대화를 이어가라
3. 더 나은 새로운 기능과 아이디어가 있으면 적극 추천하라
4. 대화가 종료되면 "PRD 문서", "FS문서" 를 Markdown  으로 출력
## Rule
1. 회사는 [생산지원팀, 양조1팀, 양조2팀, 품질보증팀, 설비기술팀 ] 으로 구성됨
2. 일반회원, 관리자로 구성됨.
3. 
### 신청품목 종류
1. 고정품목: 관리자가 관리하는 품목
2. 추가품목: 신청자가 신청할 때 생성할 수 있음
3. 탕비위생품목: 관리자가 관리하는 품목
### 일반회원(행위자1)
#### 고정품목 선택
1. 나는 고정품목 목록중에서  {품목이름, 상품코드} 로 리스트를  검색해서 고른다.
2. 품목과 개수를 결정한다.
4. 신청 버튼을 누르면 완료
5. 나의 신청현황과 상태를 확인할 수 있다.
6. 신청이 관리자에 의해 허가 되면 나는 앱을 통해 알람을 받는다.
#### 추가항목 선택
1. 나는 선택목록 으로 품목필드의 데이터를 입력 해서 새로운 레코드를 추가생성한다
2. 새로운 고유번호는 기존 번호와 겹치지 않게 생성하는 "고유번호생성" 기능이 있다.
2. 품목과 개수를 결정한다.
4. 신청 버튼을 누르면 완료
5. 나의 신청현황과 상태를 확인할 수 있다.
6. 신청이 관리자에 의해 허가 되면 나는 앱을 통해 알람을 받는다.
#### 탕비위생용품 선택
1. 나는 탕비위생용품 목록중에서  {품목이름, 상품코드} 로 리스트를  검색해서 고른다.
2. 품목과 개수를 결정한다.
4. 신청 버튼을 누르면 완료
5. 나의 신청현황과 상태를 확인할 수 있다.
6. 신청이 관리자에 의해 허가 되면 나는 앱을 통해 알람을 받는다.
### 관리자(행위자2)
1. 나는 회원들의 가입 여부를 승인 할 수있다.
2. 회원들의 가입정보를 관리할 수 있다.
3. 각 부서별로 신청된 통합 현황을 볼 수 있다.
4. 부서별 신청 사항을 [승인, 취소, 거절,구매완료] 한다.
   - 승인: "구매예정 내역서" 추가 대상
   - 취소: 신청자에게 취소 통보 및 수정 요청 할 수 있음.
   - 거절: 신청 삭제
5. 지난 소모품 신청 통계 정리 리포트 제작
   - 부서별, 품목별,시간(주간, 월, 분기, 연간) 으로 리포트 페이지
   - 엑셀로 출력
6. 신청 내역을 "통합신청내역"(부서별) 엑셀 리포트로 출력(월 지정 가능)
7. "구매완료" 항목에 대해 "전체불출내역" 리포트 생성및 pdf 출력
### 추가참고 정보
1. "전체불출내역" 예제 파일: 1_전체불출내역.pdf
2. "통합신청내역" 에제 파일: 2_통합신청내역.xlsx
~~~


## prd 요청하기

-   첨부 파일
-   1. 불출대장

![    불출대장](/org-assets/b58be974-2026-07-20_18-29_1.png)

-   2. 통합신청 내역.xlsx
    
    [통합신청내역](/org-assets/72368628-2_%ED%86%B5%ED%95%A9%EC%8B%A0%EC%B2%AD%EB%82%B4%EC%97%AD.xlsx)

![20260719_135015_screenshot.png](/org-assets/6c6e1456-20260719_135015_screenshot.png)


## 대화내역

-   대화내용 요약.

<iframe class="embedded-html-frame"
        src="/apps/week-3/my-page/prc_conv.html"
        title="PRD 대화"></iframe>


## 요청 결과

-   PRD, FS 문서

<iframe class="embedded-html-frame"
        src="/apps/week-3/my-page/국순당_소모품관리앱_PRD-FS.html"
        title="PRD 대화"></iframe>

<img src="/org-assets/8f6fbf7d-20260719_140703_screenshot.png" alt="20260719_140703_screenshot.png" width="800">

-   PRD 요청 결과 
    [prd\_소모품신청](/org-assets/570ddeaa-PRD_%EA%B5%AD%EC%88%9C%EB%8B%B9_%EC%86%8C%EB%AA%A8%ED%92%88%EA%B4%80%EB%A6%AC%EC%95%B1.md)  
    
    ~~~markdown
    # PRD - 국순당 소모품 구매신청 및 재고관리 앱
    
    ## 1. 개요
    
    | 항목 | 내용 |
    |---|---|
    | 프로젝트명 | 국순당 소모품 구매신청/재고관리 앱 |
    | 목적 | 부서별 소모품 구매신청 프로세스 전산화 + 재고 실시간 관리 |
    | 개발환경 | Google AI Studio |
    | 인증/DB | Firebase (Authentication, Firestore) |
    | 플랫폼 | 반응형 웹앱 (모바일 + PC) |
    | 기존 방식 문제 | 종이/엑셀 대장 수기작성 → 이력 누락, 재고파악 지연, 취합 리포트 작업 과다 |
    
    ### 용어 설명
    - **PRD**: 제품요구사항문서. 앱이 해야 할 일을 정의한 문서
    - **FS**: 기능명세서. PRD를 실제 개발 단위 기능으로 구체화한 문서
    - **고정품목**: 관리자가 미리 등록·관리하는 표준 소모품 목록
    - **추가품목**: 신청자가 신청 시점에 직접 새로 등록하는 품목(해당 신청 건 한정)
    - **탕비위생품목**: 관리자가 관리하는 탕비실/위생용품 전용 목록
    - **장바구니 신청**: 여러 품목을 한 번에 담아 하나의 신청 건으로 제출하는 방식
    
    ---
    
    ## 2. 대상 사용자
    
    ### 조직 구조
    - 부서: 생산지원팀, 양조1팀, 양조2팀, 품질보증팀, 설비기술팀
    
    ### 역할(Role)
    | 역할 | 설명 |
    |---|---|
    | 일반회원 | 소모품 신청, 본인 신청현황 조회 |
    | 관리자 | 회원승인, 신청처리(승인/거절/취소/구매완료), 재고관리, 예산관리, 리포트 |
    
    - 관리자는 전체 부서 통합 권한(모든 부서 신청 처리 가능)
    - 최초 관리자 1명은 수동 생성, 이후 관리자가 다른 회원을 관리자로 승격 가능
    
    ---
    
    ## 3. 사용자 시나리오
    
    ### 3-1. 회원가입 및 로그인
    1. 이메일로 회원가입(Firebase 이메일 인증), 도메인 제한 없음
    2. 가입 시 소속 부서 본인 선택
    3. 관리자 승인 전까지 앱 이용 불가(대기 상태)
    4. 관리자 승인 완료 시 알림 뱃지 수신, 로그인 가능
    
    ### 3-2. 소모품 신청(일반회원)
    1. 품목 종류 선택: 고정품목 / 추가품목 / 탕비위생품목
    2. 고정품목·탕비위생품목: 품목이름/상품코드로 검색 후 선택
    3. 추가품목: 신규 품목정보 직접 입력, 시스템이 고유번호 자동 생성(중복 방지)
    4. 품목·수량을 장바구니에 담아 여러 품목을 한 번에 신청
    5. 신청 시 품목 단가 기준 신청금액 자동 계산
    6. 신청 완료 후 "대기" 상태로 등록
    7. 마이페이지에서 본인 신청현황/상태 확인
    8. 대기 상태인 신청 건은 본인이 직접 취소 가능
    9. 관리자 승인 시 알림 뱃지 수신
    
    ### 3-3. 신청 처리(관리자)
    1. 부서별 통합 신청 현황 조회
    2. 신청 건(장바구니 단위) 승인 / 취소 / 거절 처리
       - **승인**: "구매예정 내역서" 대상으로 이동
       - **취소**: 신청자에게 반려 통보, 신청자는 수정 후 재제출 가능(기존 신청 유지)
       - **거절**: 신청 삭제
    3. 부서별 월 예산 한도 설정, 초과 시 경고 표시
    4. 구매 완료 처리
       - 처리 시 입고수량 입력
       - 재고수량 자동 차감(수동 수정 가능, 엑셀 일괄 입력 지원)
       - "전체불출내역" 데이터로 반영
    
    ### 3-4. 리포트/통계(관리자)
    1. 부서별, 품목별, 기간별(주간/월/분기/연간) 통계를 표 + 그래프로 확인
    2. "통합신청내역" 부서별 엑셀 리포트 출력(월 지정 가능)
    3. "전체불출내역" PDF 리포트를 관리자가 원하는 기간 선택 후 수동 생성/출력
    
    ---
    
    ## 4. 핵심 기능 요구사항
    
    ### 4-1. 인증/회원관리
    - Firebase 이메일 회원가입/로그인
    - 가입 시 부서 선택 필수
    - 관리자 승인 전 서비스 이용 제한
    - 관리자 승격 기능(관리자→관리자 지정)
    - 퇴사자 계정 비활성화 처리(신청이력은 보존, 삭제하지 않음)
    
    ### 4-2. 품목 관리
    - 고정품목/탕비위생품목: 관리자 CRUD(등록/수정/삭제), 품목이름·상품코드·단위·단가 관리
    - 추가품목: 신청자가 신청 시 생성, 고유번호 자동생성 로직 필요, 해당 신청 건에만 종속(공용목록 미등록)
    
    ### 4-3. 신청 기능
    - 장바구니형 신청(여러 품목 동시 담기)
    - 신청 시 금액 자동계산(단가 × 수량)
    - 신청 상태: 대기 → 승인/거절/취소
    - 신청자 본인 취소: 대기 상태에서만 가능
    - 신청현황 리스트/상세 조회
    
    ### 4-4. 승인/구매 프로세스
    - 신청 건 단위 일괄 승인/거절/취소(품목별 개별승인 없음)
    - 승인 시 "구매예정 내역서" 자동 추가
    - 구매완료 처리 시 입고수량 입력 → "전체불출내역" 반영
    
    ### 4-5. 재고 관리
    - 품목별 재고수량 관리(입고/사용/재고 자동계산)
    - 승인·구매완료 처리 시 재고 자동 차감
    - 관리자 수동 수정 가능
    - 엑셀 일괄 업로드로 재고 일괄 반영 가능
    - 최소재고 알림 기능은 미적용(범위 제외)
    
    ### 4-6. 예산 관리
    - 부서별 월 예산 한도 설정
    - 예산 초과 시 관리자 화면에 경고 표시
    
    ### 4-7. 알림
    - 인앱 알림 뱃지 방식(웹푸시 아님)
    - 대상: 일반회원(승인/반려/거절 통보), 관리자(신규 신청 발생 통보)
    
    ### 4-8. 리포트/출력
    - 통계 리포트: 부서별/품목별/기간별(주/월/분기/연) 표+그래프
    - "통합신청내역" 엑셀 출력(월 지정, 부서별) - 첨부 예제파일 양식 기준
    - "전체불출내역" PDF 출력(관리자가 기간 선택, 수동 생성) - 첨부 예제파일 양식 기준
    
    ### 4-9. 데이터 정책
    - 연도가 바뀌면 새 연도 문서로 초기화(과거 데이터는 조회만 가능, 삭제 아님)
    
    ---
    
    ## 5. 비기능 요구사항
    
    | 구분 | 내용 |
    |---|---|
    | 플랫폼 | 반응형 웹(모바일/PC 모두 지원) |
    | 인증 | Firebase Authentication |
    | 데이터저장 | Firebase Firestore |
    | 보안 | 이메일 인증 + 관리자 승인 2중 게이트(도메인 제한 없음) |
    | 파일출력 | 엑셀(xlsx), PDF |
    | 언어 | 한국어 |
    
    ---
    
    ## 6. 범위 제외(Out of Scope)
    
    - 최소재고 미달 알림 기능
    - 웹푸시/카카오톡/이메일 알림(인앱 뱃지만 지원)
    - 품목별 개별 승인/거절(신청 건 단위만 지원)
    - 신청 시 첨부파일/참고링크 첨부
    - 추가품목의 공용목록 등록(신청 건 한정 사용)
    - 앱 내 실제 결제/구매 처리(오프라인 구매 후 상태만 기록)
    
    ---
    
    ## 7. 참고 자료
    - `1_전체불출내역.pdf`: 부서별 소모품 불출대장 양식(전체불출내역 리포트 참고 양식)
    - `2_통합신청내역.xlsx`: 연간 품목별/월별 구입량·금액 집계 양식(통합신청내역 리포트 참고 양식)
    ~~~

-   FS 문서

[fs\_소모품신청](/org-assets/aecd826f-FS_%EA%B5%AD%EC%88%9C%EB%8B%B9_%EC%86%8C%EB%AA%A8%ED%92%88%EA%B4%80%EB%A6%AC%EC%95%B1.md)  

~~~markdown
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
~~~


# System prompt 입력


## system prompt

1.  전체 코딩하는데 큰 기준을 알려줍니다(헌법과 같음)

~~~markdown
1. 단계별로 step by step 구현하라
2. 현재의 Prompt가 이 전의 작업 내용에 미치는 영향을 검토하라
3. 단위 작업을 테스트 하면서 진행하라 (TDD)
~~~

<img src="/org-assets/8c5094ba-20260718_124328_screenshot.png" alt="20260718_124328_screenshot.png" width="600">

<img src="/org-assets/6f3cf24c-20260718_124428_screenshot.png" alt="20260718_124428_screenshot.png" width="300">


# 제작 Prompt


## PRD 기반 prompt  입력

![20260719_141925_screenshot.png](/org-assets/36dcae53-20260719_141925_screenshot.png)

~~~markdown

- 소모품 신청  앱을 만든다 
- 첨부한 PRD, FS 문서를 참고해서 step by step 으로 구현하라.
- 언어: 한국어
- 디자인: 모던 , 심플, 세련된 office 느낌 디자인
~~~


## Firebase 자동설정, 기본디자인 선택

1.  firebase자동 설정 동의
    -   firebase, ai studio 모두 google 제품 입니다
    -   ai studio에서 firebase 설정을 자동으로 설정 할 수 있습니다.
    -   하지만 관리자 지정, 로그인방법 설정은 수동으로 설정해야 합니다
2.  기본 디자인 선택
    
    <img src="/org-assets/5a847726-20260718_123850_screenshot.png" alt="20260718_123850_screenshot.png" width="800">
    
    -   빠른 제작을 위해 기본 minimal 위주로 선택합니다
    -   디자인은 나중에 변경 가능하므로 기능위주로 일단 제작합니다


### 결과

<img src="/org-assets/5c63cea2-20260718_125558_screenshot.png" alt="20260718_125558_screenshot.png" width="300">


## 결과

-   초기 로그인/회원가입

<img src="/org-assets/fb541560-20260719_143647_screenshot.png" alt="20260719_143647_screenshot.png" width="300">


# Firebase 설정


## DB 확인

-   DB가 자동 설정되 있습니다.
-   자동으로 설정된 Project ID 를 확인합니다
    
    ~~~markdown
     현재 설정한 Project ID와 Project 내의 APP 이름은?
    ~~~

![20260719_144849_screenshot.png](/org-assets/166fef7f-20260719_144849_screenshot.png)

1.  ai stuido에서 얻은  projecID를 확인하고 해당 project를 선택합니다
    -   "AI stuio"  표시:  ai studio가 자동으로 설정 한 것

<img src="/org-assets/3783f759-20260718_130600_screenshot.png" alt="20260718_130600_screenshot.png" width="800">


## 이메일 로그인 추가

-   Authenticifcation &ndash;> 로그인방법 &ndash;> email 추가

<img src="/org-assets/02bf94a7-20260718_140239_screenshot.png" alt="20260718_140239_screenshot.png" width="800">


# ---&ndash;&mdash;체크포인트-------


## 체크포인트 LINK

-   체크 포인트를 클릭하고 다시 화면상단의 "Remix"를 실행해야 합니다.
-   다른 사람의 링크는 코드와 Database 모두 복사 됩니다
-   내가 나만의 데이터로 사용하시려면 Database는 내 것으로 교체해야 합니다
-   "Remix" 하면 코드는 그대로, Database 만 내것으로 사용 합니다.
    
    [https://ai.studio/apps/1c7a791e-bdbb-41ea-92cd-2b07bd9f990e](https://ai.studio/apps/1c7a791e-bdbb-41ea-92cd-2b07bd9f990e)

![20260718_171700_screenshot.png](/org-assets/629e73e6-20260718_171700_screenshot.png)

<img src="/org-assets/1a14a50f-20260719_153916_screenshot.png" alt="20260719_153916_screenshot.png" width="600">


# 테스트 ID 추가


## 테스트 ID 가입

-   테스트용 ID 들을 가입합니다
-   비밀번호를 8글자이상, 대문자 1개, 특수문자 1개 이상 요구 할 수 도 있습니다
    
    ~~~quote
    관리자:  김관리, admin@ksd.com pw: 123456 팀: 양조1팀
    일반회원: 김유저1, user1@ksd.com pw: 123456 팀: 품질 보증팀
    일반회원: 김유저2, user2@ksd.com pw: 123456 팀: 생산지원팀
    ~~~


# 관리자 추가

-   관리자 승인으로 가입될 경우 관리자가 미리 설정 되어야 나머지 회원가입을 할 수있습니다
-   관리자는 DB 에서 보통 "role" 필드값에 따라 결정 됩니다(ex: admin, root)


## 관리자 추가

-   가입된 ID 중에 하나를 관리자로 선정합니다
-   Database 에서 해당 ID의 role 값을 관리자 값으로 설정합니다
-   ai studio 채팅창에서 **관리자** 값을 묻습니다.

~~~markdown
관리자용  아이디의 role 값은?
~~~

<img src="/org-assets/f50e2494-20260718_143806_screenshot.png" alt="20260718_143806_screenshot.png" width="400">

1.  db의 해당 필드값을  "admin"으로 변경합니다

<img src="/org-assets/7caf8647-20260718_143711_screenshot.png" alt="20260718_143711_screenshot.png" width="600">


## 회원 승인

-   "status" 와 같은 회원가입에 대한 변수값도 적용합니다

<img src="/org-assets/a6b5375f-20260719_150438_screenshot.png" alt="20260719_150438_screenshot.png" width="300">


## 다른 회원 승인

-   다른 테스트 ID가입하고 관리자로 로그인 해서 회원가입 승인 합니다

<img src="/org-assets/1755739a-20260719_153356_screenshot.png" alt="20260719_153356_screenshot.png" width="800">


## "승인" 버튼 동작안될 때


### 버튼 동작 안 될 때

-   "버튼" 이 눌러도 응답하지 않는 경우.
-   가상환경의 보안 정책상 "버튼", "팝업 윈도우" 등이 반응하지 않을때

-   개발자 도구켜기 &ndash;> F12 누르기
-   "console" 보기 선택
-   반응 없는 동작을 하면 "Console" 창에 빨간색의 에러메시지가 출력됩니다.
-   에러메시지를 복사해서 채팅창에 넣고 수정을 요청합니다

<img src="/org-assets/ca72a775-20260718_153450_screenshot.png" alt="20260718_153450_screenshot.png" width="800">

~~~markdown
"더미데이터 생성" 버튼을 클릭해도 응답하지 않는다.
아래는 디버그에러 정보이다. 수정하라
----
AdminEquipment.tsx:80 Ignored call to 'confirm()'. The document is sandboxed, and the 'allow-modals' keyword is not set.
~~~

<img src="/org-assets/e29049e5-20260718_153832_screenshot.png" alt="20260718_153832_screenshot.png" width="400">


# 테스트로그인 메뉴추가


## 테스트로그인 메뉴 추가

-   일반회원과 관리자의 기능 테스트를 하기위해서 자주 로그인을 바꿔 해야 합니다
-   매번 로그인 정보를 입력하기 귀찮으므로 자동 로그인 버튼으로 만듭니다

~~~markdown
## Menu
1. 테스트용 사용자 로그인 화면을 로그인메뉴에 추가해
2. 해당 아이디를 클릭하면 바로 로그인 되게 해
관리자: admin@ksd.com pw: abcD1234* 
일반회원: user1@ksd.com pw: abcD1234*
일반회원: user2@ksd.com pw: abcD1234*
~~~

<img src="/org-assets/dd506ff0-20260719_155533_screenshot.png" alt="20260719_155533_screenshot.png" width="400">


# 더미데이터 추가


## 더미데이터 추가

-   기능 테스트를 위해 더미 데이터 생성 기능을 추가합니다
-   앱이 완성되고 나면 일괄 삭제 할 수 있습니다

~~~markdown
관리자의 "품목관리" 화면에서  테스트용 "더미데이터생성"  기능을 구현하라.
- 데이터 개수를 입력 받는다.
- 다양한 내용의 데이터를 생성한다.
~~~


### 추가기능 테스트

-   "" 이 눌러도 응답하지 않는 경우.
-   가상환경의 보안 정책상 "버튼", "팝업 윈도우" 등이 반응하지 않을때

-   개발자 도구켜기 &ndash;> F12 누르기
-   "console" 보기 선택
-   반응 없는 동작을 하면 "Console" 창에 빨간색의 에러메시지가 출력됩니다.
-   에러메시지를 복사해서 채팅창에 넣고 수정을 요청합니다

<img src="/org-assets/ca72a775-20260718_153450_screenshot.png" alt="20260718_153450_screenshot.png" width="800">

~~~markdown
"더미데이터 생성" 버튼을 클릭해도 응답하지 않는다.
아래는 디버그에러 정보이다. 수정하라
----
AdminEquipment.tsx:80 Ignored call to 'confirm()'. The document is sandboxed, and the 'allow-modals' keyword is not set.
~~~

<img src="/org-assets/e29049e5-20260718_153832_screenshot.png" alt="20260718_153832_screenshot.png" width="400">


## 결과

-   정상적으로 추가 되었습니다.

<img src="/org-assets/f5423e31-20260719_162756_screenshot.png" alt="20260719_162756_screenshot.png" width="800">


# 테스트- 관리자


## 품목관리

1.  품목관리
    -   품목을 추가해 봅니다

<img src="/org-assets/7af6fd53-20260719_163408_screenshot.png" alt="20260719_163408_screenshot.png" width="600">
<img src="/org-assets/26e2afcb-20260719_163445_screenshot.png" alt="20260719_163445_screenshot.png" width="600">

1.  엑셀 일괄업로드 기능추가
    -   엑셀 파일로 일괄업로드 기능 추가합니다
    -   엑셀 양식을 제공합니다
    -   상품코드가 겹치면 개수를 추가하고 새로운 상품코드만 추가 합니다.
        
        ~~~markdown
            1. 엑셀 파일로 일괄업로드 기능 추가합니다
            2. 엑셀 양식을 제공합니다
            3. 상품코드가 겹치면 개수를 추가하고 새로운 상품코드만 추가 합니다.
        ~~~

![20260719_164244_screenshot.png](/org-assets/f9de650a-20260719_164244_screenshot.png)


## 예산관리

-   부서별 예산 제한 기능을 사용합니다

![20260719_164645_screenshot.png](/org-assets/1082a6bc-20260719_164645_screenshot.png)


## 리포트 기능

-   부서별 리포트 기능을 추가 합니다
-   현재 자료가 없서 생성 불가 상태입니다
-   우선 더미데이터로 부서별 과거 데이터를 추가  합니다
    
    1.  부서별 과거 더미데이터 생성
        
        ~~~markdown
            부서별 소모품 신청 과거 더미데이터를 생성기능 버튼(1년치) 를 추가하라
        ~~~
        
        <img src="/org-assets/6004fd28-20260719_165739_screenshot.png" alt="20260719_165739_screenshot.png" width="800">
    
    2.  리포트 출력
        
        -   차트 및 상세 통계대시 보드를 작성합니다
        -   원하는 출력,통계,시각화 형태 제공하거나 예제 이미지를 같이 붙여넣습니다
        -   현재 더미로 만든 과거 데이터를 사용합니다.
            
            ~~~markdown
               
                - 차트 및 상세 통계대시 보드를 작성하라
                - 부서별 (월, 분기, 년) 항목의 개수, 총액 등의 통계 자료 대시 보드 작성하라
                - 시각화의 데이터 요약도 테이블로 추가합니다.
            ~~~
        
        <img src="/org-assets/12533700-20260719_170801_screenshot.png" alt="20260719_170801_screenshot.png" width="800">


## 신청관리

-   더미 데이터로 만들어진 신청서 에서 "신청관리" 기능을 테스트 합니다

<img src="/org-assets/7d83473d-20260719_171007_screenshot.png" alt="20260719_171007_screenshot.png" width="800">
<img src="/org-assets/cc4075eb-20260719_171026_screenshot.png" alt="20260719_171026_screenshot.png" width="800">


## 회원관리

-   회원승인 및 관리자 승격 기능을 테스트 해봅니다

![20260719_171119_screenshot.png](/org-assets/9c8d9354-20260719_171119_screenshot.png)


# 테스트- 일반회원


## 소모품 신청

-   현재 소모품 내역이 "카드" 형태로 나옵니다
-   "리스트보기" 를 추가합니다
    ![20260719_171715_screenshot.png](/org-assets/aeed2954-20260719_171715_screenshot.png)

~~~markdown
- "소모품 신청" 에서 리스트 보기를 추가한다.
- 리스트 보기에서 개수 변경 , 추가 가능
~~~

-   "소모품 신청" 에서 리스트 보기를 추가한다.
-   리스트 보기에서 개수 변경 , 추가 가능

<img src="/org-assets/91339fe5-20260719_172222_screenshot.png" alt="20260719_172222_screenshot.png" width="800">


## 소모품 신청 내역

-   이전 신청 내역과 상태를 확인 할 수있습니다.
-   더미 데이터와 새로 신청한 품목이 제대로 나오는지 확인 합니다.

<img src="/org-assets/2712da62-20260719_172340_screenshot.png" alt="20260719_172340_screenshot.png" width="800">


# ---&ndash;&mdash;체크포인트-------


## 체크포인트 LINK

[https://ai.studio/apps/1c7a791e-bdbb-41ea-92cd-2b07bd9f990e](https://ai.studio/apps/1c7a791e-bdbb-41ea-92cd-2b07bd9f990e)


# 배포


## Git 올리기

1.  ai studio  와 동일한 계정의 github 아이디 사용
    -   github 에 배달할 truck 주문

![20260719_173507_screenshot.png](/org-assets/281db8fc-20260719_173507_screenshot.png)

1.  stage and commit
    -   truck 출발~
        
        <img src="/org-assets/123bfe2b-20260719_173757_screenshot.png" alt="20260719_173757_screenshot.png" width="800">


## Vercel

1.  vercel 에 github 을 연결합니다.
2.  github project 추가
    
    <img src="/org-assets/f634ad57-20260719_174138_screenshot.png" alt="20260719_174138_screenshot.png" width="800">
3.  github 프로젝트 import
    
    <img src="/org-assets/5a69148f-20260719_174246_screenshot.png" alt="20260719_174246_screenshot.png" width="800">
4.  deploly
    
    ![20260719_174342_screenshot.png](/org-assets/7f805711-20260719_174342_screenshot.png)
5.  배포 확인
     배포주소 :[국순당\_소모품관리](https://ksd-officehub.vercel.app/admin/reports)
    [[   <https://ksd-officehub.vercel.app>

][<https://ksd-officehub.vercel.app>]] 

<img src="/org-assets/7cdae898-20260719_174433_screenshot.png" alt="20260719_174433_screenshot.png" width="400">

<img src="/org-assets/a7dab0ef-20260719_174603_screenshot.png" alt="20260719_174603_screenshot.png" width="800">

