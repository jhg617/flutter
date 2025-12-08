import 'package:flutter/material.dart';
import 'package:navigation/layout/default_layout.dart';
import 'package:navigation/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int number;

  const RouteOneScreen({
    required this.number,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: DefaultLayout(
        title: 'RouteOneScreen',
        children: [
          Text(
            'argument: $number',
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
            onPressed: (){
              Navigator.of(context).pop(
                //데이터 돌려주기
                456,
              );
            },
            child: Text('Pop'),
          ),
          OutlinedButton(
            onPressed: (){
              Navigator.of(context).maybePop(
                //데이터 돌려주기
                456,
              );
            },
            child: Text('Maybe Pop'),
          ),
          OutlinedButton(
            onPressed: (){
              print(Navigator.of(context).canPop());
            },
            child: Text('Can Pop'),
          ),
          OutlinedButton(
            onPressed: (){
              Navigator.of(context).push(
                //데이터 돌려주기
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return RouteTwoScreen();
                  },
                  settings: RouteSettings(
                    arguments: 789,
                  ),
                ),
              );
            },
            child: Text('Push'),
          ),
        ],
      ),
    );
  }
}