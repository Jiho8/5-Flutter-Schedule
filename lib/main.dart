import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

import 'package:schedule/controller/calendar_controller.dart';
import 'package:schedule/screen/calendar_page.dart';
import 'package:schedule/screen/monthly_page.dart';
import 'package:schedule/screen/splash_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // hive 비동기 처리
  await Hive.initFlutter(); // hive 초기화
  await Hive.openBox('scheduleBox'); // 문서 생성
  await Hive.openBox('splashBox');

  Get.put(ScheduleController()); // get(전역 state) 사용 준비

  runApp(const SplashWrapper());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  int selectedIdx = 0;

  void changeIndex(int i) {
    setState(() {
      selectedIdx = i;
    });
  }

  List<Widget> pageList = [monthly_page(), CalendarPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monzi',
      theme: ThemeData(
        fontFamily: 'dosSaem',
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'M☁nzi',
            style: TextStyle(
              // color: Colors.black54,
              color: const Color.fromARGB(255, 114, 181, 236),
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[50],
          // backgroundColor: Colors.blueGrey[100],
        ),
        body: pageList[selectedIdx],
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color.fromARGB(255, 114, 181, 236),
          selectedLabelStyle: TextStyle(fontSize: 16),
          unselectedLabelStyle: TextStyle(fontSize: 14),
          backgroundColor: Colors.white,
          currentIndex: selectedIdx,
          onTap: changeIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.view_agenda_rounded),
              label: 'Monthly',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_rounded),
              label: 'Calendar',
            ),
          ],
        ),
      ),
    );
  }
}
