---
sidebar:
  exclude: true
title: "사이트 관리"
linkTitle: "사이트 관리"
toc: true
weight: 99
---

## 현재 category 구조

| category | 폴더 | 역할 | weight |
|---|---|---|---:|
| Machine Learning | `content/docs/machine-learning/` | AI, 머신러닝, 데이터 모델링 과목 | 1 |
| 업무용웹앱 | `content/docs/business-web-app/` | 업무 자동화, 웹앱 개발 문서 | 2 |

## category 생성

새 category는 `content/docs/` 아래에 폴더를 만들고 `_index.md`를 추가한다.

예: `Embedded System` category

```text
content/docs/embedded-system/_index.md
```

```yaml
---
title: "Embedded System"
linkTitle: "Embedded System"
weight: 3
cascade:
  type: docs
  params:
    reversePagination: false
---

임베디드 시스템 관련 문서입니다.
```

`weight` 숫자가 작을수록 왼쪽 사이드바에서 위에 표시된다.

## Org export 경로 지정

Org 파일에서 `#+hugo_section`에 category 경로까지 포함한다.

### Machine Learning 과목

```org
#+title: Example
#+property: header-args :eval never-export
#+options: toc:nil num:nil ^:nil
#+hugo_base_dir: ~/Documents/hugo_doc
#+hugo_section: docs/machine-learning/bitcoin-price-prediction
#+export_file_name: example
#+hugo_front_matter_format: yaml
#+hugo_custom_front_matter: :toc true :weight 1
```

결과:

```text
content/docs/machine-learning/bitcoin-price-prediction/example.md
```

### 업무용웹앱 과목

```org
#+title: 장비대여시스템
#+property: header-args :eval never-export
#+options: toc:nil num:nil ^:nil
#+hugo_base_dir: ~/Documents/hugo_doc
#+hugo_section: docs/business-web-app
#+export_file_name: example
#+hugo_front_matter_format: yaml
#+hugo_custom_front_matter: :toc true :weight 2
```

결과:

```text
content/docs/business-web-app/example.md
```

## 과목 순서 변경

과목 또는 문서의 front matter에서 `weight`를 바꾼다.

```yaml
---
title: "Github Vercel 배포하기"
toc: true
weight: 1
---
```

```yaml
---
title: "장비대여시스템"
toc: true
weight: 2
---
```

## category 숨김

왼쪽 사이드바에서 숨기려면 해당 category의 `_index.md`에 `sidebar.exclude`를 추가한다.

```yaml
---
title: "숨길 category"
sidebar:
  exclude: true
---
```

## export 후 확인

Org에서 export 한 뒤 Hugo 빌드를 확인한다.

```bash
hugo --gc --minify --cleanDestinationDir
```

로컬 서버는 `1313` 포트만 사용한다.

```bash
hugo server --disableFastRender --renderToMemory --port 1313
```

## 배포 흐름

변경사항을 GitHub에 올리면 Cloudflare가 자동으로 다시 빌드한다.

```bash
git status --short
git add -A
git commit -m "Update docs structure"
git push
```

배포 주소:

```text
https://class.sparkylab.co.kr
```
