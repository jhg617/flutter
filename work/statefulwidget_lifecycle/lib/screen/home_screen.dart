import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CodeFactoryWidget(),
          ],
        ),
      )
    );
  }
}

class CodeFactoryWidget extends StatelessWidget {
  const CodeFactoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        width: 50.0,
        height: 50.0,
    );
  }
}