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
          //width: double.infinity, /// 최대한의 크기 지정
          height: double.infinity,
          child: Column(
            children: [
              Flexible(
                //flex: 1, // 1은 기본값
                flex: 2, //flex는 남는 공간을 차지하게 되는 비율을 결정한다.
                fit: FlexFit.tight,
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.orange,
                ),
              ),
              Expanded(
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.yellow,
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}