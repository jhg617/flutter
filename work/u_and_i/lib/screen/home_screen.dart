import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

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
              _Top(
                selectedDate: selectedDate,
                // 하트 버튼 클릭 시 날짜 선택 다이얼로그 표시
                // VoidCallback 타입의 콜백 함수를 전달
                onPressed: onHeartPressed,
              ),

              // 이미지 영역
              _Bottom(),
            ],
          ),
        ),
      ),
    );
  }

  void onHeartPressed() {
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
                // 선택된 날짜를 상태에 저장
                setState(() {
                  selectedDate = date;
                }); // 현재는 콘솔 출력만, 실제로는 상태에 저장 필요
              },
              // 날짜 표시 순서: 연-월-일 (한국식, 옵션: mdy, dmy)
              dateOrder: DatePickerDateOrder.ymd,
            ),
          ),
        );
      },
    );
  }
}

// 위쪽 영역 담당하는 위젯
class _Top extends StatelessWidget {
  final DateTime selectedDate;
  // Stateless 위젯은 직접 상태를 변경하지 않으므로
  // callback을 통해 상위 Stateful 위젯에 상태 변경을 요청한다.
  final VoidCallback? onPressed;
  
  const _Top({
    required this.selectedDate,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // 오늘날짜를 변수에 저장
    final now = DateTime.now();

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
              // 선택된 년도, 월, 일을 화면에 표시
              '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
              style: textTheme.bodyMedium,
            ),
            IconButton(
              iconSize: 60.0,
              color: Colors.red,
              onPressed: onPressed,
              icon: const Icon(Icons.favorite),
            ),
            Text(
              // D+ 표시 (오늘 날짜와 선택된 날짜의 차이를 계산하여 D+ 표시)
              'D+${now.difference(selectedDate).inDays + 1}',
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