import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'onboarding/onboarding_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
