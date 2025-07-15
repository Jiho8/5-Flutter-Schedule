
![img-thumb-02](https://github.com/user-attachments/assets/6df05059-99ba-4e73-8455-a2e479bc4763)

## 📢 소개
Monzi는 **Flutter로 제작된 일정 관리 웹**입니다. <br>
사용자가 캘린더를 통해 쉽고 직관적으로 일정을 추가하고 관리하며, 월별 일정을 한눈에 파악할 수 있도록 돕는 데 중점을 두었습니다. <br>

Hive를 활용한 로컬 데이터 저장으로 안정적인 일정 관리를 제공하며, <br>
모바일(최대 480px) 환경에 최적화된 반응형 UI로 스마트폰에서도 쾌적한 사용 경험을 선사합니다.

## 🔗 배포 URL
* 사이트: https://monzi.vercel.app
* 배포 깃허브: https://github.com/Jiho8/Monzi.git

## 📑 프로젝트 요약

### 1. 주제

* 캘린더 기반 일정 관리 웹

### 2. 목표

* 사용자가 캘린더를 통해 직관적으로 일정을 등록, 확인 및 삭제할 수 있도록 한다.
* 등록된 월별 일정을 한눈에 모아보고 가독성 높게 파악할 수 있는 UI를 제공하여 일정 관리 편의성을 극대화한다.

### 3. 주요 기능

* 캘린더 기반 일정 관리
* 일정 추가 및 삭제
* 월간 일정 리스트

### 4. 주요 기술 스택

* Flutter, Hive

## 📆 기간 및 인원

* 총 작업 기간 : 5일
* 개인 프로젝트 (1명)

## 💡 기능 구현 상세

### 1. 일정 등록 및 확인
* 달력에서 날짜 선택 시 해당 날짜에 일정을 추가할 수 있는 입력 폼 표시
* 일정은 `제목 + 메모(선택)` 형태로 입력하며, Hive를 통해 로컬 저장
* 일정이 있는 날짜는 **작은 마커 점**으로 표시되고, 선택 시 하단에 리스트로 표시
* **오늘 날짜**와 **선택한 날짜**는 각각 구분되는 색상으로 강조

### 2. 일정 리스트 및 삭제
* 선택한 날짜의 일정은 리스트로 확인 가능하며, 리스트 아이템을 누르면 상세 팝업 표시
* 각 리스트에 위치한 삭제 버튼을 통해 일정 삭제 가능
* 삭제는 일정을 등록할 때 고유값 `time` 을 기준으로 정확히 처리

### 3. 월별 일정 모아보기
* 이번 달에 등록된 모든 일정은 별도의 화면에서 날짜별 그룹 리스트로 확인 가능
* 리스트는 날짜 순 정렬, 지난 일정은 회색 배경으로 구분
* 일정이 없는 경우에는 별도의 안내 메시지와 이미지가 표시

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
| **GetX** | **라우팅 & 상태 관리 프레임워크** |![GetX](https://img.shields.io/badge/GetX-8A2BE2?style=flat-square&logo=getx&logoColor=white")|

### 2. UI/UX 라이브러리

| 사용기술 | 설명 | Badge |
| :---:| :---: | :---: |
| **table_calendar** | **캘린더 지원** |![tableCalendar](https://img.shields.io/badge/table_calendar-blue?style=flat-square)|

### 3. 개발 도구

|사용기술 | 설명 | Badge | 
| :---:| :---: | :---: |
| **Visual Studio Code (VS Code)** | **코드 편집기 (에디터)** |![VSCode](https://img.shields.io/badge/VSCode-007ACC?style=flat-square&logo=data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTI0LjAwMyAyTDEyIDEzLjMwM0w0Ljg0IDhMMiAxMEw4Ljc3MiAxNkwyIDIyTDQuODQgMjRMMTIgMTguNzAyTDI0LjAwMyAzMEwzMCAyNy4wODdWNC45MTNMMjQuMDAzIDJaTTI0IDkuNDM0VjIyLjU2NkwxNS4yODkgMTZMMjQgOS40MzRaIiBmaWxsPSJ3aGl0ZSIvPgo8L3N2Zz4K&logoColor=white) |
| **GitHub** | **버전 관리** |![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white)| 
| **Vercel** | **서버리스 플랫폼** |![vercel](https://img.shields.io/badge/Vercel-000000?style=flat-square&logo=vercel&logoColor=white)|
| **Figma** | **디자인 & UI/UX**|![Figma](https://img.shields.io/badge/Figma-F24E1E?style=flat-square&logo=Figma&logoColor=white) |

## 📚 참고 URL
- 기획 및 화면 설계 : https://www.figma.com/design/KNGUa6baNsOlnvCgD5Hbfs/3rd_project_Monzi?node-id=1-5097&t=0RZwGLr5hBWLWTjR-1

<hr>

# 개발 상세

## 📑 요약

### 화면 (Screen)
1. 메인 (`main.dart`)
   : 앱 실행 시 Hive 초기화 및 SplashWrapper 진입 설정
2. 캘린더 및 일정 등록 (`calendar_page.dart`)
   : 달력 위젯을 통해 날짜를 선택하고, 해당 날짜의 일정을 추가하거나 확인할 수 있는 화면
3. 월간 일정 리스트 (`monthly_page.dart`)
   : 현재 달에 등록된 모든 일정을 날짜별로 그룹화하여 보여주는 화면
4. Splash
   : 앱 최초 실행 시 보여지는 스플래시 화면. 첫 진입 여부에 따라 2초간 노출

### 위젯
1. `showScheduleDialogdart`
   : 일정 아이템을 클릭했을 때 나타나는 상세 팝업. 일정의 제목, 메모, 등록 시간 등 정보 확인 가능.
2. `splashWrapper.dart`
   : Splash 부모 컴포넌트. Hive 상태를 바탕으로 첫 진입 여부 판단.

## 🧩 컨트롤러 (상태 관리)

* 캘린더 컨트롤러 (`calendar_controller.dart`) 
   - GetX를 사용한 전역 상태 관리 컨트롤러로, 캘린더 및 일정 데이터 관리.
   - 주요 역할:
     ** Hive를 통해 일정 데이터 저장/불러오기
     ** 선택된 날짜의 일정 리스트 관리
     ** 월 전체 일정 리스트 갱신
     ** 일정 추가, 삭제 처리
     ** 앱 시작 시 Hive Box를 통해 사용자 첫 방문 여부 확인 및 Splash 처리

## 💥 이슈 및 해결

### 1. `NewPost.dart` 
이슈 1. 비밀번호 형식 오류 시 '필수값 없음' 팝업 발생
   - 원인: `Form` 위젯에서 `onSaved` 방식을 사용하여 `.save` 호출 전까지 입력값이 변수에 저장되지 않음
     -> `validator`가 모든 필드가 비어있다고 인식
   - **해결**: `onChanged` 방식으로 전환하여 입력값을 실시간으로 변수에 저장하도록 수정
   
이슈 2. 비밀번호 안내 텍스트 + 글자 수 카운터 -> 하단 여백 문제
   - 원인: `TextFormField`의 `buildCounter`와 안내 텍스트가 동시에 노출되며 불필요한 여백 발생
   - **해결**: `buildCounter` 속성을 커스터마이징하여 특정 조건(`idx == 3`)일 때만 카운터를 숨김 처리

이슈 3. 배포 시 CORS 헤더 중복
   - 원인: `flutter`가 자동 추가하는 CORS 관련 헤더와 PHP 서버 코드에서 수동 추가한 헤더가 중복되어 오류 발생
   - **해결**: PHP 파일 내 `Access-Control-Allow-Origin` 관련 헤더 제거

### 2. `text_style.dart` - 모든 Text 위젯에 Obx 적용이 비효율적
- 원인: `scale` 값은 `RxDouble`로 상태가 관리되지만, 이를 적용하려면 모든 `Text` 위젯을 `Obx`로 감싸야 함
  -> 코드량 증가 -> 유지보수 난이도 상승
- **해결**:
  - 공통 텍스트 스타일을 관리하는 `AppTextStyles` 클래스 생성
  - 클래스 내부에 `RxDouble scale` 변수를 선언하고, 각 스타일을 `getter`로 구성
  - 텍스트 크기 조절은 슬라이더에서 `scale.value`를 변경하는 방식으로 통합 처리

