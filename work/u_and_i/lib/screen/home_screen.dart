import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //top: true, //기본값은 true
        bottom: false,
        //left: false,
        //right: false,
        child: SizedBox(
          // 앱을 실행하고 있는 화면의 너비/높이를 가져옴
          width: MediaQuery.of(context).size.width,
          // width: Double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Column(
                    children: [
                      Text('U&I'),
                      Text('우리 처음 만난날'),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite
                        ),
                      ),
                      Text('D+1')
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Image.asset(
                    'asset/img/middle_image.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}