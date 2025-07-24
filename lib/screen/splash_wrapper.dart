import 'package:flutter/material.dart';
import 'package:schedule/controller/splash_controller.dart';
import 'package:schedule/main.dart'; // MyApp import

class SplashWrapper extends StatefulWidget {
  const SplashWrapper({super.key});

  @override
  State<SplashWrapper> createState() => _SplashWrapperState();
}

class _SplashWrapperState extends State<SplashWrapper> {
  bool _isLoading = true;
  bool _showSplash = false;

  final SplashController _splashController = SplashController();

  @override
  void initState() {
    super.initState();

    bool firstVisit = !_splashController.visited;
    _showSplash = firstVisit;

    if (firstVisit) {
      // 2초 뒤에 _isLoading = false로 바꿔서 실제 앱으로 넘어가도록 함
      Future.delayed(const Duration(seconds: 2), () {
        _splashController.setVisited();
        setState(() {
          _isLoading = false;
        });
      });
    } else {
      _isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading && _showSplash) {
      // 로딩 중 보여줄 화면 (스플래시)
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blueGrey[50],
          body: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '▶ Monzi v1.0 시작 중...',
                  style: TextStyle(fontSize: 18, fontFamily: 'dosSaem'),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      // 2초 후 실제 앱 실행
      return const MyApp();
    }
  }
}
