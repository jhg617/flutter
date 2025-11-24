import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /// 335CB0
        backgroundColor: Color(0xFF335CB0),
        body: Column(
          /// 중앙 정렬
          mainAxisAlignment: MainAxisAlignment.center,
          /// children 파라미터는 여러 개의 위젯을 배열 형태로 전달
          children: [
            Image.asset(
              'asset/img/logo.png',
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
  );
}