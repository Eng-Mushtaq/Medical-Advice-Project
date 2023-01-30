// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/api/apis.dart';
import 'package:doctor_app/controller/doctorSignUpController.dart';
import 'package:doctor_app/model/doctor_model.dart';
import 'package:doctor_app/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../pages/login_page.dart';

// import 'package:phone_auth_firebase_last/views/hoem_screen.dart';
class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection("Doctors");
  // var doctorData;
  var isLoading = false.obs;
  var verId = '';
  var authStatus = ''.obs;
  RxBool isError = false.obs;
  final DoctorSignUpController Controller = Get.find();
  var auth = FirebaseAuth.instance;
  final box = GetStorage();
  void signIn(String email, String password) {
    isLoading.value = true;
    auth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then(
      (userCredential) async {
        var user = userCredential.user;
        print(user?.email);
        if (user != null) {
          // DocumentSnapshot doc = await _userCollectionRef.doc(user.uid).get();
          // doctorData = doc.data();
          // print('MMMMMMMMMMMMMMMMMMMMM');

          // print(doc.data());
          // print('MMMMMMMMMMMMMMMMMMMMM');

           Controller.getUserdata(user.uid);
          // APIs.getUserInfo(user.uid);
          box.write('userId', user.uid);
          Get.offAll(
            () => Home(),
          );
          isLoading.value = false;
          emailController.text = '';
          passwordController.text = '';
        }
      },
    ).catchError((onError) {
      isLoading.value = false;
      Get.snackbar(
        "otp info",
        'الايميل او كلمة المرور غير صحيح',
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }

  void logOut() {
    emailController.text = '';
    passwordController.text = '';

    auth.signOut();
    Get.offAll(LoginScreen());
  }
}
