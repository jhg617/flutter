import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 핵심: Scaffold의 backgroundColor는 전체 화면 배경색 지정 (Colors.pink[100]은 연한 핑크)
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        // 핵심: SafeArea는 노치, 상태바 등 시스템 UI 영역을 피해 안전한 영역만 사용
        // bottom: false → 하단은 시스템 영역까지 사용 (홈 인디케이터 영역 포함)
        bottom: false,
        child: SizedBox(
          // 핵심: MediaQuery로 화면의 실제 크기 가져오기 (동적 대응)
          // Double.infinity도 가능하지만 MediaQuery가 더 정확한 크기 제공
          width: MediaQuery.of(context).size.width,
          child: Column(
            // 핵심: Column은 수직 방향으로 위젯들을 배치
            children: [
              Expanded(
                // 핵심: Expanded는 남은 공간을 균등하게 분배 (화면을 반으로 나눔)
                child: Container(
                  child: Column(
                    // 핵심: 내부 Column은 메인축 방향(수직)으로 요소들을 배치
                    children: [
                      // 핵심: Text 위젯의 TextStyle로 디자인 커스터마이징
                      // fontFamily: pubspec.yaml에 등록한 커스텀 폰트 사용 (소문자로 입력)
                      // fontSize: 텍스트 크기 지정 (double 타입)
                      // color: 텍스트 색상 지정
                      Text(
                        'U&I',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'parisienne', // 디자인: 장식적 폰트로 타이틀 강조
                          fontSize: 80.0,
                        ),
                      ),
                      Text('우리 처음 만난날',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'sunflower',
                          fontSize: 30.0,
                        ),
                      ),
                      Text(
                        '2023.07.03',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0, // 디자인: 날짜는 작은 크기로 보조 정보 표현
                          fontFamily: 'sunflower',
                        ),
                      ),
                      // 핵심: IconButton의 iconSize로 아이콘 크기, color로 아이콘 색상 지정
                      IconButton(
                        iconSize: 60.0, // 디자인: 아이콘 크기를 크게 설정해 시각적 포인트 강조
                        color: Colors.red, // 디자인: 빨간색으로 하트 아이콘 강조
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite
                        ),
                      ),
                      Text('D+880',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'sunflower',
                          fontSize: 50.0,
                          // 핵심: fontWeight로 폰트 굵기 지정 (w700 = Bold, pubspec.yaml의 weight와 매칭)
                          fontWeight: FontWeight.w700, // 디자인: 굵게 표시해 중요 정보 강조
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                // 핵심: 두 번째 Expanded로 나머지 절반 공간 차지 (화면을 반반으로 분할)
                child: Container(
                  // 핵심: Image.asset으로 pubspec.yaml에 등록한 이미지 에셋 사용
                  // 디자인: Expanded 내부에서 자동으로 이미지가 화면 너비에 맞춰지고 비율 유지됨
                  child: Image.asset(
                    'asset/img/middle_image.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}