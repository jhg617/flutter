import 'package:flutter/material.dart';
import 'package:navigation/layout/default_layout.dart';

class RouteOneScreen extends StatelessWidget {
  final int number;

  const RouteOneScreen({
    required this.number,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'RouteOneScreen',
      children: [
        Text(
          'argument: $number',
          textAlign: TextAlign.center,
        ),
        OutlinedButton(
          onPressed: (){
            Navigator.of(context).pop(
              //데이터 돌려주기
              456,
            );
          },
          child: Text('Pop'),
        ),
      ],
    );
  }
}