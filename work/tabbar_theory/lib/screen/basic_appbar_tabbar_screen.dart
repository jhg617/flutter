import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tabbar_theory/const/tabs.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  const BasicAppbarTabbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS.length, // 탭 개수 지정 (TabBar와 TabBarView 동기화에 필요)
      child: Scaffold(
        appBar: AppBar(
          title: Text('BasicAppBarScreen'),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
                  // AppBar 하단에 탭 버튼들 배치
                  // 인디케이터 색상 변경
                  indicatorColor: Colors.red,
                  indicatorWeight: 4.0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  labelColor: Colors.yellow,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w100,
                  ),
                  tabs: TABS
                      .map(
                        (e) => Tab(
                          icon: Icon(
                            e.icon,
                          ),
                          child: Text(
                            e.label,
                          ),
                        ),
                      )
                      .toList(), // TabBar의 tabs는 List<Tab> 타입 필요
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          // 좌우로 넘기는것 제한하기
          physics: NeverScrollableScrollPhysics(),
          children: TABS
            .map(
              (e) => Center(
                child: Icon(
                  e.icon,
                ),
              ),
          )
          .toList(),
        ),
      ),
    );
  }
}
