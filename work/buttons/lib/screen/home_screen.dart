import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){}, // (){} => 버튼 눌렀을 때 실행할 함수, null 일 때는 버튼 비활성화
                style: ElevatedButton.styleFrom(
                  /// 배경 색깔
                  backgroundColor: Colors.red,
                  disabledBackgroundColor: Colors.grey,
                  /// 배경 위의 색깔
                  foregroundColor: Colors.white,
                  /// 비활성화 상태 시 배경 위의 색깔
                  disabledForegroundColor: Colors.red,
                  /// 그림자 색깔
                  shadowColor: Colors.green,
                  /// 그림자 효과
                  elevation: 10,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                  padding: EdgeInsets.all(32.0),
                  side: BorderSide(
                    color: Colors.black,
                    width: 12.0,
                  ),
                  //minimumSize: Size(300, 150),
                  //maximumSize: Size(100, 150),
                  //fixedSize: Size(100, 150),
                ),
                child: Text('Elevated Button'),
              ),
              OutlinedButton(
                onPressed: (){},
                child: Text('Outlined Button'),
              ),
              TextButton(
                onPressed: (){},
                child: Text('Text Button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}