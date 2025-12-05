import 'package:flutter/material.dart';
import 'package:navigation/layout/default_layout.dart';

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'RouteThreeScreen',
      children: [
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