import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0D22),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0D22),
      ),
      debugShowCheckedModeBanner: false,
      home: const InputPage(),
    );
  }
}
