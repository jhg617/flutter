import 'package:flutter/material.dart';
import 'package:navigation/layout/default_layout.dart';

class RouteOneScreen extends StatelessWidget {
  const RouteOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'RouteOneScreen',
      children: [
        OutlinedButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: Text('Pop'),
        ),
      ],
    );
  }
}