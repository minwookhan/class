---
sidebar:
  exclude: true
title: "장비대여시스템"
author: ["minwook Han"]
draft: false
toc: true
weight: 3
---

## <span class="section-num">1</span> 장비관리 PRD 요청 {#장비관리-prd-요청}

```markdown
# Instruction
1. 너는 웹앱 기획 전문가이다.
2. 나는 초보자 이다. 고등학생 수준으로 대화하자. 전문용어는 쉽게 설명하라
3. 나는 사무실 장비대여,관리 웹앱을 만들고 싶다.
4. google ai studio 를 사용한다.
5. PRD문서를 작성하려 한다.
6. PRD 문서 작성을 위한 토론을 하자.
7. 필요한 정보는 나에게 질문하라
8. 서술어, 수식어 없이 핵심만 간단한 대화식 진행
9. 대답은 선택 질문시 객관식 선택사항 또는 단답형
```


### <span class="section-num">1.1</span> 대화내용 {#대화내용}


#### <span class="section-num">1.1.1</span> 대화요청 prompt {#대화요청-prompt}

```markdown
 **User:**

# Instruction

1. 너는 웹앱 기획 전문가이다.
2. 나는 초보자 이다. 고등학생 수준으로 대화하자. 전문용어는 쉽게 설명하라
3. 나는 사무실 장비대여,관리 웹앱을 만들고 싶다.
4. google ai studio 를 사용한다.
5. PRD문서를 작성하려 한다.
6. PRD 문서 작성을 위한 토론을 하자.
7. 필요한 정보는 나에게 질문하라
8. 서술어, 수식어 없이 핵심만 간단한 대화식 진행
9. 대답은 선택 질문시 객관식 선택사항 또는 단답형

---
```


#### <span class="section-num">1.1.2</span> 대화내용 {#대화내용}

```markdown
 **Model:**
반가워! 웹앱 기획 전문가야.
사무실 장비 관리 웹앱 PRD(제품 설계도) 작성 시작하자.

 **Q1. 이 앱의 가장 핵심적인 사용자는 누구야? (번호 선택)**

1. 사내 장비 관리자 (총무/IT팀)
2. 장비를 빌려 쓰는 일반 사원
3. 장비를 빌려주는 외부 대여 업체
4. 기타 (직접 입력)

---

 **User:**
1,2 번

---

 **Model:**
관리자(1번)와 일반 사원(2번) 모두가 사용하는 앱이구나. 두 사용자의 입장을 모두 고려해서 설계해야 해.

그럼 이 앱에서 **가장 중요하게 생각하는 첫 번째 핵심 기능**은 뭐야? (번호 선택)

1. **대여/반납 신청:** 사원이 쉽게 장비 목록을 보고 빌리는 기능
2. **재고 및 승인 관리:** 관리자가 실시간으로 재고를 파악하고 대여를 승인하는 기능
3. **AI 챗봇 도우미:** AI Studio를 활용해 대화형으로 장비를 추천하고 안내하는 기능
4. **고장 및 수리 관리:** 장비의 고장 신고와 수리 이력을 추적하는 기능

---

 **User:**
1,2 번 위주 3번은 나중에 추가

---

 **Model:**
1번과 2번이 핵심이네. 빌려 쓰는 사원과 승인하는 관리자의 워크플로우(업무 흐름)가 중요해.

그럼 **장비를 대여하고 반납할 때, 관리자의 승인 과정**을 어떻게 처리할까? (번호 선택)

1. **자동 승인:** 사원이 신청하면 재고가 있을 시 즉시 대여 완료
2. **수동 승인:** 사원이 신청하면 관리자가 확인 후 '승인'을 눌러야 완료
3. **조건부 승인:** 고가 장비(노트북 등)만 관리자 승인 필요, 소모품은 자동 승인

---

 **User:**
2

---

 **Model:**
관리자가 직접 확인하고 승인하는 '수동 승인' 방식으로 진행할게. 사원 화면에는 '승인 대기', '승인 완료' 상태가 표시되어야 해.

 **Q3. 수많은 장비(예: 똑같이 생긴 노트북 10대)를 헷갈리지 않게 구별하고 재고를 관리하려면 어떤 방식을 사용할까? (번호 선택)**

1. **바코드 / QR 코드 스캔:** 장비에 스티커를 붙이고 스마트폰 카메라로 찍어서 자동 인식
2. **고유 번호 (시리얼 넘버) 관리:** 관리번호를 시스템에 직접 타자로 입력해서 검색
3. **단순 목록 선택:** '노트북 1호', '노트북 2호'처럼 이름표만 만들어서 마우스로 선택

---

 **User:**
3

---

 **Model:**
단순 목록 선택 방식(이름표 방식) 확인했어.

 **Q4. 대여가 승인되거나 반납 기한이 다가왔을 때, 사용자에게 어떻게 알려줄까? (번호 선택)**

1. 이메일 알림
2. 사내 메신저 알림 (슬랙, 팀즈, 카카오톡 등)
3. 웹앱 내부 알림 (종 모양 아이콘)
4. 스마트폰 문자(SMS) 알림

---

 **User:**
1

---

 **Model:**
이메일 알림으로 진행할게.

 **Q5. 관리자가 로그인했을 때 처음 보는 화면(대시보드)에는 어떤 정보가 가장 중요할까? (번호 선택)**

1. 승인을 기다리는 요청 목록
2. 전체 장비가 몇 개 남았는지 보여주는 재고 현황
3. 반납일이 지났거나 임박한 사람 목록
4. 1, 2, 3번 모두 다

---

 **User:**
4

---

 **Model:**
대시보드에 3가지 모두 포함 확인.

 **Q6. 사용자의 앱 로그인 방식은? (번호 선택)**

1. 사내 이메일 연동 (구글 워크스페이스 등)
2. 앱 전용 아이디/비밀번호 새로 생성
3. 사원번호와 관리자가 부여한 초기 비밀번호 사용

---

 **User:**
4. firebase 관리 로그인

---

 **Model:**
Firebase 인증(Authentication) 로그인 확인. 관리와 보안이 편리한 좋은 방식이야.

 **Q7. 사원들이 장비를 쉽게 찾으려면 어떻게 분류해서 보여주는 게 좋을까? (번호 선택)**

1. **단순 카테고리:** 1단계로만 구분 (예: 노트북, 모니터, 케이블)
2. **상세 카테고리:** 2단계로 구분 (예: 전자기기 > 노트북 / 가구 > 의자)
3. **분류 없음:** 전체 장비 목록만 보여주고 '검색창'으로 직접 검색

---

 **User:**
2

---

 **Model:**
2단계 상세 카테고리(예: IT기기 > 노트북) 확인.

 **Q8. 장비 대여 기간 규칙은 어떻게 할까? (번호 선택)**

1. **고정 기간:** 장비마다 기본 대여일(예: 7일) 지정, 필요시 연장
2. **자율 선택:** 사원이 신청할 때 달력에서 빌릴 날짜와 반납 날짜 직접 선택
3. **무기한:** 기한 없이 빌리고 다 쓰면 반납 (퇴사/부서이동 전까지)

---

 **User:**
1

---

 **Model:**
고정 기간 대여 및 연장 기능 확인 완료.

 **Q9. 사원이 대여 기간을 '연장'하고 싶을 때 방식은? (번호 선택)**

1. **자동 연장:** 정해진 횟수(예: 1회) 내에서 버튼을 누르면 바로 연장 완료
2. **수동 승인:** 사원이 연장 신청을 하면 관리자가 다시 확인하고 승인해야 연장 완료
3. **연장 불가:** 기간이 끝나면 무조건 반납하고 다시 대여 신청

---

 **User:**
1

---

 **Model:**
정해진 횟수 내 자동 연장 확인.

 **Q10. 이 웹앱은 주로 어떤 기기에서 접속해서 사용할까? (번호 선택)**

1. 주로 PC 화면 (사무실 자리에서 컴퓨터로 접속)
2. 주로 모바일 화면 (스마트폰으로 이동하면서 접속)
3. PC와 스마트폰 모두 지원 (화면 크기에 맞게 자동 조절되는 반응형 웹)

---

 **User:**
3

---

 **Model:**
답변 확인했어 (PC/모바일 반응형 웹).

지금까지 논의한 10가지 핵심 내용을 바탕으로 웹앱 기획을 위한 PRD(제품 요구사항 정의서) 문서를 생성할게. 전체 구조를 한눈에 파악하기 쉽도록 프레젠테이션 슬라이드 형태로 정리했어.

http://googleusercontent.com/immersive_entry_chip/0
작성된 PRD 슬라이드 문서가 준비되었어! 천천히 살펴보고, 추가하거나 변경하고 싶은 기획 내용이 있다면 언제든 편하게 말해줘.

---

 **User:**
작성된 PRD 내용을 markdown 으로 정리해

---

 **Model:**
지금까지 토론한 내용을 바탕으로 정리한 **사무실 장비 대여 및 관리 웹앱 PRD(제품 요구사항 정의서)** 마크다운 문서야.

---

# [PRD] 사무실 장비 대여 및 관리 웹앱 요구사항 정의서

## 1. 개요

 * **제품명:** 사내 장비 대여 및 관리 시스템 (가칭)
 * **목적:** 사내 자산(IT 기기, 가구 등)의 대여/반납 프로세스 효율화 및 실시간 재고 관리
 * **타겟 사용자:** 사내 장비 관리자(총무/IT팀) 및 대여 서비스를 이용하는 일반 사원
 * **플랫폼:** PC 및 모바일 반응형 웹앱

---

## 2. 사용자 역할 및 권한 (User Roles)

### 2.1 일반 사원 (End User)

 * **장비 조회:** 2단계 카테고리 및 검색을 통해 대여 가능 장비 확인
 * **대여/반납 신청:** 대여를 원하는 장비 선택 후 신청
 * **연장 신청:** 반납 기한 내에 지정된 횟수(예: 1회) 한도 내에서 즉시 자동 연장
 * **상태 확인:** 자신의 대여 현황 및 승인 상태(승인 대기/완료) 확인

### 2.2 장비 관리자 (Admin)

 * **대여 승인 관리:** 사원의 장비 대여/반납 신청 건에 대한 수동 승인 및 거절
 * **대시보드 모니터링:** 전체 재고 현황, 승인 대기 건, 반납 임박/지연 현황 실시간 파악
 * **장비 및 카테고리 관리:** 장비 등록(이름표 방식 식별) 및 분류 체계 관리

---

## 3. 핵심 기능 요구사항 (Functional Requirements)

### 3.1 회원가입 및 로그인

 * **인증 방식:** Firebase Authentication 활용
 * **계정 체계:** 앱 전용 아이디 및 비밀번호 새로 생성하여 로그인

### 3.2 장비 및 재고 관리

 * **분류 체계:** 2단계 상세 카테고리 구조 (예: `IT 기기 > 노트북`, `사무 가구 > 의자`)
 * **장비 식별 방식:** 단순 목록 및 이름표 선택 방식 (예: `노트북 1호`, `노트북 2호`) 활용 관리

### 3.3 대여/반납 프로세스 (워크플로우)

1. **사원:** 장비 목록에서 특정 장비(이름표) 선택 후 대여 신청
2. **시스템:** 해당 장비 상태를 `승인 대기`로 변경 후 관리자에게 이메일 알림 발송
3. **관리자:** 대시보드에서 요청 확인 후 `수동 승인` 처리
4. **시스템:** 장비 상태를 `승인 완료(대여중)`로 변경하고 사원에게 승인 완료 이메일 발송
5. **반납/연장:** 고정 기간(예: 7일) 종료 시 반납 또는 자동 연장(1회 제한) 버튼 클릭

### 3.4 관리자 대시보드 (Dashboard)

 * **승인 대기 목록:** 현재 사원들이 신청하여 승인을 기다리는 실시간 요청 리스트
 * **실시간 재고 현황:** 전체 장비의 수량 및 현재 대여 가능 기기 수량 시각화
 * **반납 관리 목록:** 반납일이 지났거나 기한이 임박한 사용자 및 장비 리스트

### 3.5 알림 시스템 (Notification)

 * **연동 채널:** 이메일(Email) 알림
 * **발송 시점:** * 사원의 대여 신청 시 (관리자 수신)
 * 관리자의 대여 승인/거절 처리 시 (사원 수신)
 * 대여 반납 기한 임박 및 지연 발생 시 (사원 수신)



---

## 4. 기술 스택 및 환경 (Tech Stack)

 * **인증/백엔드:** Firebase (Authentication, Firestore 데이터베이스)
 * **프론트엔드:** HTML/CSS/JS (반응형 웹 디자인 적용 - PC/모바일 동시 지원)

---

## 5. 향후 확장 계획 (Roadmap)

 * **AI 도우미 도입:** Google AI Studio 모델을 활용하여 대화형으로 장비를 추천받거나 반납 프로세스를 안내받는 'AI 챗봇 기능' 추가 예정
```


#### <span class="section-num">1.1.3</span> 대화내용 보기 {#대화내용-보기}

 <iframe
  src="/apps/demo/gemini_prd.html"
  title="HTML 문서"
  loading="lazy"
  style="position:absolute;inset:0;width:100%;height:60%;border:0;">
</iframe>


### <span class="section-num">1.2</span> 완성된 PRD {#완성된-prd}

-   PRD 전체 문서를 보고 검토 수정합니다.
-   PRD


### <span class="section-num">1.3</span> 핵심만 간추린 MVP {#핵심만-간추린-mvp}

-   전체적인 기능과 구조는 PRD 를 통해 파악합니다.
-   큰 계획만 잡고 세부는 필수,기본 사항을 만들고 구현합니다.
-   이 때 **필수 기본** 사항을 **MVP** 라 합니다
-   MVP용 Prompt를 요청합니다
    ```markdown
        이 PRD로  웹앱을 만들기 위한 MVP제작용 단계별 prompt 를 만들어
    ```

{{< figure src="/ox-hugo/20260709_181815_screenshot.png" caption="<span class=\"figure-number\">Figure 1: </span>MVP 결과" width="600" >}}


### <span class="section-num">1.4</span> MVP 결과 {#mvp-결과}

-   MVP(핵심기능)의 단계별 구현 방법으로 전체적인 개발 순서가 나왔습니다
-   MVP 단계별로 진행하면서 수정합니다.
-   가장 중요한 정보는 제품 관리 구조(DB) 입니다. 이것이 있어야 전체적인 관리방법을 구체화 할 수있습니다.


### <span class="section-num">1.5</span> 장비관리 DB 구조 {#장비관리-db-구조}

| 고유번호 | 장비명      | 대분류 | 중분류 | 소분류  | 장소   | 상태 | 최대대여일 |
|------|----------|-----|-----|------|------|----|-------|
| 노트북-01 | 맥북 프로 14 | IT기기 | 노트북 | 맥북    | 3층 창고 | 가능 | 4     |
| 노트북-02 | LG 그램 16  | IT기기 | 노트북 | 윈도우 노트북 | 3층 창고 | 대여중 | 3     |
| 데스크탑-01 | HP 프로데스크 미니 | IT기기 | 데스크탑 | 미니PC  | 4층 IT실 | 가능 | 4     |
| 모니터-01 | LG 27인치 4K | IT기기 | 모니터 | 4K 모니터 | 2층 사무실 | 가능 | 5     |
| 모니터-02 | 삼성 34인치 커브드 | IT기기 | 모니터 | 울트라와이드 | 2층 사무실 | 대여중 | 5     |
| 태블릿-01 | 아이패드 프로 11 | IT기기 | 태블릿 | 아이패드 | 3층 창고 | 가능 | 5     |
| 복합기-01 | 신도리코 A3 복합기 | 사무기기 | 복합기 | 레이저 복합기 | 2층 사무실 | 가능 | 5     |
| 프린터-01 | HP 레이저젯 | 사무기기 | 프린터 | 흑백 레이저 | 1층 로비 | 가능 | 5     |
| 스캐너-01 | 엡손 고속 스캐너 | 사무기기 | 스캐너 | 문서 스캐너 | 2층 사무실 | 수리중 | 5     |


## <span class="section-num">2</span> step-1 Firebase 설정하기 {#step-1-firebase-설정하기}


### <span class="section-num">2.1</span> project 생성 {#project-생성}

1.  프로젝트 생성 사이트 접속
    [link: project 생성하기](https://console.firebase.google.com/u/1/?hl=ko)

    {{< figure src="/ox-hugo/20260710_132424_screenshot.png" caption="<span class=\"figure-number\">Figure 2: </span>프로젝트 생성" >}}
2.  프로젝트 추가

    {{< figure src="/ox-hugo/20260710_132533_screenshot.png" caption="<span class=\"figure-number\">Figure 3: </span>프로젝트이름, 추가" >}}
3.  Cloud project 선택
    -   cloud project 선택 후 --&gt; 계속 진행

        {{< figure src="/ox-hugo/20260710_132744_screenshot.png" caption="<span class=\"figure-number\">Figure 4: </span>클라우드프로젝트 선택" >}}

4.  최종 생성

    -   최종생성 단계 에서 "Default Account for firebase"  선택 --&gt; Firebase추가

    {{< figure src="/ox-hugo/20260710_132921_screenshot.png" >}}


### <span class="section-num">2.2</span> 프로젝트안에 App 생성하기 {#프로젝트안에-app-생성하기}

1.  App 추가

    {{< figure src="/ox-hugo/20260710_133219_screenshot.png" caption="<span class=\"figure-number\">Figure 5: </span>앱추가" >}}

2.  앱등록
    -   앱 이름과 "앱 등록" 클릭

{{< figure src="/ox-hugo/20260710_140125_screenshot.png" caption="<span class=\"figure-number\">Figure 6: </span>앱등록" >}}

{{< figure src="/ox-hugo/20260710_140549_screenshot.png" caption="<span class=\"figure-number\">Figure 7: </span>웹앱 선택" >}}

1.  설정값 복사해 두기
    -   설정값  ai studio 에서 전달해야 합니다. 미리 복사해 보관합니다

{{< figure src="/ox-hugo/20260710_141249_screenshot.png" >}}


### <span class="section-num">2.3</span> 로그인 설정 {#로그인-설정}

1.  로그인 기능을 활성화 합니다
    사이드메뉴--&gt; 보안---&gt; "Authentification"

{{< figure src="/ox-hugo/20260710_141925_screenshot.png" >}}

{{< figure src="/ox-hugo/20260710_143042_screenshot.png" caption="<span class=\"figure-number\">Figure 8: </span>활성화" >}}

1.  Gmail  활성화

    -   이어 필요에 따라 Gmail 도 추가 합니다.("새 제공업체추가" 클릭 진행)

    {{< figure src="/ox-hugo/20260710_143233_screenshot.png" >}}


### <span class="section-num">2.4</span> 텍스트DB 설정 {#텍스트db-설정}

1.  텍스트 저장용 DB 설정 합니ㄷ
    -   "FireStore" 선택

        {{< figure src="/ox-hugo/20260710_145413_screenshot.png" caption="<span class=\"figure-number\">Figure 9: </span>firestore 선택" >}}
2.  데이터베이스 생성

    -   "데이터 베이스 만들기" 선택
    -   변경 없이 "다음" 으로 진행 합니다.

        {{< figure src="/ox-hugo/20260710_145748_screenshot.png" caption="<span class=\"figure-number\">Figure 10: </span>데이터베이스만들기" >}}

    <!--listend-->

    3.  보안규칙 변경
        -   Database에 접근 하는 규칙을 변경 합니다
        -   로그인 한 사람만 접근 할 수 있도록 합니다
        -   아래 규칙을 기존 규칙 아래에 붙여 넣고 기존 규칙을 삭제합니다.
            ```javascript
            rules_version = '2';

            service cloud.firestore {
              match /databases/{database}/documents {

                match /{document=**} {
                  allow read, write: if request.auth != null;
                }

              }
            }

            ```

{{< figure src="/ox-hugo/20260710_150157_screenshot.png" >}}


## <span class="section-num">3</span> step-2 로그인 만들기 {#step-2-로그인-만들기}

-   1단계 초기 제작합니다
-   초반에 Database 와 회원레벨을 먼저 설계 합니다
-   추 후에 데이터 구조가 복잡해진 이후에 다시 DB를 만들면 AI 특성상 모든 변수를 한번에 고려해서 정리 하기 매우 어려워 집니다
-   초기에 이 앱이 사용할 data 구조를 살짝 힌트를 줘야 나중에 점점 추가되는 기능을 잘 구현해 줍니다
-   MVP 의 1단계 prompt를 사용합니다.


### <span class="section-num">3.1</span> 로그인 화면 만들기 {#로그인-화면-만들기}

1.  로그인 Prompt
    ```markdown
        ## Instruction
        1. 로그인 화면을 구성하라.
        2. 회원은 [일반회원, 관리자] 레벨 있다.
        3. 회원가입은 일반회원만 가능
        4. email 회원가입, 로그인 기능
        5. {Config} 정보를 이용하여 firebase로 구현해.
        6. 언어: 한글
        ## Config
        // Import the functions you need from the SDKs you need
        import { initializeApp } from "firebase/app";
        import { getAnalytics } from "firebase/analytics";
        // TODO: Add SDKs for Firebase products that you want to use
        // https://firebase.google.com/docs/web/setup#available-libraries

        // Your web app's Firebase configuration
        // For Firebase JS SDK v7.20.0 and later, measurementId is optional
        const firebaseConfig = {
        apiKey: "AIzaSyANz2Hqgt-F1UhsIYB6x5vuh87K64OiFWc",
        authDomain: "gen-lang-client-0120297627.firebaseapp.com",
        projectId: "gen-lang-client-0120297627",
        storageBucket: "gen-lang-client-0120297627.firebasestorage.app",
        messagingSenderId: "551514178889",
        appId: "1:551514178889:web:c142543bda5c3b0e1a0698",
        measurementId: "G-03YD28K6XF"
        };

        // Initialize Firebase
        const app = initializeApp(firebaseConfig);
        const analytics = getAnalytics(app);

    ```
    {{< figure src="/ox-hugo/20260710_161343_screenshot.png" caption="<span class=\"figure-number\">Figure 11: </span>로그인 화면 요청" >}}
2.  일반회원 추가

    -   일반회원 2명을 추가 합니다
        {user@ksd.com: 123456, user2@ksd.com:123456}
         [{id: user1@ksd.com, pw: 123456},{id: user2@ksd.com, pw: 123456}]

        {{< figure src="/ox-hugo/20260709_203344_screenshot.png" caption="<span class=\"figure-number\">Figure 12: </span>로그인화면" width="400" >}}

        {{< figure src="/ox-hugo/20260710_162410_screenshot.png" caption="<span class=\"figure-number\">Figure 13: </span>일반회원 추가" >}}

    <!--listend-->

    2.  관리자 추가
        -   일단 일반회원으로 관리자 ID를 생성합니다:
            ```quote
               id: admin@ksd.com pw: 123456
            ```
            {{< figure src="/ox-hugo/20260710_162550_screenshot.png" caption="<span class=\"figure-number\">Figure 14: </span>관리자계정생성" >}}

3.  생성된 ID 확인
    -   DB에 추가된 계정을 확인합니다
    -   Authentification --&gt; 사용자

        {{< figure src="/ox-hugo/20260710_162801_screenshot.png" caption="<span class=\"figure-number\">Figure 15: </span>DB확인" >}}
4.  관리자 계정 레벨 설정
    -   관리자 ID는 해당 data의 "role"  값을 "admin"  으로 변경합니다

        {{< figure src="/ox-hugo/20260710_163257_screenshot.png" caption="<span class=\"figure-number\">Figure 16: </span>관리자레벨 변경" >}}


### <span class="section-num">3.2</span> 테스트 ID 로그인 {#테스트-id-로그인}

-   수정 하다 보면 반복적으로 로그인을 해서 확인 해야 합니다.
-   매번 귀찮은 작업이므로 로그인 화면에 원클릭으로 로그인 할 수 있는 테스트버튼을 추가 합니다

<!--listend-->

```markdown
1. 로그인 초기 화면에 테스용 로그인 메뉴를 추가해.
{user@ksd.com: 123456, user2@ksd.com:123456, admin@ksd.com:123456 }
```


## <span class="section-num">4</span> step-3 데이터베이스 구조 만들기 {#step-3-데이터베이스-구조-만들기}

-   자료들이 저장되는 양식(데이터베이스 구조) 를 먼저 생성합니다
-   기본 관리하던 장비목록의 구조와 함께 운영상 필요한 구조까지 설계 하려면 매우 복잡합니다.
-   대신 우리가 원하던 기능을 대략 설명하고 기존장비목록 구조을 제공하면  자동으로 만들어 집니다
-   이 구조는 한 번 만들고 변경이 안되면 가장 좋지만 수정 하다보면 어느 정도 변경 가능합니다.


### <span class="section-num">4.1</span> DB설계 prompt {#db설계-prompt}

```markdown
#### **2단계: 데이터베이스(DB) 구조 설계**

 "로그인 기능은 잘 작동해. 이제 **Firebase Firestore**에 데이터를 저장하려고 해.
 다음 3가지 정보를 저장하기 위한 데이터베이스 구조(컬렉션 및 문서)를 추천해 주고, 초기 테스트용 장비 데이터(노트북, 의자 등)를 DB에 넣는 자바스크립트 코드를 작성해 줘.
 1. 사용자 정보 (이름, 역할: 사원/관리자)
 2. 장비 목록 (1단계: 카테고리, 2단계: 상세 카테고리, 장비 이름표, 재고 상태)
 3. 대여 기록 (누가, 무엇을, 언제 빌렸고 상태는 어떤지)"
 4.{data 구조} 를 참고해서 만들어
## Data 구조
| 고유번호 | 장비명              | 대분류        | 중분류     | 소분류          | 장소         | 상태   | 최대대여일 |
|---------------+---------------------+---------------+------------+-----------------+--------------+--------+------------|
| 노트북-01     | 맥북 프로 14        | IT기기        | 노트북     | 맥북            | 3층 창고     | 가능   | 4          |
| 노트북-02     | LG 그램 16          | IT기기        | 노트북     | 윈도우 노트북   | 3층 창고     | 대여중 | 3          |
| 데스크탑-01   | HP 프로데스크 미니  | IT기기        | 데스크탑   | 미니PC          | 4층 IT실     | 가능   | 4          |
| 모니터-01     | LG 27인치 4K        | IT기기        | 모니터     | 4K 모니터       | 2층 사무실   | 가능   | 5          |
| 모니터-02     | 삼성 34인치 커브드  | IT기기        | 모니터     | 울트라와이드    | 2층 사무실   | 대여중 | 5          |
| 태블릿-01     | 아이패드 프로 11    | IT기기        | 태블릿     | 아이패드        | 3층 창고     | 가능   | 5          |
| 복합기-01     | 신도리코 A3 복합기  | 사무기기      | 복합기     | 레이저 복합기   | 2층 사무실   | 가능   | 5          |
| 프린터-01     | HP 레이저젯         | 사무기기      | 프린터     | 흑백 레이저     | 1층 로비     | 가능   | 5          |
| 스캐너-01     | 엡손 고속 스캐너    | 사무기기      | 스캐너     | 문서 스캐너     | 2층 사무실   | 수리중 | 5          |
| 세단기-01     | 아이리스 문서세단기 | 사무기기      | 문서세단기 | 크로스컷        | 3층 창고     | 가능   | 5          |
| 라벨기-01     | 브라더 라벨프린터   | 사무기기      | 라벨프린터 | 라벨 프린터     | 2층 사무실   | 가능   | 5          |
| 카메라-01     | 소니 A7 IV          | 영상·음향기기 | 카메라     | 미러리스        | 3층 창고     | 가능   | 5          |
| 프로젝터-01   | 엡손 4K 프로젝터    | 영상·음향기기 | 프로젝터   | 4K 프로젝터     | 1층 대회의실 | 대여중 | 5          |
| 마이크-01     | 무선 마이크 세트    | 영상·음향기기 | 마이크     | 무선 마이크     | 2층 회의실   | 가능   | 5          |
| 스피커-01     | 블루투스 스피커     | 영상·음향기기 | 스피커     | 휴대용 스피커   | 3층 창고     | 가능   | 5          |
| 웹캠-01       | 로지텍 브리오       | 영상·음향기기 | 웹캠       | 4K 웹캠         | 2층 사무실   | 가능   | 5          |
```


### <span class="section-num">4.2</span> DB설계 확인 {#db설계-확인}

-   관리자ID로 로그인 해서 결과물을 확인합니다
-   "초기데이터생성" 버튼을 눌러 데이터를 입력합니다

{{< figure src="/ox-hugo/20260710_170202_screenshot.png" caption="<span class=\"figure-number\">Figure 17: </span>관리자패널" >}}

-   Firebase DB에서 생성된 Data확인

    {{< figure src="/ox-hugo/20260710_170415_screenshot.png" caption="<span class=\"figure-number\">Figure 18: </span>DB 데이터확인" >}}


## <span class="section-num">5</span> step-4 일반회원대여 화면 만들기 {#step-4-일반회원대여-화면-만들기}

-   일반유저의 대여 신청을 구현합니다
-   일반유저의 대여과정을 자세히 설명합니다
-   이 때DB구조가 바뀔 수 있습니다. 큰 문제는 되지 않지만 반복되면 좋지 않습니다
-   최대한 처음에 완성된 대여방법을 한 번에 제시하는 것이 좋습니다.


### <span class="section-num">5.1</span> 대여화면 만들기 prompt {#대여화면-만들기-prompt}

```markdown
#### **3단계: 일반 사원용 화면 (장비 조회 및 대여 신청)**


 "이제 일반 사원이 로그인했을 때 볼 수 있는 메인 화면을 만들어 줘.
 1. DB에 있는 장비 목록을 2단계 카테고리(예: IT기기 > 노트북)로 분류해서 보여줘.
 2. 대여 가능한 장비(노트북 1호 등) 옆에 '대여 신청' 버튼을 만들어 줘.
 3. 버튼을 누르면 해당 장비의 상태가 DB에서 '승인 대기'로 바뀌는 코드를 작성해 줘."
## 대여 Rule
1. 리스트 형태에서 카테고리와 물품명이름으로 검색한다.
2. 물품을 선택하고 대여기간을 달력으로 선택한다
3. 달력에는 대여가 가능한 기간과 불가능한 기간이 표시된다.
4. 대여 사유를 입력한다(text box)

```

-   대여화면

{{< figure src="/ox-hugo/20260710_175428_screenshot.png" caption="<span class=\"figure-number\">Figure 19: </span>대여화면" >}}

-   대여 신청 화면
    -   대여기간 , 대여사유 입력 확인

{{< figure src="/ox-hugo/20260710_175711_screenshot.png" >}}


## <span class="section-num">6</span> step-5 관리자 화면 만들기 {#step-5-관리자-화면-만들기}

-   관리자용 화면을 만듭니다.
-   기본 대여관리 화면을 만듭니다
-   일단 기본 화면을 만들고 나중에 회원관리도 추가합니다.


### <span class="section-num">6.1</span> 관리자 화면 만들기 prompt {#관리자-화면-만들기-prompt}

```markdown
#### **4단계: 관리자용 대시보드 화면**

 "관리자가 로그인했을 때 볼 수 있는 대시보드 화면 코드를 작성해 줘. 다음 3가지가 한눈에 보여야 해.
 1. 전체 장비 수량과 대여 가능한 재고 현황
 2. 사원들이 신청한 '승인 대기' 목록 (옆에 '승인' 및 '거절' 버튼 포함)
 3. 반납일이 지났거나 임박한 대여 목록
 승인 버튼을 누르면 DB 상태가 '대여 중'으로 바뀌도록 처리해 줘."

```


## <span class="section-num">7</span> step-6 일반회원 기능 개선 {#step-6-일반회원-기능-개선}

-   기본 기능에서 필요한 기능을 더 추가합니다


### <span class="section-num">7.1</span> 마이페이지 만들기 {#마이페이지-만들기}

-   "마이페이지" 를 작성합니다.
-   prompt완성 뒤 기간연장을 테스트하기 위해
    1.  **대여 신청** 을 하고 관리자로 로그인해서 **승인** 한 다음
    2.  다시 일반회원으로 **기간연장** 이 되는지 확인 합니다

<!--listend-->

```markdown
#### **5단계: 사원 마이페이지 (상태 확인 및 연장)**

 "사원이 자신이 신청한 장비 상태를 볼 수 있는 '마이페이지' 코드를 추가해 줘.
 1. 현재 신청한 장비가 '승인 대기'인지 '대여 중(승인 완료)'인지 표시해 줘.
 2. 대여 중인 장비의 반납 기한을 보여주고, '1회 자동 연장' 버튼을 만들어 줘.
 3. 연장 버튼을 누르면 반납일이 7일 늘어나고, 버튼은 더 이상 누를 수 없게(비활성화) 처리해 줘."

```

{{< figure src="/ox-hugo/20260710_181536_screenshot.png" caption="<span class=\"figure-number\">Figure 20: </span>마이페이지 작성" >}}


### <span class="section-num">7.2</span> 대여신청화면 수정 {#대여신청화면-수정}

-   신청화면에 리스트 보기를 추가합니다
-   카테고리로 필터링, 장비명 검색 기능을 추가합니다
    ```markdown
    1. 일반회원의 "장비 대여 신청" 화면에 리스트 보기를 추가하라
    2. 리스트 보기에 아래와 같은  필터링 기능을 추가하라
    ​    - 카테고리 1,2차를 각각 드랍다운 메뉴로 필터링 할 수 있다.
    ​    - 제품명으로 *검색* 가능하다.
    ```

{{< figure src="/ox-hugo/20260710_182847_screenshot.png" >}}


### <span class="section-num">7.3</span> 마이페이지 수정 {#마이페이지-수정}

-   마이페이지에도 리스트 보기 추가합니다.

<!--listend-->

```markdown
1. "마이페이지" 에 리스트 보기를 추가한다.
2. 리스트보기에 {보기옵션}을 추가해서 표시한다.
## 보기옵션
1. 제품명, 대여상태,대여날짜, 반납예정일(남은날짜수), 연장기능

```

{{< figure src="/ox-hugo/20260710_183453_screenshot.png" >}}


### <span class="section-num">7.4</span> 체크포인트 링크 {#체크포인트-링크}

[일반회원기능 고도화_LINK](https://ai.studio/apps/9343844e-01a8-43df-a3fb-b6893e36df99)
<https://ai.studio/apps/9343844e-01a8-43df-a3fb-b6893e36df99>


## <span class="section-num">8</span> step-7 관리자화면 개선 {#step-7-관리자화면-개선}


### <span class="section-num">8.1</span> 화면 구성변경 {#화면-구성변경}

-   승인대기 목록을 리스트로 관리 합니다
-   반납지연 및 임밤은 상단의 대시보드로 이동 시킵니다.
    ```markdown
    1. "승인 대기 목록" 을 리스트 형태로 변경하라.
    2. "반납 지연 및 임박"을 상단의 대시보드로 이동시켜라
    ```

{{< figure src="/ox-hugo/20260710_184421_screenshot.png" caption="<span class=\"figure-number\">Figure 21: </span>수정된 대시보드" >}}


### <span class="section-num">8.2</span> 장비목록 관리 {#장비목록-관리}

-   장비 목록 추가/ 관리 기능을 구현합니다
-   전체 보유 장비 목록 현황을 보기, 추가, 수정
-   엑셀로 장비목록을 일괄로 업로드 가능
-   장비목록 데이터를 수동으로 입력 또는 엑셀 파일을 이용해 일괄 입력 합니다

<!--listend-->

```markdown
1. 장비목록 관리 페이지를 작성하라.
## 장비목록 관리 페이지 기능
1. 목록들의 현황을 볼 수 있다.
2. 목록을 수동으로 추가/삭제/(보이기,숨기기) 할 수 있다.
3. 장비목록을 xlsx 파일로 내려 받거나 xlsx파일로 일괄 업로드 할 수 있다.
```

-   장비목록 관리

{{< figure src="/ox-hugo/20260710_191410_screenshot.png" caption="<span class=\"figure-number\">Figure 22: </span>장비목록 관리" >}}

-   엑셀 내보내기

{{< figure src="/ox-hugo/20260710_191607_screenshot.png" >}}


### <span class="section-num">8.3</span> 리스트 보기 {#리스트-보기}

-   리스트보기에 필터링 기능추가
    ```markdown
    1. 리스트보기에 필터링 기능 추가.
    ​ - 카테고리1,2 를 드랍다운 메뉴로 필터링, 장비명 이름으로 검색
    ​ - "상태" 에 따라 필터링
    ```

{{< figure src="/ox-hugo/20260710_192345_screenshot.png" caption="<span class=\"figure-number\">Figure 23: </span>필터링 기능추가" >}}


### <span class="section-num">8.4</span> 체크포인트 {#체크포인트}

[관리자환면 완성](https://ai.studio/apps/9343844e-01a8-43df-a3fb-b6893e36df99)
<https://ai.studio/apps/9343844e-01a8-43df-a3fb-b6893e36df99>


## <span class="section-num">9</span> step-8 초기화면 디자인 {#step-8-초기화면-디자인}

-   apple 의 디자인으로 변경해보세요
