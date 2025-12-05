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
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context){
                return RouteThreeScreen();
              }
              ),
            );
          },
          child: Text('Pop')
        ),
      ],
    );
  }
}