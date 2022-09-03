import 'package:flutter/material.dart';
import 'input_page.dart';
import 'result_page.dart';

void main() {
  runApp( BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0E0F20),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0E0F20)),
        ),
      initialRoute: "/",
      routes: {
        "/": (context) => InputPage(),
        "/result" : (context) =>  ResultPage()
      },
    );
  }
}



