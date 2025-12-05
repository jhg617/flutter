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
                style: ButtonStyle(
                  /// Material State
                  /// 
                  /// hovered - 호버링 상태 (마우스 커서를 올려놓은 상태)
                  /// focused - 포커스 됐을 때 (텍스트 필드)
                  /// pressed - 눌렀을때
                  /// dragged - 드래그 됐을때
                  /// selected - 선택됐을때 (체크박스, 라디오버튼)
                  /// scrollUnder - 다른 컴포넌트 밑으로 스크롤링 됐을때
                  /// disabled - 비활성화 상태
                  /// error - 에러 상태
                  backgroundColor: MaterialStateProperty.all( // 어떤 상태이던간에 적용할 색깔 지정
                    Colors.red,
                  ),
                  minimumSize: MaterialStateProperty.all( // onPressed가 null이어도 기본 최소 크기 보장
                    Size(200, 150),
                  ),
                ),
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