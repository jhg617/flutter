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
          width: double.infinity, /// 최대한의 크기 지정
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            //crossAxisAlignment: CrossAxisAlignment.center, // 기본값은 center
            crossAxisAlignment: CrossAxisAlignment.stretch, // 컬럼의 크기를 최대한으로 늘림
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