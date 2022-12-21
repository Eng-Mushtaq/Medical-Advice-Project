
class Doctor {
  String? userId,
      userType = 'Doctor',
      name,
      phoneNumber,
      email,
      password,
      special,
      address,
      qualifiactions;
  DateTime? joinedDate;
  // MosqueModel? mosqueModel;
  Doctor({
    this.userId,
    this.userType,
    this.name,
    this.phoneNumber,
    this.email,
    this.password,
    this.special,
    this.address,
    this.qualifiactions,
    this.joinedDate,
  });

  Doctor.fromJson( map) {
// ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }

    userType = map['userType'];
    name = map['name'];
    phoneNumber = map['phoneNumber'];
    email = map['email'];
    password = map['password'];
    special = map['special'];
    address = map['address'];
    qualifiactions = map['qualifiactions'];
    joinedDate = map['joinedDate'].toDate();
    // mosqueModel = MosqueModel.fromJson(map['mosqueModel']);
  }
  toJson() {
    return {
      'userId': userId,
      'userType': userType,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'special': special,
      'address': address,
      'qualifiactions': qualifiactions,
      'joinedDate':joinedDate
      // 'mosqueModel': mosqueModel,
    };
  }
}
