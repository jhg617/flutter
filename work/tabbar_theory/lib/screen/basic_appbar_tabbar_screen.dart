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
          bottom: TabBar( // AppBar 하단에 탭 버튼들 배치
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
        ),
        body: Column(children: []),
      ),
    );
  }
}
