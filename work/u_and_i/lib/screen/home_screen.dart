import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  color: Colors.red,
                  child: Column(
                    // 핵심: 내부 Column은 메인축 방향(수직)으로 요소들을 배치
                    children: [
                      Text('U&I'),
                      Text('우리 처음 만난날'),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite
                        ),
                      ),
                      Text('D+1')
                    ],
                  ),
                ),
              ),
              Expanded(
                // 핵심: 두 번째 Expanded로 나머지 절반 공간 차지 (화면을 반반으로 분할)
                child: Container(
                  color: Colors.blue,
                  // 핵심: Image.asset으로 pubspec.yaml에 등록한 이미지 에셋 사용
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