// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctor_app/controller/doctorSignUpController.dart';
import 'package:doctor_app/pages/home_page.dart';
import 'package:doctor_app/pages/login_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../animations/bottomAnimation.dart';
import '../theme/colors.dart';
import '../widgets/textField.dart';

class SignUpScreen extends StatelessWidget {
  final DoctorSignUpController signUpController = Get.find();

  // const DoctorSignUpScreen({super.key});
  final bool? isDoctor;
  SignUpScreen({
    Key? key,
    this.isDoctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TextEditingController? emialController;
    // TextEditingController? passwordController;
    // TextEditingController? nameController;
    // TextEditingController? specialistController;
    // TextEditingController? phoneController;
    // TextEditingController? addressController;
    // TextEditingController? qualificationsController;
    // TextEditingController? ageController;
    // TextEditingController emialController;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: size.width,
                // height: size.height,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Opacity(
                        opacity: 0.30,
                        child: CircleAvatar(
                          radius: size.height * 0.1,
                          backgroundColor: Colors.black54,
                          child: Image(
                            image: AssetImage(isDoctor!
                                ? 'assets/bigDoc.png'
                                : 'assets/patient.png'),
                          ),
                        ),
                      ),
                    ),
                    // BackBtn(),
                    // ImageAvatar(
                    //   assetImage: 'assets/bigDoc.png',
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Center(
                                child: Text(
                              isDoctor! ? 'دكتور' : 'مريض',
                              style: titleText,
                            )),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              ' انشاء حساب',
                              style: titleText,
                              // "\t\tLogin",
                              // style: GoogleFonts.abel(
                              //     fontSize: height * 0.044,
                              //     fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            // nameTextField,
                            //phoneTextField,
                            // cnicTextField,
                            textField(
                                inputType: TextInputType.name,
                                controller: signUpController.nameController,
                                iconData: Icons.person,
                                lable: 'الاسم الرباعي',
                                onSumbmit: () {
                                  FocusScope.of(context).unfocus();
                                }),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            textField(
                                inputType: TextInputType.emailAddress,
                                controller: signUpController.emailController,
                                iconData: Icons.email_outlined,
                                lable: ' البريد الالكتروني',
                                onSumbmit: () {
                                  FocusScope.of(context).unfocus();
                                }),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            textField(
                                inputType: TextInputType.text,
                                controller: signUpController.passwordController,
                                iconData: Icons.password_outlined,
                                lable: ' كلمة المرور ',
                                onSumbmit: () {
                                  FocusScope.of(context).unfocus();
                                }),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            textField(
                                inputType: TextInputType.phone,
                                controller: signUpController.phoneController,
                                iconData: Icons.phone,
                                lable: 'رقم الهاتف',
                                onSumbmit: () {
                                  FocusScope.of(context).unfocus();
                                }),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            textField(
                                inputType: TextInputType.text,
                                controller: signUpController.genderController,
                                iconData: Icons.merge_type,
                                lable: 'الجنس',
                                onSumbmit: () {
                                  FocusScope.of(context).unfocus();
                                }),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Visibility(
                              visible: isDoctor! ? true : false,
                              child: Column(
                                children: [
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      fillColor: Colors.black.withOpacity(0.07),
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    hint: Center(
                                      child: Text(
                                        ' التخصص',
                                        style: subTitle,
                                      ),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: signUpController.categories
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Center(
                                                child:
                                                    Text(item, style: subTitle),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'الرجاء تحديد التخصص';
                                      }
                                    },
                                    onChanged: (value) {
                                      signUpController.specialController.text =
                                          value!;
                                      print('MMMMMMMMMMMMMMMMM');
                                      print(signUpController
                                          .specialController.text);
                                      print('MMMMMMMMMMMMMMMMM');
                                    },
                                    onSaved: (value) {
                                      // selectedValue = value.toString();
                                    },
                                  ),
                                  // textField(
                                  //     inputType: TextInputType.text,
                                  //     controller:
                                  //         signUpController.specialController,
                                  //     iconData: Icons.science_outlined,
                                  //     lable: 'التخصص',
                                  //     onSumbmit: () {
                                  //       FocusScope.of(context).unfocus();
                                  //     }),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  textField(
                                    inputType: TextInputType.text,
                                    controller: signUpController
                                        .qualificationController,
                                    iconData: Icons.star_border,
                                    lable: 'المؤهل',
                                    onSumbmit: () {
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  textField(
                                    inputType: TextInputType.text,
                                    controller:
                                        signUpController.licenceController,
                                    iconData: Icons.star_border,
                                    lable: 'الرخصة',
                                    onSumbmit: () {
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   height: size.height * 0.01,
                            // ),
                            Visibility(
                              child: textField(
                                inputType: TextInputType.number,
                                controller: signUpController.ageController,
                                iconData: Icons.text_rotation_angleup_sharp,
                                lable: 'العمر',
                              ),
                              visible: isDoctor! ? false : true,
                            ),
                            Obx(
                              () => SizedBox(
                                  width: size.width,
                                  height: size.height * 0.07,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: StadiumBorder(),
                                    ),
                                    onPressed: () {
                                      signUpController.SignUp(
                                          isDoctor! ? 'Doctor' : 'Pationt');
                                    },
                                    child: signUpController.isLoading.value
                                        ? CircularProgressIndicator()
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              WidgetAnimator(
                                                Image(
                                                  image: AssetImage(
                                                      'assets/google.png'),
                                                  height: size.height * 0.035,
                                                ),
                                              ),
                                              SizedBox(
                                                  width: size.height * 0.015),
                                              Text('انشئ الحساب',
                                                  style: subTitle.copyWith(
                                                      color: Colors.black)),
                                              //   style: TextStyle(
                                              //       letterSpacing: 2,
                                              //       fontWeight: FontWeight.bold,
                                              //       fontSize: height * 0.022),
                                              // )
                                            ],
                                          ),
                                  )),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            WidgetAnimator(
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    ' لديك حساب بالفعل!',
                                    textAlign: TextAlign.center,
                                    style: subTitle.copyWith(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () =>
                                          Get.off(() => LoginScreen()),
                                      child: Text(
                                        'قم بتسجيل الدخول',
                                        style: subTitle,
                                      ))
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   height: size.height * 0.2,
                            // )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
