class Doctor {
  String? userId,
      userType = 'Doctor',
      name,
      phoneNumber,
      email,
      password,
      special,
      address,
      licence,
      qualification,
      image;
  String? createdAt;
  late String? pushToken;
  late String? lastActive;
  late bool? isOnline;
  late String? about;
  // MosqueModel? mosqueModel;
  Doctor(
      {this.userId,
      this.userType,
      this.name,
      this.phoneNumber,
      this.email,
      this.password,
      this.special,
      this.address,
      this.licence,
      this.createdAt,
      this.image,
      this.qualification,
      this.pushToken,
      this.about,
      this.isOnline,
      this.lastActive});

  Doctor.fromJson(map) {
// ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }
    userId = map['userId'];
    userType = map['userType'];
    name = map['name'];
    phoneNumber = map['phoneNumber'];
    email = map['email'];
    password = map['password'];
    special = map['special'];
    address = map['address'];
    licence = map['licence'];
    qualification = map['qualification'];
    image = map['image'];
    createdAt = map['createdAt'];
    about = map['about'];
    pushToken = map['pushToken'];
    lastActive = map['lastActive'];
    isOnline = map['isOnline'];
 
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
      'licence': licence,
      'image': image,
      'qualification': qualification,
      'createdAt': createdAt,
      'pushToken': pushToken,
      'lastActive': lastActive,
      'isOnline': isOnline
      // 'mosqueModel': mosqueModel,
    };
  }
}
