import 'package:flutter/material.dart';
import 'package:navigation/layout/default_layout.dart';

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 넘겨준 데이터 받기 : 네비게이션 스택에 있는 화면에서 넘겨준 데이터를 받을 수 있다.
    final arguments = ModalRoute.of(context)?.settings.arguments;

    return DefaultLayout(
      title: 'RouteThreeScreen',
      children: [
        Text(
          // 넘겨준 데이터 문자열로 표시하기, 1111111 -> "1111111"
          arguments.toString(),
          textAlign: TextAlign.center,
        ),
        OutlinedButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: Text('Pop')
        ),
      ],
    );
  }
}