import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

/// 랜덤 숫자 생성기 메인 화면
/// StatelessWidget: 상태가 없는 정적 위젯 (상태 변경이 필요하면 StatefulWidget으로 변경 필요)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = [
    123,
    456,
    789,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 배경색: 상수로 정의된 primaryColor 사용
      backgroundColor: primaryColor,
      // SafeArea: 시스템 UI(노치, 상태바 등) 영역을 피해 콘텐츠를 안전하게 배치
      body: SafeArea(
        // 좌우 여백 16px 추가 (화면 가장자리와 콘텐츠 사이 간격)
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            // stretch: 자식 위젯들이 가로폭을 최대한 사용하도록 설정
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// 상단 헤더 영역: 제목과 설정 아이콘 버튼
              _Header(),

              /// 중간 콘텐츠 영역: 생성된 숫자 표시
              _Body(
                numbers: numbers,
              ),

              /// 하단 액션 영역: 랜덤 숫자 생성 버튼
              _Footer(
                onPressed: (){
                  setState(() {
                    numbers = [
                      999,
                      888,
                      777,
                    ];
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 상단 헤더 위젯
/// - 제목 텍스트와 설정 아이콘 버튼을 좌우로 배치
/// - private 클래스(_Header): 이 파일 내에서만 사용
class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // spaceBetween: 제목은 왼쪽, 설정 버튼은 오른쪽에 배치
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 화면 제목: 흰색, 30px, 굵은 글씨
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          color: redColor,
          onPressed: () {},
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}

/// 중간 콘텐츠 영역 위젯
/// - Expanded: 남은 공간을 모두 차지하여 숫자 표시 영역 확장
/// - 현재는 임시 텍스트 (나중에 이미지나 다른 위젯으로 교체 예정)
class _Body extends StatelessWidget {
  final List<int> numbers;

  const _Body({
    required this.numbers,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: numbers
            .map((e) => e.toString().split(''))
            // 첫 번째 map: 각 행(리스트)을 Row 위젯으로 변환
            // e = [1,2,3] → Row 위젯
            // e = [4,5,6] → Row 위젯
            // e = [7,8,9] → Row 위젯
            .map(
              (e) => Row(
                children: e
                    // 두 번째 map: 각 행의 숫자를 Text 위젯으로 변환
                    // number = 1 → Text('1')
                    // number = 2 → Text('2')
                    // number = 3 → Text('3')
                    .map(
                      (number) => Image.asset(
                        'asset/img/$number.png',
                        width: 50.0,
                        height: 70.0,
                      ),
                    )
                    .toList(), // Iterable을 List로 변환 (Row의 children은 List<Widget> 필요)
              ),
            )
            .toList(), // Iterable을 List로 변환 (Column의 children은 List<Widget> 필요)
      ),
    );
  }
}

/// 하단 액션 버튼 위젯
/// - 랜덤 숫자 생성 기능을 실행하는 버튼
/// - 빨간색 배경(redColor), 흰색 텍스트
class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      // 버튼 스타일: 빨간색 배경, 흰색 텍스트
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        foregroundColor: Colors.white,
      ),
      child: Text('생성하기!'),
    );
  }
}
