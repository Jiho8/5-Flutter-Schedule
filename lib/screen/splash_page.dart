import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.offNamed('/home');
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          '▶ Monzi v1.0 시작 중...',
          style: TextStyle(
            color: Colors.blueGrey[200],
            fontSize: 18,
            fontFamily: 'dosSaem', // 레트로 느낌
          ),
        ),
      ),
    );
  }
}
