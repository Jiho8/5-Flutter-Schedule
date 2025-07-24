import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:schedule/controller/calendar_controller.dart';
import 'package:schedule/widgets/showScheduleDialog.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalendarPage> {
  final controller = Get.find<ScheduleController>();
  bool deleteState = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.loadSchedule();
  }

  final formKey = GlobalKey<FormState>(); // form의 고유key값을 만듦

  @override
  Widget build(BuildContext context) {
    // print(controller.list);
    return Column(
      children: [
        // obx 사용 시 반드시 Rx 값을 화면 렌더링에 사용하는 방식으로..
        Obx(() => calender()),
        SizedBox(height: 20),
        Obx(() {
          return Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(12),
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    var item = controller.list[index];
                    return ListTile(
                      leading: Text('${index + 1}'),
                      title: Text(item['title']),
                      // memo field가 비었을 때는 null
                      subtitle:
                          item['content'] != null &&
                              item['content'].trim().isNotEmpty
                          ? Text(item['content'] as String)
                          : null,
                      trailing: TextButton(
                        onPressed: () {
                          controller.deletedSchedule(item['time']);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 252, 245, 180),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          '삭제',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // trailing: IconButton(
                      //   onPressed: () {
                      //     controller.deletedSchedule(item['time']);
                      //   },
                      //   icon: Icon(Icons.delete),
                      //   color: const Color.fromARGB(255, 252, 245, 180),
                      // ),
                      onTap: () {
                        showScheduleDialog(context, item);
                      },
                    );
                  },
                ),
                Positioned(
                  right: 24,
                  bottom: 24,
                  child: IconButton(
                    onPressed: () {
                      addForm(context);
                    },
                    icon: Icon(Icons.add),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 180, 221, 255),
                      foregroundColor: Colors.white,
                      iconSize: 20,
                      padding: EdgeInsets.all(15),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // 데이터 형태 => {
  //   2025-06-04: [
  //      { content: '내용', time: '2025-06-04'},
  //      { content: '내용', time: '2025-06-04'},
  //   ],
  //   2025-06-05: [
  //      { content: '내용', time: '2025-06-04'},
  //      { content: '내용', time: '2025-06-04'},
  //   ],
  // }
  // Form(
  //   key: formKey,
  //   child: TextFormField(
  //     // validator 같은 속성을 이용하여 유효성 검사를 진행
  //     validator: (value) {},
  //     decoration: labelText('name'),
  //     // button 클릭 시 name이라는 것을 value에 저장.
  //     onSaved: (value){ name = value; },
  //   )
  // )

  // 일정 추가 팝업
  void addForm(context) {
    final titleController = TextEditingController();
    final contentController = TextEditingController();

    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      // validator 같은 속성을 이용하여 유효성 검사를 진행
                      // 검증이 잘 되면 null을 보내줌
                      validator: (value) {
                        // 값이 null이거나 비어있는지 확인 후 메세지 반환
                        if (value == null || value.isEmpty) {
                          return "제목을 입력해주세요.";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(fontSize: 16),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 187, 222, 251),
                          ),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: const Color.fromARGB(255, 187, 222, 251),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: contentController,
                      // validator: (value) => null,
                      decoration: InputDecoration(
                        labelText: 'Memo',
                        labelStyle: TextStyle(fontSize: 16),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 187, 222, 251),
                          ),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: const Color.fromARGB(255, 187, 222, 251),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // 조건문을 통해 값이 입력되었는지 확인
                  if (formKey.currentState!.validate()) {
                    // 일정 추가
                    controller.addSchedule(
                      titleController.text,
                      contentController.text,
                    );

                    // 입력값 초기화
                    titleController.clear();
                    contentController.clear();

                    Navigator.pop(context);
                  }
                },
                child: Text('완료'),
                style: ElevatedButton.styleFrom(
                  // backgroundColor: const Color.fromARGB(255, 114, 181, 236),
                  backgroundColor: Color.fromARGB(255, 252, 245, 180),
                  foregroundColor: Colors.black54,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  //calender
  Widget calender() {
    final Map<DateTime, String> koreanHolidays = {
      DateTime(2025, 1, 1): "신정",
      DateTime(2025, 3, 1): "삼일절",
      DateTime(2025, 5, 5): "어린이날",
      DateTime(2025, 6, 6): "현충일",
      DateTime(2025, 8, 15): "광복절",
      DateTime(2025, 10, 3): "개천절",
      DateTime(2025, 10, 9): "한글날",
      DateTime(2025, 12, 25): "크리스마스",
    };

    return Container(
      // decoration: BoxDecoration(
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.5), // 그림자 색
      //       spreadRadius: 1, // 퍼지는 정도
      //       blurRadius: 8, // 흐림 정도
      //       offset: Offset(2, 4), // x, y 방향 이동
      //     ),
      //   ],
      //   color: Colors.white,
      //   border: Border.all(
      //     color: const Color.fromARGB(255, 207, 207, 207),
      //     width: 1,
      //   ),
      //   borderRadius: BorderRadius.circular(8),
      // ),
      padding: EdgeInsets.all(12),
      child: TableCalendar(
        firstDay: DateTime(2020),
        lastDay: DateTime(2030),
        focusedDay: controller.selectedDate.value,

        // 추가 속성
        // 1. selectedDayPredicate: 선택한 일자 색상 등으로 화면에 표시
        // 2. onDaySelected: 일자 선택 시 change event 발생
        // 3. eventLoader: 등록된 내용을 토대로 달력에 표시
        selectedDayPredicate: (day) {
          // 매개변수로 들어온 값과 controller에 저장된 내가 선택한 값이 일치하는 지 확인.
          return isSameDay(day, controller.selectedDate.value);
        },
        onDaySelected: (day, focusDay) {
          // controller 내 changeDate로 선택한 day 값 보내주어
          controller.changeDate(day);
        },
        eventLoader: (day) {
          String key = '${day.year}-${day.month}-${day.day}';
          var boxget = controller.box.get(key, defaultValue: []);
          return boxget;
        },

        calendarStyle: CalendarStyle(
          markerSize: 5.0,
          markersAlignment: Alignment.bottomCenter,
          markerDecoration: BoxDecoration(
            color: const Color.fromARGB(255, 114, 181, 236),
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: const Color.fromARGB(255, 252, 245, 180),
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: const Color.fromARGB(255, 180, 221, 255),
            shape: BoxShape.circle,
          ),
          selectedTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          todayTextStyle: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
          defaultTextStyle: TextStyle(color: Colors.black87),
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleTextFormatter: (date, locale) =>
              DateFormat('yyyy년 MM월', locale).format(date),
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: Colors.blueGrey[200],
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: Colors.blueGrey[200],
          ),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: TextStyle(
            color: const Color.fromARGB(255, 180, 221, 255),
          ),
        ),
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            final holidayName =
                koreanHolidays[DateTime(day.year, day.month, day.day)];

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${day.day}', style: TextStyle(color: Colors.black)),
                if (holidayName != null)
                  Text(
                    holidayName,
                    style: TextStyle(
                      // color: const Color.fromARGB(255, 255, 137, 129),
                      backgroundColor: const Color.fromARGB(255, 252, 245, 180),
                      color: Colors.black45,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
