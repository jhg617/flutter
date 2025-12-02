import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false, // 하단 시스템 영역까지 사용
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _Top(),
              _Bottom(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Container(
        child: Column(
          children: [
            Text(
              'U&I',
              style: textTheme.displayLarge,
            ),
            Text(
              '우리 처음 만난날',
              style: textTheme.bodyLarge,
            ),
            Text(
              '2023.07.03',
              style: textTheme.bodyMedium,
            ),
            IconButton(
              iconSize: 60.0,
              color: Colors.red,
              onPressed: () {
                // iOS 스타일 DatePicker 다이얼로그 표시
                showCupertinoDialog(
                  context: context,
                  barrierDismissible: true, // 외부 탭 시 다이얼로그 닫힘
                  // builder: 다이얼로그에 표시할 위젯을 반환하는 함수
                  builder: (BuildContext context) {
                    return Align(
                      alignment: Alignment.center, // 화면 중앙에 배치
                      child: Container(
                        color: Colors.white,
                        height: 300.0, // DatePicker 높이 고정
                        child: CupertinoDatePicker(
                          // 날짜만 선택 모드 (옵션: time, dateAndTime)
                          mode: CupertinoDatePickerMode.date,
                          // 날짜 변경 시 호출되는 콜백 (DateTime 타입의 선택된 날짜 전달)
                          onDateTimeChanged: (DateTime date) {
                            print(date); // 현재는 콘솔 출력만, 실제로는 상태에 저장 필요
                          },
                          // 날짜 표시 순서: 연-월-일 (한국식, 옵션: mdy, dmy)
                          dateOrder: DatePickerDateOrder.ymd,
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.favorite),
            ),
            Text('D+880',
              style: textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Image.asset(
          'asset/img/middle_image.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}