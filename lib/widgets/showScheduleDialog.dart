import 'package:flutter/material.dart';

// 일정 내용 확인 팝업
void showScheduleDialog(context, dynamic data) {
  showDialog(
    context: context,
    builder: (context) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            // decoration 속성이 있을 때는 color 속성을 바깥에 쓰지 말고 decoration 안에 함께 쓰기
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: const Color.fromARGB(255, 187, 222, 251),
                      ),
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 5), // 텍스트와 선 사이 여백
                  child: Text(data['title'], style: TextStyle(fontSize: 18)),
                  margin: EdgeInsets.only(bottom: 20),
                ),
                if (data['content'] != null &&
                    data['content'].trim().isNotEmpty)
                  Text(data['content']),
                SizedBox(height: 20),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    Text("${data['time'].toString()} 에 추가했어요"),
                    SizedBox(width: 5),
                    Text(
                      "☆",
                      style: TextStyle(
                        fontSize: 11,
                        color: const Color.fromARGB(255, 187, 222, 251),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
