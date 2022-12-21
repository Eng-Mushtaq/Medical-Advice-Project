import 'package:doctor_app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../animations/bottomAnimation.dart';
import '../widgets/backBtnAndImage.dart';
import '../widgets/textField.dart';

class DoctorLogin extends StatefulWidget {
  @override
  _DoctorLoginState createState() => _DoctorLoginState();
}

final emial = TextEditingController();
final _controllerpassword = TextEditingController();
final _controllerCNIC = TextEditingController();

class _DoctorLoginState extends State<DoctorLogin> {
  //bool validatePhoneVar = false;
  bool validateCNICVar = false;
  bool validateName = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              width: width,
              height: height,
              child: Stack(
                children: <Widget>[
                  BackBtn(),
                  ImageAvatar(
                    assetImage: 'assets/bigDoc.png',
                  ),
                  Container(
                    width: width,
                    height: height,
                    margin:
                        EdgeInsets.fromLTRB(width * 0.03, 0, width * 0.03, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Text(
                          'تسجيل الدخول',
                          style: titleText,
                          // "\t\tLogin",
                          // style: GoogleFonts.abel(
                          //     fontSize: height * 0.044,
                          //     fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        // nameTextField,
                        //phoneTextField,
                        // cnicTextField,
                        textField(
                            inputType: TextInputType.emailAddress,
                            controller: emial,
                            iconData: Icons.email_outlined,
                            lable: ' البريد الالكتروني',
                            onSumbmit: () {
                              FocusScope.of(context).unfocus();
                            }),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        textField(
                            inputType: TextInputType.text,
                            controller: _controllerpassword,
                            iconData: Icons.password_outlined,
                            lable: ' كلمة المرور ',
                            onSumbmit: () {
                              FocusScope.of(context).unfocus();
                            }),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        SizedBox(
                          width: width,
                          height: height * 0.07,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: StadiumBorder(),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                WidgetAnimator(
                                  Image(
                                    image: AssetImage('assets/google.png'),
                                    height: height * 0.035,
                                  ),
                                ),
                                SizedBox(width: height * 0.015),
                                Text('تسجيل الدخول',
                                    style:
                                        subTitle.copyWith(color: Colors.black)),
                                //   style: TextStyle(
                                //       letterSpacing: 2,
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: height * 0.022),
                                // )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        WidgetAnimator(
                          Text(
                            'You Will be asked Question regarding your Qualifications!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.2,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}



class DoctorDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDoctorDetails> providerData;

  DoctorDetails(this.providerDetails, this.userName, this.photoUrl,
      this.userEmail, this.providerData);
}

class ProviderDoctorDetails {
  ProviderDoctorDetails(this.providerDetails);

  final String providerDetails;
}
