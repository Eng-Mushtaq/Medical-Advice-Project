import 'package:doctor_app/controller/SignUpController.dart';
import 'package:doctor_app/controller/loginController.dart';
import 'package:get/get.dart';

import '../controller/userTypeController.dart';
import '../services/doctorService.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
    Get.put(LoginController());
    Get.put(FirestoreUsers());
    Get.put(UserTypeController());
  }
}
