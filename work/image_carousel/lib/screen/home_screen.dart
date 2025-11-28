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
  Timer? timer;
  PageController controller = PageController(); //페이지 컨트롤러 초기화

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      Duration(seconds: 2),
      (timer) {
        int currentPage = controller.page!.toInt();
        int nextPage = currentPage + 1;

        if(nextPage > 4) {
          nextPage = 0;
        }

        controller.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.linear //애니메이션이 돌아가는 방식
        );
      },
    );
  }

  @override
  void dispose() {
    if(timer != null) {
      timer!.cancel();
    }

    controller.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // PageView를 사용하여 가로 스와이프로 이미지를 넘길 수 있는 캐러셀 구현
      body: PageView(
        controller: controller, //페이지 컨트롤러 연결
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