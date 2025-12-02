import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            // 크기 제약: 200x200으로 고정
            height: 200,
            width: 200,
            color: Colors.red,
            child: Align(
              // Alignment(x, y): x는 -1(왼쪽)~1(오른쪽), y는 -1(위)~1(아래)
              alignment: Alignment(
                0.5,
                -0.5), // 중앙에서 오른쪽 위로
              child: Container(
                height: 50,
                width: 50,
                color: Colors.blue,
              ),
            ),
            ),
          ),
        ),
      );
  }
}