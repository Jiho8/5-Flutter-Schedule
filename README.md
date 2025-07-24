
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

### 1. 최초 실행 시에만 Splash 화면 노출
* `Hive`를 사용하여 방문 여부를 확인하고 `visited` 값을 로컬에 저장
* Splash 관련 로직은 `SplashController`에서 관리하며, `SplashWrapper`에서 이를 판단해 `MyApp`으로 분기
* 최초 방문 시: `SplashWrapper → Splash → MyApp`
* 재방문 시: `SplashWrapper → MyApp`으로 바로 진입

### 2. 일정 등록 및 확인
* 달력에서 날짜 선택 시 해당 날짜에 일정을 추가할 수 있는 입력 폼 표시
* 일정은 `제목 + 메모(선택)` 형태로 입력하며, `Hive`를 통해 로컬 저장
* 일정이 있는 날짜는 **작은 마커 점**으로 표시되고, 선택 시 하단에 리스트로 표시
* **오늘 날짜**와 **선택한 날짜**는 각각 구분되는 색상으로 강조

### 3. 일정 리스트 및 삭제
* 선택한 날짜의 일정은 리스트로 확인 가능하며, 리스트 아이템을 누르면 상세 팝업 표시
* 각 리스트에 위치한 삭제 버튼을 통해 일정 삭제 가능
* 삭제는 일정을 등록할 때 고유값 `time` 을 기준으로 정확히 처리

### 4. 월별 일정 모아보기
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
| **Hive** | **Local DB 저장** |![Hive](https://img.shields.io/badge/Hive-090F32?style=flat-square&logo=data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzUiIGhlaWdodD0iMzMiIHZpZXdCb3g9IjAgMCAzNSAzMyIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTI3LjI4ODMgMTUuNzk1OEwyNC44NDExIDE3LjIwNDNMMjcuMjg4OCAxOC42MTQyQzI4LjgwMjcgMTkuNDg2MyAyOS43MzUzIDIxLjA5NzcgMjkuNzM1MyAyMi44NDE1QzI5LjczNTMgMjQuNTg1NCAyOC44MDI3IDI2LjE5NjggMjcuMjg4OCAyNy4wNjg5TDI3LjI4ODYgMjcuMDY5MUMyNS43NzQxIDI3Ljk0MTQgMjMuOTA4MiAyNy45NDE0IDIyLjM5MzcgMjcuMDY5MUwxOS45NDcxIDI1LjY1OTdWMjAuMDIzNUwxNy40OTk5IDIxLjQzMkwxNS4wNTI5IDIwLjAyMzVWMjguNDc4OEwxNy40OTk5IDI5Ljg4NzNMMTkuOTQ3NiAzMS4yOTY5QzIyLjk3NTkgMzMuMDQwNyAyNi43MDY2IDMzLjA0MDkgMjkuNzM0OSAzMS4yOTcyQzMyLjc2MzUgMjkuNTUzMiAzNC42Mjk0IDI2LjMyOTkgMzQuNjI5NCAyMi44NDE1VjIyLjg0MTJDMzQuNjI5NCAxOS4zNTMxIDMyLjc2MzkgMTYuMTMgMjkuNzM1NCAxNC4zODU4TDI3LjI4ODMgMTIuOTc2NlYxNS43OTU4WiIgZmlsbD0idXJsKCNwYWludDBfbGluZWFyXzE5Xzg0NCkiLz4KPHBhdGggZD0iTTEyLjYwNjYgMS43MDI3M0wxMi42MDYzIDEuNzAyOUM5LjU3NzYyIDMuNDQ2OTMgNy43MTE3MyA2LjY3MDI1IDcuNzExNzMgMTAuMTU4NlYxMi45NzY1TDcuODYxMDMgMTIuODkxMUwxMC4xNTg3IDExLjU2ODJMMTIuNjA1OSAxMi45NzY1VjEwLjE1ODVDMTIuNjA1OSA4LjQxNDYyIDEzLjUzODQgNi44MDMzMSAxNS4wNTI0IDUuOTMxMjFMMTUuMDUyNiA1LjkzMTA0QzE2LjU2NjkgNS4wNTg1OSAxOC40MzI5IDUuMDU4NTkgMTkuOTQ3NCA1LjkzMTA0TDE5Ljk0NzYgNS45MzEyMUMyMS40NjE2IDYuODAzMzEgMjIuMzk0MSA4LjQxNDYyIDIyLjM5NDEgMTAuMTU4NVYxMi45NzY1TDE3LjQ5OTkgMTUuNzk1OEwxOS45NDcxIDE3LjIwNDNWMjAuMDIzNEwyNC44NDExIDE3LjIwNDNMMjcuMjg4MiAxNS43OTU4VjEwLjE1ODZDMjcuMjg4MiA2LjY3MDI1IDI1LjQyMjQgMy40NDY5MyAyMi4zOTM1IDEuNzAyOUwyMi4zOTM0IDEuNzAyNzNDMjAuODc5MiAwLjgzMDk4MSAxOS4xODk2IDAuMzk1MDIgMTcuNTAwMSAwLjM5NTAyQzE1LjgxMDQgMC4zOTUwMiAxNC4xMjA3IDAuODMwOTgxIDEyLjYwNjYgMS43MDI3M1oiIGZpbGw9InVybCgjcGFpbnQxX2xpbmVhcl8xOV84NDQpIi8+CjxwYXRoIGQ9Ik03Ljg2MTA0IDEyLjg5MTJMNy43MTE3NCAxMi45NzY3TDUuMjY0NTcgMTQuMzg1OUMyLjIzNjExIDE2LjEzMDEgMC4zNzA1NzUgMTkuMzUzMiAwLjM3MDU3NSAyMi44NDEzVjIyLjg0MTZDMC4zNzA1NzUgMjYuMzMgMi4yMzY0NiAyOS41NTM0IDUuMjY1MjcgMzEuMjk3NEM4LjI5MzM4IDMzLjA0MSAxMi4wMjQzIDMzLjA0MDkgMTUuMDUyNCAzMS4yOTdMMTcuNDk5OSAyOS44ODc1TDE1LjA1MjkgMjguNDc5VjI1LjY1OTlMMTIuNjA2MyAyNy4wNjkyQzExLjA5MTggMjcuOTQxNSA5LjIyNTg5IDI3Ljk0MTUgNy43MTEzOSAyNy4wNjkyTDcuNzExMjIgMjcuMDY5MUM2LjE5NzI1IDI2LjE5NyA1LjI2NDc1IDI0LjU4NTcgNS4yNjQ3NSAyMi44NDE4QzUuMjY0NzUgMjEuMDk4IDYuMTk3MjUgMTkuNDg2NSA3LjcxMTIyIDE4LjYxNDRMMTAuMTU4NyAxNy4yMDQ1TDE1LjA1MjkgMjAuMDIzNlYxNy4yMDQ1TDE3LjQ5OTkgMTUuNzk2TDEyLjYwNTkgMTIuOTc2N0wxMC4xNTg3IDExLjU2ODRMNy44NjEwNCAxMi44OTEyWiIgZmlsbD0idXJsKCNwYWludDJfbGluZWFyXzE5Xzg0NCkiLz4KPGRlZnM+CjxsaW5lYXJHcmFkaWVudCBpZD0icGFpbnQwX2xpbmVhcl8xOV84NDQiIHgxPSIxNS4wNTI5IiB5MT0iMjIuNzkwOCIgeDI9IjM0LjYyOTQiIHkyPSIyMi43OTA4IiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+CjxzdG9wIHN0b3AtY29sb3I9IiM3RjQ5REQiLz4KPHN0b3Agb2Zmc2V0PSIwLjUiIHN0b3AtY29sb3I9IiMwMEEzRkYiLz4KPHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjMTdGOURBIi8+CjwvbGluZWFyR3JhZGllbnQ+CjxsaW5lYXJHcmFkaWVudCBpZD0icGFpbnQxX2xpbmVhcl8xOV84NDQiIHgxPSI3LjcxMTc1IiB5MT0iMTAuMjA5MyIgeDI9IjI3LjI4ODMiIHkyPSIxMC4yMDkzIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+CjxzdG9wIHN0b3AtY29sb3I9IiM3RjQ5REQiLz4KPHN0b3Agb2Zmc2V0PSIwLjUiIHN0b3AtY29sb3I9IiMwMEEzRkYiLz4KPHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjMTdGOURBIi8+CjwvbGluZWFyR3JhZGllbnQ+CjxsaW5lYXJHcmFkaWVudCBpZD0icGFpbnQyX2xpbmVhcl8xOV84NDQiIHgxPSIwLjM3MDU5MiIgeTE9IjIyLjA4NjciIHgyPSIxNy41IiB5Mj0iMjIuMDg2NyIgZ3JhZGllbnRVbml0cz0idXNlclNwYWNlT25Vc2UiPgo8c3RvcCBzdG9wLWNvbG9yPSIjN0Y0OUREIi8+CjxzdG9wIG9mZnNldD0iMC41IiBzdG9wLWNvbG9yPSIjMDBBM0ZGIi8+CjxzdG9wIG9mZnNldD0iMSIgc3RvcC1jb2xvcj0iIzE3RjlEQSIvPgo8L2xpbmVhckdyYWRpZW50Pgo8L2RlZnM+Cjwvc3ZnPgo=)|
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
- [기획 및 화면 설계](https://www.figma.com/design/KNGUa6baNsOlnvCgD5Hbfs/3rd_project_Monzi?node-id=1-5097&t=0RZwGLr5hBWLWTjR-1)

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
4. Splash (`splash_wrapper.dart`)
   : 앱 최초 실행 시 보여지는 스플래시 화면. 이후 메인으로 이동

### 위젯
1. `showScheduleDialogdart`
   : 일정 아이템을 클릭했을 때 나타나는 상세 팝업. 일정의 제목, 메모, 등록 시간 등 정보 확인 가능.

## 🧩 컨트롤러 (상태 관리)

1. 캘린더 컨트롤러 (`calendar_controller.dart`) 
   **GetX**를 사용한 전역 상태 관리 컨트롤러로, 캘린더 및 일정 데이터 관리 <br>

   주요 역할:
     - Hive를 통해 일정 데이터 저장/불러오기
     - 선택된 날짜의 일정 리스트 관리
     - 월 전체 일정 리스트 갱신
     - 일정 추가, 삭제 처리

2. Splash 컨트롤러 (`splash_controller.dart`)
   **Hive**를 통해 첫 방문 여부를 저장하고 확인 <br>

   주요 역할:
      - Hive Box에서 `visited` 값을 읽어 첫 방문 여부 판단
      - 최초 방문 시 2초간 스플래시 화면 노출 후 `visited = true` 저장

## 💥 이슈 및 해결

### 1. Splash 화면이 앱 실행 시마다 계속 노출됨
- 앱을 실행할 때마다 매번 Splash 화면이 나타나는 문제
- **원인**: `Hive`를 통해 방문 여부를 저장하거나 확인하는 로직 없이 단순히 타이머로 Splash를 제어
- **해결**: `SplashController`를 만들어 `Hive`의 `settingBox`에 방문 여부를 저장하고, `SplashWrapper`에서 해당 값을 기준으로 분기 처리하도록 수정

### 2. 일정 추가 후 화면이 바로 갱신되지 않음
- 일정 추가 버튼을 통해 데이터를 저장했지만, 일정 목록이 즉시 화면에 반영되지 않고 페이지를 변경하거나 새로고침해야만 화면이 갱신되는 문제
- **원인**: `Hive`에 데이터는 정상 저장되나, UI가 구독하는 `RxList`(`controller.list`)에 데이터 변경 사실이 반영되지 않아 GetX가 화면 갱신을 감지하지 못함. <br>
즉, `list`에 직접 데이터 추가나 갱신 호출 없이 저장만 하여 화면 업데이트가 지연됨.
- **해결**: `addSchedule` 함수에서 `Hive`에 저장 후, `RxList`인 `list`에 새 아이템을 직접 추가하고 `.refresh()` 메서드를 호출하여 변경을 강제로 알림.
