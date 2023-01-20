import 'package:get/get.dart';

class UserTypeController extends GetxController {
  int? selectedUser;

  void userToggile(int? usertype) {
    selectedUser = usertype;
    print(' user Type is ${selectedUser}');
  }
}
