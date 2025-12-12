import 'package:flutter/material.dart';
import 'package:tabbar_theory/const/tabs.dart'; //TABS 상수 사용(5개 탭 정보)

class BottomNavigationBarScreen extends StatefulWidget {
  // 생성자
  // Key? : 위젯 식별용
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  // 인스턴스 생성
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}
// State 클래스 정의 및 Mixin
// TickerProviderStateMixin : 애니메이션 프레임 제공
class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> 
with TickerProviderStateMixin{
  // 지연초기화 및 한 번만 할당
  late final TabController controller;

  @override
  // 초기화
  void initState() {
    super.initState();

    controller = TabController(
      length: TABS.length,
      // vsync: 애니메이션 동기화용 (TickerProviderStateMixin 필요)
      vsync: this,
    );
    // 리스너 추가하여 인덱스 변경 시 UI 갱신
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  // UI 구성
  Widget build(BuildContext context) {
    // Scaffold : 기본 레이아웃 구조
    return Scaffold(
      // 상단 AppBar (기본값)
      appBar: AppBar(
        title: Text('Bottom Navigation Bar'),
      ),
      // TabBarView : 스와이프 가능한 뷰
      body: TabBarView(
        // controller 연결로 인덱스 동기화
        controller: controller,
        // TABS를 순회하여 각 탭의 아이콘을 중앙에 표시하는 위젯 리스트 생성
        children: TABS
          .map(
            (e) => Center(
              child: Icon(
                e.icon
              ),
            ),
          )
          .toList(),
      ),
      // BottomNavigationBar 설정
      bottomNavigationBar: BottomNavigationBar(
        // 선택된 항목 색상
        selectedItemColor: Colors.black,
        // 비선택된 항목 색상
        unselectedItemColor: Colors.grey,
        // 선택/비선택 항목 모두 라벨 표시
        showSelectedLabels: true,
        showUnselectedLabels: true,
        // 현재 인덱스를 동기화
        currentIndex: controller.index,
        // 선택 시 확장/배경색 변경
        type: BottomNavigationBarType.shifting,
        // 사용자가 아이템 중 하나를 클릭하면 누른 탭으로 화면을 부드럽게 전환시킴
        onTap: (index){
          controller.animateTo(index);
        },
        // TABS를 순회해 리스트를 생성한다.
        // 각 항목은 icon, label
        items: TABS
        .map(
          (e) => BottomNavigationBarItem(
            icon: Icon(
              e.icon,
            ),
            label: e.label,
          ),
        )
        .toList(),
      ),
    );
  }
}