import 'package:flutter/material.dart';
import 'onboarding/onboarding_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '藝rism ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingPages(), // OnboardingPages를 첫 화면으로 설정
    );
  }
}
