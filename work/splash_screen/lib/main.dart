import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}

// stless 단축어로 위젯 생성(생성자 포함)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /// 335CB0
        backgroundColor: Color(0xFF335CB0),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32.0,
          ),
          child: Column(
            /// 중앙 정렬
            mainAxisAlignment: MainAxisAlignment.center,
            /// children 파라미터는 여러 개의 위젯을 배열 형태로 전달
            children: [
              Image.asset(
                'asset/img/logo.png',
              ),
              SizedBox(height: 28.0),
              CircularProgressIndicator(
                color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}