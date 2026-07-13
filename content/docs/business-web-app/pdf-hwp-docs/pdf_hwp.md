---
title: "PDF/HWP 문서 관리"
author: ["minwook Han"]
draft: false
toc: true
weight: 1
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


### 도전! {#도전}

-   pdf 저장 기능을 추가해보세요


## 세부수정하기 {#세부수정하기}


### 디자인 변경하기 {#디자인-변경하기}

-   마음에 드는 사이트를 스크린 캡쳐(또는 주소 제공) 해서 prompt에 첨부하여 디자인 변경을 요청합니다
    ```markdown
    1. {url} 에서 사용한 컬러톤, UX, UI 요소 로 변경하라.
    ## URL
    url :https://www.apple.com/
    ```

{{< figure src="/ox-hugo/20260711_231623_screenshot.png" >}}


### 체크포인트 {#체크포인트}

[hwp편집기 추가](https://ai.studio/apps/3f1744ad-583f-4a41-9f2c-973ca3481a88)
`https://ai.studio/apps/3f1744ad-583f-4a41-9f2c-973ca3481a88`


## 배포하기 {#배포하기}

-   github에 저장 한 뒤 vercel 에 배포하기
