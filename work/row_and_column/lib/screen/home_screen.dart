import 'package:flutter/material.dart';
import 'package:row_and_column/const/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: colors.map(
              (e) => Container(
                height: 50.0,
                width: 50.0,
                color: e,
              ),
            ).toList(), /// map함수 이후 toList() 함수를 통해 리스트로 변환
          ),
        ),
      ),
    );
  }
}