import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../animations/bottomAnimation.dart';
import '../widgets/backBtnAndImage.dart';

class PatientLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            BackBtn(),
            ImageAvatar(
              assetImage: 'assets/bigPat.png',
            ),
            Container(
              width: width,
              height: height,
              margin: EdgeInsets.fromLTRB(
                  width * 0.05, height * 0.1, width * 0.05, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Login",
                    style: GoogleFonts.abel(
                        fontSize: height * 0.045, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    'Features',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '1. Details about different Diseases/Medicines'
                    '\n2. Add your favorite Doctors'
                    '\n3. Request to add Disease/Medicine'
                    '\n4. Report incorrect Disease/Medicine'
                    '\n5. Search for Nearest Pharmacy'
                    '\n6. Feeback/Complains',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        height: height * 0.002),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: height * 0.013),
                      backgroundColor: Colors.white,
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {
                      // _signIn(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        WidgetAnimator(
                          Image(
                            image: AssetImage('assets/google.png'),
                            height: height * 0.038,
                          ),
                        ),
                        SizedBox(width: width * 0.02),
                        Text(
                          'Login Using Gmail',
                          style: TextStyle(
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w600,
                              fontSize: height * 0.021),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: height * 0.15),
                width: width,
                height: height * 0.07,
                child: WidgetAnimator(
                  Text(
                    '"The Job You are Struggling for will replace \nYou within a week if you found dead.'
                    '\nTake care of yourself!"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: height * 0.018,
                        color: Colors.black.withOpacity(0.3),
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
