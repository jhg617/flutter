import 'package:flutter/material.dart';
import 'package:random_number_generator/component/number_to_image.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingScreen extends StatefulWidget {
  final int maxNumber;
  const SettingScreen({
    required this.maxNumber,
    super.key
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // 상태를 상위에서 관리: 여러 위젯이 같은 값을 공유할 수 있도록 상태를 위로 올림
  // 단일 소유자: maxNumber는 여기서만 관리하여 데이터 일관성 보장
  double maxNumber = 1000;

  initState() {
    super.initState();

    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 작은 위젯들을 조합하여 화면 구성
              // 상위의 maxNumber 상태를 하위 위젯에 전달
              _Number(
                maxNumber: maxNumber,
              ),
              _Slider(
                value: maxNumber,
                onChanged: onSliderChanged,
              ),
              _Button(
                onPressed: onSavePressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSavePressed(){
    Navigator.of(context).pop(
      maxNumber.toInt(),
    );
  }

  onSliderChanged(double value){
    setState(() {
      maxNumber = value;
    });
  }
}

// 네비게이션 처리만 담당하는 순수 위젯
// 상태가 없어서 항상 같은 결과를 렌더링함
class _Button extends StatelessWidget {
  final VoidCallback onPressed;
  const _Button({
    required this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Text('저장'),
    );
  }
}

// 숫자 표시만 담당하는 순수 위젯
// 전달받은 데이터만 표시하므로 자체 상태 관리 불필요
// final로 선언하여 받은 값이 변경되지 않음을 보장
class _Number extends StatelessWidget {
  final double maxNumber;

  const _Number({
    required this.maxNumber,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: NumberToImage(
          number: maxNumber.toInt(),
        ),
      ),
    );
  }
}

class _Slider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const _Slider({
    required this.value,
    required this.onChanged,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      min: 1000,
      max: 100000,
      activeColor: redColor,
      onChanged: onChanged,
    );
  }
}