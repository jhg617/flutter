import 'package:flutter/material.dart';
import 'package:scrollable_widgets/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      home: HomeScreen(),
    ),
  );
}