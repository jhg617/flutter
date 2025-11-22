import 'package:flutter/material.dart';

/// 'android/app/build.gradle'
void main() {
  /// 플러터 앱을 실행한다.
  runApp(
    /// MaterialApp은 항상 최상위에 위치한다.
    /// Scaffold는 바로 아래에 위치한다.
    /// 위젯 -> Widget
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(  
            '이음:사람과 사람을 잇다',
          ),
        )
      ),
    ), // MaterialApp
  );
}