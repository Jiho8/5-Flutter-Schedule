
![img-thumb-02](https://github.com/user-attachments/assets/6df05059-99ba-4e73-8455-a2e479bc4763)

## 📢 소개
사용자가 직접 밸런스 게임을 만들고, 다른 사람들과 함께 즐길 수 있는 SPA 웹사이트, <b>"Doody"</b> 입니다. <br>

다른 사용자들이 만든 다양한 밸런스 게임을 한눈에 모아보고, <br>
클릭 한 번으로 간편하게 참여할 수 있습니다. <br>

간편한 등록 및 삭제 기능, 그리고 사용자 맞춤형 테마·폰트 설정을 통해 <br>
편리하고 유연한 사용 경험을 제공합니다. <br>

모바일(480px) 환경에 최적화된 반응형 디자인과 직관적인 UI로, <br>
누구나 쉽게 사용할 수 있도록 구성했습니다.


## 🔗 배포 URL
* 사이트: https://monzi.vercel.app
* 배포 깃허브: https://github.com/Jiho8/Monzi.git

## 📑 프로젝트 요약

### 1. 주제

* 캘린더 기반 일정 관리 웹

### 2. 목표

* 사용자가 밸런스 게임을 통해 서로의 생각을 공유하고 소통할 수 있도록 한다.
* 별도의 회원가입 없이도 게임 생성, 삭제 등 기본 기능을 쉽게 수행할 수 있게 한다.
* 테마 및 폰트 설정 등 개인 맞춤 기능을 통해 사용자 경험의 만족도를 높인다.

### 3. 핵심 기능

* 캘린더 UI
* 일정 등록 및 삭제
* 월간 일정 리스트

### 4. 주요 기술 스택

* Front-End : Flutter

## 📆 기간 및 인원

* 총 작업 기간 : 3일
* 개인 프로젝트 (1명)

## 💡 주요 기능

### 1. 검색
* 원하는 주제나 게임을 손쉽게 탐색 가능
* 실시간 검색어 입력에 반응하여 빠르게 결과 확인 가능

### 2. 밸런스 게임 참여
* 클릭을 통해 게임 참여 및 결과 확인 가능
* 좋아요/싫어요 버튼을 통해 반응을 남겨 의견 표현
* 게임 생성 시 설정한 비밀번호가 일치할 경우 해당 게임 삭제

### 3. 밸런스 게임 등록
* 원하는 질문과 두 가지 선택지를 입력하여 나만의 밸런스 게임 생성
* 등록된 게임은 목록에 바로 반영

### 4. 커스터마이징 (테마, 폰트)
* 토글 스위치를 통해 라이트 모드/다크 모드를 간편하게 변경 가능
* 슬라이더를 사용해 텍스트 크기를 3단계 중 원하는 크기로 설정 가능

## 🗂️ 폴더 구조

```
📂monzi
┣ 📂front                     # monzi ( Front-End_Flutter )
┃ ┣ 📂assets
┃ ┃ ┣ 📂fonts
┃ ┃ ┣ 📂imgs
┃ ┣ 📂lib
┃ ┃ ┣ 📂controller            # Hive/GetX controller 폴더
┃ ┃ ┣ 📂screen                # 각 페이지 컴포넌트 폴더
┃ ┃ ┗ 📂widgets               # 위젯 폴더
┃ ┃ ┗ 📜main.dart             # 전체 위젯 트리 구성 파일
┗ ┗ README.md
```

## 💻 개발 환경

### 1. Front-End

| 사용기술 | 설명 |Badge |
| :---:| :---: | :---: |
| **Flutter** | **앱 전체 UI 프레임워크** |![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=flat-square&logo=Flutter&logoColor=white)|
| **Dart** | **Flutter 기본 언어** |![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=dart&logoColor=white)|
| **Hive** | **Local DB 저장** | ![Hive](https://img.shields.io/badge/Hive-2.2.3-yellow?style=flat-square&logo=https://raw.githubusercontent.com/hivedb/hive/master/.github/logo_transparent.svg&logoColor=white)|

### 2. UI/UX 라이브러리

| 사용기술 | 설명 | Badge |
| :---:| :---: | :---: |
| **GetX** | **라우팅 & 상태 관리 프레임워크** |![GetX](https://img.shields.io/badge/GetX-8A2BE2?style=flat-square&logo=getx&logoColor=white")|
| **flutter_svg** | **SVG 아이콘 및 이미지 지원** |![flutter_svg](https://img.shields.io/badge/flutter__svg-SVG-blue?style=flat-square)|
| **toggle_switch** | **커스텀 토글 스위치 UI 위젯** |![toggle_switch](https://img.shields.io/badge/toggle__switch-toggle-green?style=flat-square)|

### 3. 개발 도구

|사용기술 | 설명 | Badge | 
| :---:| :---: | :---: |
| **Visual Studio Code (VS Code)** | **코드 편집기 (에디터)** |![VSCode](https://img.shields.io/badge/VSCode-007ACC?style=flat-square&logo=data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTI0LjAwMyAyTDEyIDEzLjMwM0w0Ljg0IDhMMiAxMEw4Ljc3MiAxNkwyIDIyTDQuODQgMjRMMTIgMTguNzAyTDI0LjAwMyAzMEwzMCAyNy4wODdWNC45MTNMMjQuMDAzIDJaTTI0IDkuNDM0VjIyLjU2NkwxNS4yODkgMTZMMjQgOS40MzRaIiBmaWxsPSJ3aGl0ZSIvPgo8L3N2Zz4K&logoColor=white) |
|**GitHub** | **버전 관리** |![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white)| 
| **Vercel** | **서버리스 플랫폼** |![vercel](https://img.shields.io/badge/Vercel-000000?style=flat-square&logo=vercel&logoColor=white)|
| **Figma** | **디자인 & UI/UX**|![Figma](https://img.shields.io/badge/Figma-F24E1E?style=flat-square&logo=Figma&logoColor=white) |

## 📚 참고 URL
- 기획 및 화면 설계 : 
- 발표 자료 : 
- 인터페이스 구현 보고서 : 
- 프로젝트 완료 보고서 :

<hr>

# 개발 상세

## 📑 요약

### 화면 (Screen)
1. 메인 (`main.dart`)
   : 앱 실행 시 최초 진입 여부를 판단하여 스플래시 화면을 보여주는 역할
3. 캘린더 및 일정 등록 (`calendar_page.dart`)
   : 테마 변경, 텍스트 크기 조절 등 사용자 환경 설정을 위한 화면
4. 월간 일정 리스트 (`monthly_page.dart`)
   : 사용자가 원하는 밸런스 게임 질문을 작성하고 등록할 수 있는 화면
5. Splash (`splash_page.dart`)
   : 테마 변경, 텍스트 크기 조절 등 사용자 환경 설정을 위한 화면

### 위젯
1. `showScheduleDialogdart`
   : 일정 클릭 시 해당 일정의 상세 내용 표시용 팝업
2. `splashWrapper.dart`
   : Splash 부모 컴포넌트

## 🧩 컨트롤러 (상태 관리)

* 캘린더 컨트롤러 (`calendar_controller.dart`) 
   - 앱 시작 시 `splash box`를 통해 사용자의 첫 방문 여부 확인
   - 첫 방문일 경우 2초 간 스플래시 화면을 노출한 뒤, `Hive`에 방문 여부 저장 후 스플래시 종료

## 💥 이슈 및 해결

### 1. `NewPost.dart` 
이슈 1. 비밀번호 형식 오류 시 '필수값 없음' 팝업 발생
   - 원인: `Form` 위젯에서 `onSaved` 방식을 사용하여 `.save` 호출 전까지 입력값이 변수에 저장되지 않음
     -> `validator`가 모든 필드가 비어있다고 인식
   - **해결 방법**: `onChanged` 방식으로 전환하여 입력값을 실시간으로 변수에 저장하도록 수정
   
이슈 2. 비밀번호 안내 텍스트 + 글자 수 카운터 -> 하단 여백 문제
   - 원인: `TextFormField`의 `buildCounter`와 안내 텍스트가 동시에 노출되며 불필요한 여백 발생
   - **해결 방법**: `buildCounter` 속성을 커스터마이징하여 특정 조건(`idx == 3`)일 때만 카운터를 숨김 처리

이슈 3. 배포 시 CORS 헤더 중복
   - 원인: `flutter`가 자동 추가하는 CORS 관련 헤더와 PHP 서버 코드에서 수동 추가한 헤더가 중복되어 오류 발생
   - **해결 방법**: PHP 파일 내 `Access-Control-Allow-Origin` 관련 헤더 제거

### 2. `text_style.dart` - 모든 Text 위젯에 Obx 적용이 비효율적
- 원인: `scale` 값은 `RxDouble`로 상태가 관리되지만, 이를 적용하려면 모든 `Text` 위젯을 `Obx`로 감싸야 함
  -> 코드량 증가 -> 유지보수 난이도 상승
- **해결 방법**:
  -> 공통 텍스트 스타일을 관리하는 `AppTextStyles` 클래스 생성
  -> 클래스 내부에 `RxDouble scale` 변수를 선언하고, 각 스타일을 `getter`로 구성
  -> 텍스트 크기 조절은 슬라이더에서 `scale.value`를 변경하는 방식으로 통합 처리

