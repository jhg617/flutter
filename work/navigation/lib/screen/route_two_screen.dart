import 'package:flutter/material.dart';
import 'package:navigation/layout/default_layout.dart';
import 'package:navigation/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 넘겨준 데이터 받기
    final arguments = ModalRoute.of(context)?.settings.arguments;

    return DefaultLayout(
      title: 'RouteTwoScreen',
      children: [
        Text(
          arguments.toString(),
          textAlign: TextAlign.center,
        ),
        OutlinedButton(
          onPressed: (){
            //Navigator.of(context).pop();
            // 네비게이션 스택에 화면 이동하기
            Navigator.of(context).pushNamed(
              '/three', // 이동하고싶은 라우트 이름
              arguments: 1111111, // 넘겨줄 데이터
            );
          },
          child: Text('Push Route Three'),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return RouteThreeScreen();
                },
                settings: RouteSettings(
                  arguments: 999,
                ),
              ),
            );
          },
          child: Text('Push Replacement'),
        ),
        OutlinedButton(
          onPressed: () {
            // 라우트 이름으로 화면 이동하기
            Navigator.of(context).pushReplacementNamed(
              '/three',
              arguments: 999,
            );
          },
          // 라우트 이름으로 화면 이동하기
          child: Text('Push Replacement Named'),
        ),
      ],
    );
  }
}