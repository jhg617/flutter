import 'package:flutter/material.dart';

class NumberToImage extends StatelessWidget {
  final int number;

  const NumberToImage({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
          .toString()
          .split('')
          .map(
            (number) =>
                Image.asset('asset/img/$number.png', width: 50.0, height: 70.0),
          )
          .toList(), // Iterable을 List로 변환 (Row의 children은 List<Widget> 필요)
    );
  }
}
