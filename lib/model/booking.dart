class Booking {
  String? doctorId,
      pationtId,
      date,
      day,
      time,
      status,
      doctor_name,
      doctor_profile;

  String? createdAt;

  Booking({
    this.doctorId,
    this.doctor_name,
    this.doctor_profile,
    this.pationtId,
    this.date,
    this.day,
    this.time,
    this.status,
    this.createdAt,
  });

  Booking.fromJson(map) {
// ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }
    doctorId = map['doctorId'];
    doctor_name = map['doctor_name'];
    doctor_profile = map['doctor_profile'];
    pationtId = map['pationtId'];
    date = map['date'];
    day = map['day'];
    time = map['time'];
    status = map['status'];
    createdAt = map['createdAt'].toString();

    // mosqueModel = MosqueModel.fromJson(map['mosqueModel']);
  }
  toJson() {
    return {
      'doctorId': doctorId,
      'doctor_profile': doctor_profile,
      'doctor_name': doctor_name,
      'pationtId': pationtId,
      'date': date,
      'day': day,
      'time': time,
      'status': status,
      'createdAt': DateTime.now(),

      // 'mosqueModel': mosqueModel,
    };
  }
}
