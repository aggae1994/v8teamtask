import 'package:flutter/material.dart';
import 'package:flutter_yerism_app/onboarding/onboarding.dart';
import 'package:flutter_yerism_app/onboarding/onboarding_pages.dart';
import 'package:flutter_yerism_app/signuplogin/login.dart';
import 'package:flutter_yerism_app/signuplogin/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
    '/login': (context) => LoginScreen(), // 로그인 화면 경로
    '/signup': (context) => SignupScreen(), // 회원가입 화면 경로
  }, home: OnboardingPages(),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        )
);
       
  }
}
