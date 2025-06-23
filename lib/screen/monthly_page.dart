import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule/controller/calendar_controller.dart';
import 'package:schedule/widgets/showScheduleDialog.dart';

class monthly_page extends StatefulWidget {
  const monthly_page({super.key});

  @override
  State<monthly_page> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<monthly_page> {
  final controller = Get.find<ScheduleController>();
  bool deleteState = false;

  // useEffect처럼 처음 한 번만 실행
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.loadSchedule();
  }

  Map<String, List<Map<String, dynamic>>> groupedSchedule(List<dynamic> data) {
    Map<String, List<Map<String, dynamic>>> grouped = {};

    for (var item in data) {
      String key = item['key'];
      Map<String, dynamic> value = Map<String, dynamic>.from(item['value']);

      grouped.putIfAbsent(key, () => []).add(value);
    }
    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var allData = controller.all;
      var grouped = groupedSchedule(allData);
      // var keyList = grouped.keys.toList();

      var now = DateTime.now();
      var startOfMonth = DateTime(now.year, now.month, 1); // 이번 달 첫번째 날
      var endOfMonth = DateTime(
        now.year,
        now.month + 1,
        1,
      ).subtract(Duration(days: 1)); // 이번 달 마지막 날;
      var today = DateTime(now.year, now.month, now.day); // time 제거한 오늘 날짜

      // parse는 month 값이 두자리여야 하므로 전처리 필요
      String fixDateFormat(String date) {
        final parts = date.split('-');
        final year = parts[0];
        final month = parts[1].padLeft(2, '0'); // 한 자리면 0 붙임
        final day = parts[2].padLeft(2, '0');
        return '$year-$month-$day';
      }

      // 오늘 날짜 기준으로 지난 날짜인 지 확인
      bool isPastDate(DateTime date) {
        final target = DateTime(date.year, date.month, date.day);
        return target.isBefore(today);
      }

      // 이번 달 데이터만 필터링
      final filterdItems = grouped.entries.where((entry) {
        final date = DateTime.parse(fixDateFormat(entry.key));
        return date.isAfter(startOfMonth.subtract(Duration(days: 1))) &&
            date.isBefore(endOfMonth.add(Duration(days: 1)));
      }).toList();

      // grouped를 정렬해서 리스트 형태로 변환 (오름차순 정렬)
      final sortedEntries = filterdItems
        ..sort((a, b) {
          final dataA = DateTime.parse(fixDateFormat(a.key));
          final dataB = DateTime.parse(fixDateFormat(b.key));
          return dataA.compareTo(dataB);
        });

      return filterdItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/imgs/noData.jpg',
                    width: 500,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    '이번 달에는 일정이 없어요 ☁',
                    style: TextStyle(fontSize: 18, color: Colors.blueGrey[200]),
                  ),
                ],
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Text(
                    '${controller.all.length} 개의 일정이 있어요 ☁',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                // SizedBox(height: 30),
                Expanded(
                  child: ListView.builder(
                    itemCount: sortedEntries.length,
                    itemBuilder: (context, index) {
                      final entry = sortedEntries[index];
                      final dateString = entry.key; // 화면에 보여줄 때 사용할 key값
                      final date = DateTime.parse(
                        fixDateFormat(dateString),
                      ); // 날짜 비교를 위한 타입 변환
                      final items = entry.value; // 화면에 보여줄 때 사용할 value값
                      final isPast = isPastDate(date); // date 값이 과거 날짜인 지 확인
                      final backgroundColor = isPast
                          ? Colors.grey[300]
                          : (index % 2 == 0
                                ? Color.fromARGB(255, 252, 245, 180)
                                : Color.fromARGB(255, 205, 233, 255));

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dateString,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            ...items.map(
                              (item) => Container(
                                margin: EdgeInsets.only(bottom: 8),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withAlpha(50),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child:
                                    // content 값의 유무로 ListTile 분기 처리
                                    item['content'] != null &&
                                        item['content'].trim().isNotEmpty
                                    ? ListTile(
                                        title: Text(item['title']),
                                        subtitle: Text(item['content']),
                                        onTap: () {
                                          showScheduleDialog(context, item);
                                        },
                                      )
                                    : ListTile(
                                        title: Text(item['title']),
                                        onTap: () {
                                          showScheduleDialog(context, item);
                                        },
                                      ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
    });
  }
}
