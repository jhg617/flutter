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
            child: Row(
              // 부모 Container의 제약(200x200) 내에서만 배치 가능
              children: [
                Container(
                  // 크기 제약: 50x50으로 고정
                  height: 50,
                  width: 50,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}