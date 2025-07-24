import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ScheduleController extends GetxController {
  // RxList<Map<String, dynamic>> list = [{'string': 100}].obs;

  var list = [].obs;
  var all = [].obs;
  var selectedDate = DateTime.now().obs; // 선택하지 않으면 기본 날짜로 설정
  late Box box; // hive가 데이터를 box에 넣음

  @override
  // ↓ 무조건 실행
  void onInit() {
    super.onInit();
    box = Hive.box('scheduleBox'); // main에서 만든 문서를 불러옴
    ever(
      selectedDate,
      (_) => loadSchedule(),
    ); // selectedDate의 값이 변경(=날짜 선택)되면 뒤 함수가 실행
    loadSchedule(); // selectedDate 값이 변경되지 않아도 실행하도록
  }

  // 저장된 데이터 화면에 보여주기 (list에 저장)
  void loadSchedule() {
    var day = selectedDate.value;
    String key = '${day.year}-${day.month}-${day.day}';
    var getBoxValue = box.get(
      key,
      defaultValue: [],
    ); // defaultValue: 저장된 값이 없을 때 가져올 값

    final safeList = (getBoxValue as List)
        .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e as Map))
        .toList();

    // list: get이라는 package를 이용하고 있는 변수.
    // assignAll: 배열의 형태로 변환?
    list.assignAll(safeList);
    allSchedule();
  }

  // 일정 저장
  void saveSchedule() {
    // hive save
    // { selectedDate : List}
    var day = selectedDate.value;
    String key = '${day.year}-${day.month}-${day.day}';
    box.put(key, list);
    allSchedule();
  }

  // 일정 추가
  void addSchedule(String t, String? c) {
    final now = DateTime.now();
    final key =
        '${selectedDate.value.year}-${selectedDate.value.month}-${selectedDate.value.day}';

    var newItem = {'title': t, 'content': c, 'time': now.toIso8601String()};

    final oldList = box.get(key, defaultValue: []) as List;
    final newList = oldList
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList(); // 복사해서 새 리스트 생성

    newList.add(newItem);

    box.put(key, newList);

    list.add(newItem);
    list.refresh(); // UI 갱신
  }

  // 일정 삭제
  void deletedSchedule(String isoTime) {
    // removeWhere: 해당 아이템을 찾아서 지움.
    list.removeWhere((item) => item['time'] == isoTime);
    saveSchedule();
  }

  void changeDate(day) {
    selectedDate.value = day; // getx package가 날짜를 가질 때는 value에 저장됨
  }

  // 모든 일정 가져오기
  void allSchedule() {
    // toList: 배열로 변환 [ [{},{}], [{}], [{}] ]
    // where: 빈 배열이 아닌 것들만 필터링
    // expand: 각 배열을 하나의 배열로 [ {}, {}, {}, {}]

    // all.assignAll(
    //   box.values
    //       .toList()
    //       .where((list) => list.isNotEmpty)
    //       .expand((list) => list)
    //       .toList(),
    // );
    all.assignAll(
      box.keys
          .where((key) => (box.get(key) as List).isNotEmpty)
          .expand(
            (key) => (box.get(key) as List).map(
              (value) => {'key': key, 'value': value},
            ),
          )
          .toList(),
    );
  }
}
