import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

/// 랜덤 숫자 생성기 메인 화면
/// StatelessWidget: 상태가 없는 정적 위젯 (상태 변경이 필요하면 StatefulWidget으로 변경 필요)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold: Material Design 앱의 기본 화면 구조 제공
    return Scaffold(
      backgroundColor: primaryColor,
      // SafeArea: 시스템 UI(노치, 상태바 등) 영역을 피해 콘텐츠를 안전하게 배치
      body: SafeArea(
        // Column: 자식 위젯들을 수직으로 배치하는 레이아웃 위젯
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0
          ),
          child: Column(
            children: [
              /// 상단 헤더 영역: 제목과 설정 아이콘 버튼
              // Row: 자식 위젯들을 수평으로 배치하는 레이아웃 위젯
              Row(
                // spaceBetween: 양 끝에 배치 (제목은 왼쪽, 설정 버튼은 오른쪽)
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 화면 제목 텍스트
                  Text(
                    '랜덤숫자 생성기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                    ),
                  ),
                ],
              ),
          
              /// 중간 콘텐츠 영역: 생성된 숫자 표시
              // Expanded: 남은 공간을 모두 차지하도록 확장하는 위젯
              // 화면 크기가 변경되어도 항상 남은 공간을 모두 사용
              Expanded(
                child: Text('''
              123
              456
              789
              '''),
              ),
          
              /// 하단 액션 영역: 랜덤 숫자 생성 버튼
              // ElevatedButton: Material Design의 입체감 있는 버튼
              ElevatedButton(
                onPressed: (){},
                child: Text('생성하기!')
              ),
            ],
          ),
        ),
      ),
    );
  }
}