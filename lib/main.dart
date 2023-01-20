import 'package:doctor_app/helper/pinding.dart';
import 'package:doctor_app/pages/booking_page.dart';
import 'package:doctor_app/pages/onboarding_page.dart';
import 'package:doctor_app/theme/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale('ar'),
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'Medical Advice',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: OnBoarding(),
    );
  }
}
