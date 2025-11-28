import 'dart:async';
import 'package:flutter/material.dart';

/// 홈 화면 위젯
/// 이미지 캐러셀을 표시하는 화면입니다.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ============================================
  // 1단계: 필요한 변수 선언
  // ============================================
  
  // 자동 페이지 전환을 제어하기 위한 타이머
  // null을 허용하는 타입으로 선언하여 dispose에서 안전하게 취소 가능
  Timer? timer;
  
  // PageView의 페이지를 프로그래밍 방식으로 제어하기 위한 컨트롤러
  // animateToPage(), jumpToPage() 등의 메서드로 페이지 이동 가능
  PageController controller = PageController();

  // ============================================
  // 2단계: 위젯 초기화 시 자동 페이지 전환 설정
  // ============================================
  @override
  void initState() {
    super.initState();

    // Timer.periodic: 일정 주기마다 반복 실행되는 타이머 생성
    timer = Timer.periodic(
      Duration(seconds: 2), // 2초마다 콜백 함수 실행
      (timer) {
        // 현재 PageView가 표시하고 있는 페이지 인덱스 가져오기
        // controller.page는 double 타입이므로 toInt()로 정수 변환
        int currentPage = controller.page!.toInt();
        
        // 다음 페이지 인덱스 계산 (현재 페이지 + 1)
        int nextPage = currentPage + 1;

        // 마지막 페이지(인덱스 4)를 넘어가면 첫 페이지(인덱스 0)로 순환
        // 총 5개의 이미지(인덱스 0~4)이므로 4를 초과하면 0으로 리셋
        if(nextPage > 4) {
          nextPage = 0;
        }

        // PageController를 사용하여 다음 페이지로 부드럽게 이동
        controller.animateToPage(
          nextPage, // 이동할 페이지 인덱스
          duration: Duration(milliseconds: 500), // 페이지 전환 애니메이션 지속 시간
          curve: Curves.linear // 애니메이션 곡선 (일정한 속도로 이동)
        );
      },
    );
  }

  // ============================================
  // 3단계: 위젯 제거 시 리소스 정리 (메모리 누수 방지)
  // ============================================
  @override
  void dispose() {
    // 타이머가 실행 중이면 취소하여 백그라운드에서 계속 실행되는 것을 방지
    if(timer != null) {
      timer!.cancel();
    }

    // PageController 해제 (메모리 누수 방지)
    controller.dispose();
    
    super.dispose();
  }

  // ============================================
  // 4단계: UI 구성 - PageView와 Controller 연결
  // ============================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // PageView를 사용하여 가로 스와이프로 이미지를 넘길 수 있는 캐러셀 구현
      body: PageView(
        // PageController를 연결하여 프로그래밍 방식으로 페이지 제어 가능
        // Timer에서 controller.animateToPage()를 호출하면 이 PageView가 반응함
        controller: controller,
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