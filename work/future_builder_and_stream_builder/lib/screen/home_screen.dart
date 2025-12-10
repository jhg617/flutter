import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<int>(
          stream: streamNumbers(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            print('----data----');
            print(snapshot.connectionState);
            print(snapshot.data);
            

            // ConnectionState 상태 설명:
            // - ConnectionState.none: Future 또는 Stream이 입력되지 않은 상태
            // - ConnectionState.active: Stream에서만 존재 / 스트림 아직 실행중 (FutureBuilder에서는 사용 안됨)
            // - ConnectionState.done: Future 또는 Stream이 종료 됐을때
            // - ConnectionState.waiting: 실행중 (로딩 중)

            // 1. 로딩 중 상태 처리
            if (snapshot.connectionState == ConnectionState.active) {
              return SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text(snapshot.data.toString()),
                  ],
                ),
              );
            }

            // 2. 에러 상태 처리 (hasError 체크는 connectionState가 done일 때만 true가 될 수 있음)
            if (snapshot.hasError) {
              final error = snapshot.error;
              return Center(
                child: Text('에러: $error'),
              );
            }

            // 3. 데이터가 존재하는 경우 (성공적으로 완료된 경우)
            if (snapshot.hasData) {
              final data = snapshot.data;

              return Center(
                child: Text(data.toString()),
              );
            }

            // 4. 데이터가 없는 경우 (일반적으로 발생하지 않지만 안전장치)
            return Center(
              child: Text('데이터가 없습니다.'),
            );
          }
        ),
    );
  }

  Future<int> getNumber() async {
    await Future.delayed(Duration(seconds: 3));

    final random = Random();

    throw '에러!!!!!!';

    return random.nextInt(100);
  }

  Stream<int> streamNumbers() async* {
    for(int i=0; i<10; i++) {
      await Future.delayed(Duration(seconds: 1));

      // if(i == 5)
      //   throw '에러 던져!!!!';
      yield i;
    }
  }
}