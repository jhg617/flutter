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
                // [1] onPressed: null이면 버튼은 자동으로 비활성화(Disabled) 상태가 됩니다.
                onPressed: null,//(){},
                style: ButtonStyle(
                  // [2] backgroundColor: 버튼의 배경 색상을 상태(State)에 따라 결정합니다.
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                      // [3] MaterialState.pressed: 사용자가 버튼을 누르고 있는 상태
                      if (states.contains(MaterialState.pressed)){
                        return Colors.red; // 눌렀을 때 배경 색상: 빨간색
                      }

                      // [4] 그 외 상태 (기본, 비활성화 등): 검은색을 반환
                      return Colors.black; // 기본 색상
                    },
                  ),
                  // [5] foregroundColor: 버튼 위의 텍스트/아이콘 색상(전경색)을 상태에 따라 결정합니다.
                  foregroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.pressed)){
                        return Colors.black;
                      }
                      // [6] MaterialState.disabled: 버튼이 비활성화된 상태 => 버튼을 누를 수 없는 상태
                      if(states.contains(MaterialState.disabled)){
                        return Colors.red;
                      }
                      // [7] 그 외 상태 (활성화된 기본 상태): 흰색을 반환
                      return Colors.white;
                    },
                  ),
                  // [8] minimumSize: 버튼의 최소 크기를 상태에 따라 결정합니다.
                  minimumSize: MaterialStateProperty.resolveWith(
                    (states) {
                      if(states.contains(MaterialState.pressed)){
                        return Size(200, 150);
                      }
                      // [9] 그 외 상태 (기본, 비활성화 등): (300, 200)을 반환
                      return Size(300, 200);
                    },
                  ),
                ),
                child: Text('Text Button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}