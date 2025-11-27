import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(show) CodeFactoryWidget(), // show가 true일 때만 CodeFactoryWidget를 표시
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  show = !show;
                });
              },
              child: Text('클릭해서 보이기/안보이기'),
            ),
          ],
        ),
      )
    );
  }
}

/// StatefulWidget 라이프사이클 예제 위젯
class CodeFactoryWidget extends StatefulWidget {
  /// 1) Constructor: StatefulWidget 생성 시 호출 (State 객체는 아직 생성되지 않음)
  CodeFactoryWidget({super.key}) {
    print('1) Stateful Widget Constructor');
  }

  /// 2) createState: 위젯 트리에 추가될 때 State 객체 생성
  @override
  State<CodeFactoryWidget> createState() {
    print('2) Stateful Widget createState');

    return _CodeFactoryWidgetState();
  }
}

class _CodeFactoryWidgetState extends State<CodeFactoryWidget> {
  /// 3) initState: State 생성 후 한 번만 호출, 초기화 작업 수행
  @override
  void initState() {
    print('3) Stateful Widget initState');
    super.initState(); // 부모의 initState를 호출
  }

  /// 4) didChangeDependencies: initState 직후 및 InheritedWidget 의존성 변경 시 호출
  @override
  void didChangeDependencies() {
    print('4) Stateful Widget didChangeDependencies');
    super.didChangeDependencies();
  }

  /// 5) build: 위젯 빌드 (setState 호출 시마다 재호출)
  @override
  Widget build(BuildContext context) {
    print('5) Stateful Widget build');
    return Container(
        color: Colors.red,
        width: 50.0,
        height: 50.0,
    );
  }

  /// 6) deactivate: 위젯 트리에서 제거되기 직전 호출 (임시 정리 작업)
  @override
  void deactivate() {
    print('6) Stateful Widget deactivate');
    super.deactivate();
  }

  /// 7) dispose: State 완전 제거 시 한 번만 호출, 리소스 정리
  @override
  void dispose() {
    print('7) Stateful Widget dispose');
    super.dispose();
  }
}