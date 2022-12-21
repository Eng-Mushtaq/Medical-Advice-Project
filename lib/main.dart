import 'package:doctor_app/pages/onboarding_page.dart';
import 'package:doctor_app/theme/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medical Consolution',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: OnBoarding(),
    );
  }
}
