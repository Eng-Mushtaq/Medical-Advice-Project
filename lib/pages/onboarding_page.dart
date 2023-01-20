import 'package:doctor_app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'category.dart';
import 'login_page.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingSlider(

        headerBackgroundColor: Colors.white,
        finishButtonText: 'انشاء حساب ',
        finishButtonTextStyle: GoogleFonts.tajawal(),
        onFinish: () {
        Get.to(Category());
        },
        trailing: Text('تسجيل الدخول', style: GoogleFonts.tajawal()),
        trailingFunction: (){
       Get.to(LoginScreen());
        },

        skipTextButton: Text('تخطي', style: GoogleFonts.tajawal()),
        background: [
          Image.asset(
            'assets/doctors.png',
            // height: size.height,
            width: size.width,
          ),

          Image.asset('assets/doctor1.png'),
          Image.asset(
            'assets/doctor2.png',
            // height: size.height,
            width: size.width,
          ),
          // Image.asset('assets/slide_2.png'),
        ],
        totalPage: 3,
        speed: 1.8,
        controllerColor: primary,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('مرحبا بكـ',
                    style: title2Text

                    ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'نقدم لك استشارة طبية مجانية ومع أشهر الأطباء والمختصين',
                  style: subTitle,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('استشير طبيبك من المنزل', style: title2Text),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'من خلال تطبيق استشاري تستطيع التواصل مع أشهر الأطباء في تخصصات عديدة من البيت وبدون الحاجة الى الى الذهاب الى المستشفى',
                  style: subTitle,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('دردش مع طبيبك الخاص', style: title2Text),
                SizedBox(
                  height: 10,
                ),
                Text(
                    'تستطيع التواصل مع المستشارين بعدة طرق محتلفة للتواصل وارسال الفحوصات والتقارير الطبية بسرية تااامة',
                    textDirection: TextDirection.rtl,
                    style: subTitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
