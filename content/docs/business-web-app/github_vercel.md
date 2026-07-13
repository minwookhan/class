---
title: "Github Vercel 배포하기"
author: ["minwook Han"]
draft: false
toc: true
weight: 1
---

## <span class="section-num">1</span> github 가입하기 {#github-가입하기}


### <span class="section-num">1.1</span> github sign up {#github-sign-up}

-   <https://github.com> 접속

{{< figure src="/ox-hugo/20260711_144706_screenshot.png" caption="<span class=\"figure-number\">Figure 1: </span>github sign up" >}}


### <span class="section-num">1.2</span> google 계정 선택 {#google-계정-선택}

-   AI Studio의 Google 계정과 동일한 계정을 이용합니다.
-   다른 계정도 가능하지만 사용하다 보면 꼬이거나 혼란스러운 경우가 생깁니다.

{{< figure src="/ox-hugo/20260711_145047_screenshot.png" caption="<span class=\"figure-number\">Figure 2: </span>사용자이름 입력" >}}


### <span class="section-num">1.3</span> Respository 생성 {#respository-생성}

-   각 앱 마다 저장될 공간을 만듭니다

{{< figure src="/ox-hugo/20260711_145309_screenshot.png" caption="<span class=\"figure-number\">Figure 3: </span>repository  생성" >}}


### <span class="section-num">1.4</span> Repository 이름지정 {#repository-이름지정}

-   저장소의 이름 입력

{{< figure src="/ox-hugo/20260711_145459_screenshot.png" >}}


### <span class="section-num">1.5</span> Repository 완성 {#repository-완성}

-   완성된 Repositry(저장소) 를 확인합니다

{{< figure src="/ox-hugo/20260711_145620_screenshot.png" caption="<span class=\"figure-number\">Figure 4: </span>저장소 확인" >}}


## <span class="section-num">2</span> vercel 가입하기 {#vercel-가입하기}


### <span class="section-num">2.1</span> vercel sing up {#vercel-sing-up}

-   <https://www.vercel.com>  접속
-   우측 상단의 "sign up"  클릭

{{< figure src="/ox-hugo/20260711_150050_screenshot.png" >}}


### <span class="section-num">2.2</span> google 계정 선택 {#google-계정-선택}

-   ai stuido 의 google  과 같은 것 선택

{{< figure src="/ox-hugo/20260711_150250_screenshot.png" >}}


## <span class="section-num">3</span> github 배포하기 {#github-배포하기}


### <span class="section-num">3.1</span> github 연결하기 {#github-연결하기}

-   우측 상단 설정
-   github  선택

{{< figure src="/ox-hugo/20260711_151843_screenshot.png" caption="<span class=\"figure-number\">Figure 5: </span>github연결" >}}


### <span class="section-num">3.2</span> github commit {#github-commit}

-   현재 작업물을 github에 올리는 것을 **COMMIT** (커밋) 이라 합니다.
-   하단의 "Stage and commit all changes" 클릭하기

{{< figure src="/ox-hugo/20260711_152316_screenshot.png" >}}


### <span class="section-num">3.3</span> github 결과 확인해보기 {#github-결과-확인해보기}

1.  github에 다시 접속해서 commit 한 결과가 반영 되었는지 확인합니다

{{< figure src="/ox-hugo/20260711_152957_screenshot.png" >}}

1.  주소확인
    -   생성한 git  의 주소를 확인합니다
    -   주소형식
        <https://github.com/mintubehan/buchae.git>
        --&gt; `https://github.com/사용자이름/저장소이름.git` 형태

{{< figure src="/ox-hugo/20260711_153203_screenshot.png" >}}


## <span class="section-num">4</span> vercel 에 배포하기 {#vercel-에-배포하기}


### <span class="section-num">4.1</span> import project {#import-project}

1.  vercel 초기 화면에서 `import project` 선택
    -   import project 를 하거나

        {{< figure src="/ox-hugo/20260711_153812_screenshot.png" >}}

    -   또는 `Add New` --&gt; `Project`

{{< figure src="/ox-hugo/20260711_154522_screenshot.png" >}}

1.  vercel에 github 도구 설치
2.  Vercel에 GitHub을 사용할 수 있는 도구를 설치합니다.

{{< figure src="/ox-hugo/20260711_154738_screenshot.png" >}}

-   `Install` 클릭 하면 자동으로 github에 있던 모든 저장소가 보입니다

{{< figure src="/ox-hugo/20260711_154925_screenshot.png" >}}

1.  project(만든 앱) 을 가져옵니다
    -   자동으로 인식된 저장소 목록에서 해당 `앱` 을 `Import` 합니다

{{< figure src="/ox-hugo/20260711_155206_screenshot.png" >}}

1.  배포하기

    -   Vercel에 이 앱 배포의 새로운 이름을 입력하고
    -   `Deploy`  클릭

{{< figure src="/ox-hugo/20260711_155412_screenshot.png" >}}

1.  배포확인하기
2.  성공하면 배포된 미리보기 화면과 주소가 표시됩니다.
    -   `buchae.vercel.app` 처럼 앱이름.vercel.app 형태입니다.
    -   이제 `https://buchae.vercel.app` 을 주소로 배포할 수 있습니다.

{{< figure src="/ox-hugo/20260711_155818_screenshot.png" caption="<span class=\"figure-number\">Figure 6: </span>배포확인하기" >}}
