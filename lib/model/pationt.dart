class Pationt {
  String? userId,
      userType = 'Pationt',
      name,
      phoneNumber,
      email,
      password,
      gender,
      address,
      age;
  DateTime? joinedDate;
  DateTime? pirthDate;
  Pationt({
    this.userId,
    this.userType,
    this.name,
    this.phoneNumber,
    this.email,
    this.password,
    this.gender,
    this.address,
    this.age,
    this.joinedDate,
    this.pirthDate,
  });
  Pationt.fromJson(map) {
    if (map == null) {
      return;
    }
    userType = map['userType'];
    name = map['name'];
    phoneNumber = map['phoneNumber'];
    email = map['email'];
    password = map['password'];
    gender = map['gender'];
    address = map['address'];
    age = map['age'];

    joinedDate = map['joinedDate'].toDate();
    pirthDate = map['pirthDate'].toDate();
  }
  toJson() {
    return {
      'userId': userId,
      'userType': userType,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'gender': gender,
      'address': address,
      'age': age,
      'joinedDate': joinedDate,
      'pirthDate': pirthDate
    };
  }
}
