---
sidebar:
  exclude: true
title: "2 Pdf Hwpx"
author: ["minwook Han"]
draft: false
toc: true
weight: 2
---

## pdf 관리기 {#pdf-관리기}


### pdf 변환, 분리 기능 {#pdf-변환-분리-기능}

-   PDF 파일 작업을 기술 합니다
-   작업의 배경 정보와 기능을 분리해서 기술합니다

<!--listend-->

```markdown
1. 나는 pdf 생성 , 관리 하는 web app 을 만들고 싶다.
2. 기능은 {pdf 기능}  기능을 구현하라.
3. 언어: 한국어
## pdf 기능
1. 여러 이미지 파일을 하나의 pdf로 합치기 (filetype: jpg, png)
2. 여러 pdf 를 합칠 수 있다.
3. 입력받은페이지 범위, 또는 pdf에 포함된 book mark 기준으로 파일로 분리하기.
```


### 도전! {#도전}

-   pdf 문서의 보호기능으로 편집, 삭제가 안되는 경우가 있다. 이것을 해제하는 기능을 추가해보세요.


### 체크포인트 {#체크포인트}

[https://ai.studio/apps/926c33e9-7a9e-42fe-9f9c-78c0a8dde217](https://ai.studio/apps/926c33e9-7a9e-42fe-9f9c-78c0a8dde217)

{{< figure src="/ox-hugo/20260711_220447_screenshot.png" caption="<span class=\"figure-number\">Figure 1: </span>pdf 관리 1차 완성" >}}


## hwp파일 읽기 {#hwp파일-읽기}

-   hwp파일을 읽거나, pdf 로 변환합니다.
-   hwp 형식은 비공개된 오래된 양식 이고 hwpx 형식은 공개된 형식입니다.
-   하지만 완전히 공개되어 편하게 읽기는 불편합니다.
-   최근 **오픈소스** 로 한 개발자가 hwp, hwpx를 읽고 글을 작성 할 수있는 코드를 작성했습니다
-   이 패키지(코드)를 활용해서 Hwp, Hwpx viewer 기능 추가 합니다.


### hwp 뷰어 prompt {#hwp-뷰어-prompt}

-   기존의 pdf와 상관없는 새로운 기능 추가 이므로 "페이지추가" 로 요청했습니다
    (자)
-   rhwp github
    `https://github.com/edwardkim/rhwp`

{{< figure src="/ox-hugo/20260711_221708_screenshot.png" caption="<span class=\"figure-number\">Figure 2: </span>rhwp" >}}

```markdown
1. hwp, hwpx 뷰어,편집 페이지를 추가하라.
2. rhwp 패키지를 추가해서 구현하라. --> https://github.com/edwardkim/rhwp
3. rhwp 패키지를 설치하는데 필요한 환경을 구성해서 사용하라
```

{{< figure src="/ox-hugo/20260711_223136_screenshot.png" >}}


### 체크포인트 {#체크포인트}

[https://ai.studio/apps/09a889ed-6928-4968-90b2-32b4fa5303a8](https://ai.studio/apps/09a889ed-6928-4968-90b2-32b4fa5303a8)


## 파일 목록 저장하기 {#파일-목록-저장하기}

-   업로드하거나 작업한 파일을 Google Drive에 저장해서 관리합니다
-   외부 Database를 이용하지 않아도 간편하게 자료를 저장할 수 있습니다


### google drive 연결하기 {#google-drive-연결하기}

1.  연결하기
    우측상단 "설정" --&gt; Integration --&gt; "google Drive" 클릭 --&gt; 프로젝트 선택 --&gt; "Enable Google Drive" --&gt;채팅창 prompt 보내기

    {{< figure src="/ox-hugo/20260713_191249_screenshot.png" >}}

    {{< figure src="/ox-hugo/20260713_191533_screenshot.png" caption="<span class=\"figure-number\">Figure 3: </span>프로젝트추가" >}}
2.  google 연결
    -   실행도 중 google login을 해줍니다

        {{< figure src="/ox-hugo/20260713_193318_screenshot.png" caption="<span class=\"figure-number\">Figure 4: </span>google 계정연결" >}}


### google drive에 파일목록 {#google-drive에-파일목록}

```markdown
1. google drive 에 작업했던 pdf와 hwp, hwpx 파일을 저장한다
2. pdf 에서 열거나 hwp로 한번 열었던 것은 google drive 에 무조건 자동 저장한다
2. google drive 에 "myPDFHWP" 폴더를 만들고 저장한다
3. google drive 에 저장한 파일관리 페이지 추가한다
   google drive 작업을 끝내면 결과를 확인하고 피드백을 준다
## Google drive 기능
  - 파일이름수정
  - 파일 업로드,
  - 파일 삭제
  - pdf  클릭하면 --> pdf 보기
  - hwp 클릭하면 --> hwp 편집
```


### 체크포인트 {#체크포인트}

[https://ai.studio/apps/09a889ed-6928-4968-90b2-32b4fa5303a8](https://ai.studio/apps/09a889ed-6928-4968-90b2-32b4fa5303a8)


## 세부수정하기 {#세부수정하기}


### 디자인 변경하기 {#디자인-변경하기}

-   마음에 드는 사이트를 스크린 캡쳐(또는 주소 제공) 해서 prompt에 첨부하여 디자인 변경을 요청합니다
    ```markdown
    1. {url} 에서 사용한 컬러톤, UX, UI 요소 로 변경하라.
    ## URL
    url :https://www.apple.com/
    ```

{{< figure src="/ox-hugo/20260713_204607_screenshot.png" >}}


### 체크포인트 {#체크포인트}

[https://ai.studio/apps/62bc42e8-3a00-4da7-a921-3ad9d1b79b99](https://ai.studio/apps/62bc42e8-3a00-4da7-a921-3ad9d1b79b99)


## 배포하기 {#배포하기}

-   github에 저장 한 뒤 vercel 에 배포하기
