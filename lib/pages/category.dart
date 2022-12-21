import 'dart:io';
import 'package:doctor_app/pages/patientLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:medkit/animations/fadeAnimation.dart';
// import 'package:medkit/animations/bottomAnimation.dart';

import '../animations/bottomAnimation.dart';
import '../animations/fadeAnimation.dart';
import '../theme/colors.dart';
import 'doctorLogin.dart';
import 'doctorSignUp.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              title: new Text(
                "Exit Application",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: new Text("Are You Sure?"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        StadiumBorder(),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: new Text(
                    "No",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  // shape: StadiumBorder(),
                  // color: Colors.white,
                  child: new Text(
                    "Yes",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    exit(0);
                  },
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height * 0.065,
              ),
              FadeAnimation(
                0.3,
                Container(
                  margin: EdgeInsets.only(right: width * 0.05),
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                          CircleBorder(),
                        )),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/AboutUs'),
                        child: Icon(
                          Icons.info,
                          size: height * 0.04,
                        ),
                      ),
                      Text('نوع المستخدم', style: titleText
                          //  color: Colors.black, fontSize: height * 0.04),
                          )
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.09),
              Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.2),
                    radius: height * 0.075,
                    child: Image(
                      image: AssetImage("assets/doctor.png"),
                      height: height * 0.2,
                    ),
                  ),
                  WidgetAnimator(patDocBtn('دكتور', context)),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.2),
                    radius: height * 0.075,
                    child: Image(
                      image: AssetImage("assets/patient.png"),
                      height: height * 0.2,
                    ),
                  ),
                  WidgetAnimator(patDocBtn('مريض', context)),
                  SizedBox(
                    height: height * 0.13,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'الاصدار',
                        // 'Version',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'V 0.1',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              )
          ],
          ),
        ),
      ),
    );
  }

  Widget patDocBtn(String categoryText, context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.5,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: StadiumBorder(),
        ),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   CupertinoPageRoute(
          //     builder: (context) => DoctorSignUpScreen(),
          //   ),
          // );
          if (categoryText == 'دكتور') {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => SignUpScreen(isDoctor: true,),
                
              ),
            );
            // Navigator.pushNamed(context, '/DoctorLogin');
          } else {
             Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => SignUpScreen(isDoctor: false ,),
            ),
          );
            // Navigator.pushNamed(context, '/PatientLogin');
          }
        },
        child: Text(" أنا " + categoryText, style: titleText
            // GoogleFonts.notoKufiArabic()
            //     .copyWith(color: Color.fromARGB(255, 21, 107, 177), fontSize: 18),
            ),
      ),
    );
  }
}
