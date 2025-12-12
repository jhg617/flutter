import 'package:flutter/material.dart';
import 'package:tabbar_theory/screen/basic_appbar_tabbar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => BasicAppbarTabbarScreen(),
                ),
              );
            },
            child: Text('Basic AppBar TabBar Screen'),
          ),
        ],
      ),
    );
  }
}