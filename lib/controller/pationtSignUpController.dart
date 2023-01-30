import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/doctor_model.dart';
import '../pages/home.dart';
import '../services/doctorService.dart';
import '../theme/colors.dart';



class PaiontSignUpController extends GetxController {
  var auth = FirebaseAuth.instance;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var specialController = TextEditingController();
  var addressController = TextEditingController();
  var licenceController = TextEditingController();
  var qualificationController = TextEditingController();
  var imageController = TextEditingController();
  var ageController = TextEditingController();
  var genderController = TextEditingController();
  RxBool isLoading = false.obs;

  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection("Pationts");
  Doctor? doctorData;
  final box = GetStorage();


@override
  void onInit() {
  if (box.read('userId')!=null) {
      getUserdata(box.read('userId'));
    }
    super.onInit();
  }

  
  void SignUp(
      // {required String? email, required String? password}
      ) async {
    try {
      isLoading.value = true;
      await auth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then(
        (value) {
          addUserToFirestore(value.user?.uid);
        },
      );
      Get.offAll(const Home());
    } on FirebaseAuthException catch (error) {
      isLoading.value = true;
      String? title = error.code;
      String? message;
      if (error.code == 'week-password') {
        message = 'كلمة المرور ضعيفة ';
      } else if (error.code == 'email-already-in-use') {
        message = 'هذا الايميل مستخدم بالفعل ';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: primary,
        colorText: appBgColor,
      );
    } catch (error) {
      Get.snackbar('حدث خطأ', error.toString());
    }
  }

  void addUserToFirestore(String? userId) async {
    await FirestoreUsers()
        .addUserToFirestore(Doctor(
            userId: userId,
            email: emailController.text,
            name: nameController.text,
            password: passwordController.text,
            userType: 'doctor',
            phoneNumber: phoneController.text,
            special: specialController.text,
            address: addressController.text,
            licence: licenceController.text,
            image:imageController.text,
            qualification:qualificationController.text,
            // createdAt: DateTime.now(),
            ))
        .then((value) {
      getUserdata(userId!);
      box.write('userId', userId);
      emailController.text = '';
      nameController.text = '';
      passwordController.text = '';
      phoneController.text = '';
      specialController.text = '';
      addressController.text = '';
      licenceController.text = '';
     qualificationController.text = '';
      imageController.text = '';
    });
    //     .then((value) {
    //   getUserdata();
    // });
  }

  Future<Doctor?> getUserdata(String uId) async {
    try {
      DocumentSnapshot doc = await _userCollectionRef.doc(uId).get();
      doctorData = Doctor.fromJson(doc);
      isLoading.value = false;
      return doctorData;
    } catch (e) {
      printError(info: e.toString());
    }
    return null;
  }

  String? emailValidator(String value) {
    String? pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return "لا يجب ان يكون الايميل فارغا";
    } else if (!regex.hasMatch(value) ||
        !value.contains(
          '@gmail.com',
        )) {
      return 'صيغة الايميل غير صحيحة';
    } else {
      return null;
    }
  }

  String? validateMobile(String? value) {
    // Indian Mobile number are of 10 digit only
    if (value!.isEmpty || value.length != 9) {
      return 'يجب ان يحتوي رقم الهاتف على 9 أرقام';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    // Indian Mobile number are of 10 digit only
    if (value!.isEmpty || value.length < 6) {
      return ' يجب ان يكون طول كلمة المرور أكبر من 6 ';
    } else {
      return null;
    }
  }
}
