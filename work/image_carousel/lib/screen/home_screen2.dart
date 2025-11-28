import 'dart:async';
import 'package:flutter/material.dart';

/// 홈 화면 위젯
/// 이미지 캐러셀을 표시하는 화면입니다.
class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  // 현재 페이지 인덱스를 추적하는 변수
  int currentIndex = 0;
  // PageView를 제어하기 위한 컨트롤러
  late PageController _pageController;
  // 자동 페이지 전환을 위한 타이머
  late Timer _timer;
  // 이미지 개수 (1부터 5까지)
  final int imageCount = 5;

  @override
  void initState() {
    super.initState();
    // PageController 초기화 (첫 페이지는 0번 인덱스)
    _pageController = PageController(initialPage: 0);
    
    // 3초마다 자동으로 다음 페이지로 이동하는 타이머 설정
    _timer = Timer.periodic(
      const Duration(
        seconds: 3), (timer) {
      // 다음 페이지 인덱스 계산 (순환: 0, 1, 2, 3, 4, 0, 1, ...)
      currentIndex = (currentIndex + 1) % imageCount;
      
      // PageController를 사용하여 다음 페이지로 부드럽게 이동
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300), // 애니메이션 지속 시간
        curve: Curves.easeInOut, // 애니메이션 곡선 (부드러운 전환)
      );
    });
  }

  @override
  void dispose() {
    // 타이머 취소 (메모리 누수 방지)
    _timer.cancel();
    // PageController 해제 (메모리 누수 방지)
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // PageView를 사용하여 가로 스와이프로 이미지를 넘길 수 있는 캐러셀 구현
      body: PageView(
        // PageController를 연결하여 프로그래밍 방식으로 페이지 제어 가능
        controller: _pageController,
        // 사용자가 수동으로 스와이프할 때 currentIndex를 동기화
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        // 1부터 5까지의 숫자 리스트를 생성하고, 각 숫자를 이미지 위젯으로 변환
        children: [1, 2, 3, 4, 5]
          .map(
            // 각 숫자(e)에 대해 asset 폴더의 이미지 파일을 로드하는 Image 위젯 생성
            (e) => Image.asset(
              // asset/img/image_1.jpeg ~ image_5.jpeg 경로의 이미지 파일 참조
              'asset/img/image_$e.jpeg',
              // BoxFit.cover: 이미지를 화면 전체를 채우도록 확대/축소
              // 비율을 유지하면서 화면을 가득 채움 (잘릴 수 있음)
              fit: BoxFit.cover,
          ),
        ).toList(), // map 결과를 List로 변환하여 PageView의 children에 전달
      ),
    );
  }
}