import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/doctor_model.dart';

class FirestoreUsers extends GetxController {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection("Doctors");

  Future<void> addUserToFirestore(Doctor doctor) async {
    return await _userCollectionRef
        .doc(doctor.userId)
        .set(doctor.toJson())
        .then((value) {})
        .catchError((onError) {});
  }


}
