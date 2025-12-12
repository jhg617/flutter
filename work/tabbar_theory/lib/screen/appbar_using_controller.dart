import 'package:flutter/material.dart';
import 'package:tabbar_theory/const/tabs.dart';

class AppbarUsingController extends StatefulWidget {
  const AppbarUsingController({Key? key}) : super(key: key);

  @override
  State<AppbarUsingController> createState() => _AppbarUsingControllerState();
}

// TickerProviderStateMixin : 애니메이션을 위한 틱 제공자
// TabController가 애니메이션을 위해 필요
class _AppbarUsingControllerState extends State<AppbarUsingController> with TickerProviderStateMixin{
  // 탭 상태를 관리하는 컨트롤러
  // late final : 나중에 초기화하되 한 번만 할당
  late final TabController tabController;

  // 초기화 단계
  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: TABS.length, // 탭 개수
      vsync: this, // 애니메이션 동기화를 위한 틱 제공자
    );
    tabController.addListener((){
      setState(() {}); // 탭이 변경될 때마다 화면 다시 그리기
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar Using Controller'),
        bottom: TabBar(
          controller: tabController, // TabController 연결
          tabs: TABS
            .map(
              (e) => Tab(
                icon: Icon(
                  e.icon
                ),
                child: Text(e.label),
              ),
            )
            .toList(),
          ),
      ),
      body: TabBarView(
        controller: tabController,
        children: TABS
          .map(
            (e) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  e.icon // 탭의 아이콘 표시
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // "이전" 버튼 (첫 번째 탭이 아닐 때만 표시)
                    if(tabController.index != 0)
                    ElevatedButton(
                      onPressed: (){
                        tabController.animateTo(
                          tabController.index - 1,
                        );
                      },
                      child: Text(
                        '이전',
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    // "다음" 버튼 (마지막 탭이 아닐 때만 표시)
                    if(tabController.index != TABS.length - 1)
                    ElevatedButton(
                      onPressed: (){
                        tabController.animateTo(
                          tabController.index + 1,
                        );
                      },
                      child: Text(
                        '다음',
                      ),
                    ),
                  ],
                ),
              ],
            )
          )
          .toList(),
        ),
    );
  }
}