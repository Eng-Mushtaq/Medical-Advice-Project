import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/api/apis.dart';
import 'package:doctor_app/model/booking.dart';
import 'package:doctor_app/theme/colors.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentsPageState extends State<AppointmentsPage> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;
  List<Booking> schedules = [];
  List<Booking> filterSchduels = [];
  //   {
  //     'doctor_name': 'Ali Ahmed',
  //     'doctor_profile': 'assets/user.png',
  //     'category': 'Heart',
  //     'status': FilterStatus.upcoming
  //   },
  //   {
  //     'doctor_name': 'Fahd Al-Otaibi',
  //     'doctor_profile': 'assets/user.png',
  //     'category': 'Headic',
  //     'status': FilterStatus.complete
  //   },
  //   {
  //     'doctor_name': 'Nawaf Majed',
  //     'doctor_profile': 'assets/user.png',
  //     'category': 'General',
  //     'status': FilterStatus.cancel
  //   },
  //   {
  //     'doctor_name': 'Ali Ahmed',
  //     'doctor_profile': 'assets/user.png',
  //     'category': 'Heart',
  //     'status': FilterStatus.upcoming
  //   },
  //   {
  //     'doctor_name': 'Fahd Al-Otaibi',
  //     'doctor_profile': 'assets/user.png',
  //     'category': 'Headic',
  //     'status': FilterStatus.complete
  //   },
  //   {
  //     'doctor_name': 'Nawaf Majed',
  //     'doctor_profile': 'assets/user.png',
  //     'category': 'General',
  //     'status': FilterStatus.cancel
  //   },
  //   {
  //     'doctor_name': 'Ali Ahmed',
  //     'doctor_profile': 'assets/user.png',
  //     'category': 'Heart',
  //     'status': FilterStatus.upcoming
  //   },
  //   {
  //     'doctor_name': 'Fahd Al-Otaibi',
  //     'doctor_profile': 'assets/user.png',
  //     'category': 'Headic',
  //     'status': FilterStatus.upcoming
  //   },
  //   {
  //     'doctor_name': 'Nawaf Majed',
  //     'doctor_profile': 'assets/user.png',
  //     'category': 'General',
  //     'status': FilterStatus.cancel
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
    // List<dynamic> filterSchduels = schedules.where((schedule) {
    // switch (schedule['status']) {
    //   case 'upcoming':
    //     schedule['status'] = FilterStatus.upcoming;
    //     break;
    //   case 'complete':
    //     schedule['status'] = FilterStatus.complete;
    //     break;
    //   case 'cancel':
    //     schedule['status'] = FilterStatus.cancel;
    //     break;
    // }
    //   return schedule['status'] == status;
    // }).toList();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  APIs.getAppointments(FirebaseAuth.instance.currentUser!.uid),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    final data = snapshot.data!.docs;
                    schedules =
                        data.map((e) => Booking.fromJson(e.data())).toList();
                    filterSchduels = schedules.where((schedule) {
                      print(schedule.status);
                      return schedule.status == 'cancel' ||
                          schedule.status == 'upcoming' ||
                          schedule.status == 'complete';
                    }).toList();
                }
                if (schedules.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'جدول الحجوزات',
                        style: titleText,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (FilterStatus filterStatus
                                    in FilterStatus.values)
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (filterStatus ==
                                              FilterStatus.upcoming) {
                                            status = FilterStatus.upcoming;
                                            _alignment = Alignment.centerRight;
                                          } else if (filterStatus ==
                                              FilterStatus.complete) {
                                            status = FilterStatus.complete;
                                            _alignment = Alignment.center;
                                          } else if (filterStatus ==
                                              FilterStatus.cancel) {
                                            status = FilterStatus.cancel;
                                            _alignment = Alignment.centerLeft;
                                          }
                                        });
                                      },
                                      child: Center(
                                        child: Text(
                                          filterStatus.name,
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AnimatedAlign(
                            alignment: _alignment,
                            duration: Duration(milliseconds: 200),
                            child: Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  status.name,
                                  style: subTitle.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 15,
                          ),
                          itemCount: filterSchduels.length,
                          itemBuilder: (context, index) {
                            var _scheduel = filterSchduels[index];
                            bool _isLastElement =
                                filterSchduels.length + 1 == index;
                            return Card(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: _isLastElement
                                  ? const EdgeInsets.only(bottom: 20)
                                  : EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            // _scheduel['doctor_profile'],
                                            _scheduel.doctor_profile!,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              // _scheduel['doctor_name'],
                                              _scheduel.doctor_name!,
                                              style: subTitle,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              // _scheduel['category'],
                                              _scheduel.time!,
                                              style: subTitle.copyWith(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    ScheduelCard(sheduel: _scheduel),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: Text('لا يوجد لديك حجوزات !'),
                  );
                }
              }),
        ),
      ),
    );
  }
}

class ScheduelCard extends StatelessWidget {
  ScheduelCard({super.key, this.sheduel});
  Booking? sheduel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.calendar_today,
            color: primary,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            // 'Monday 7/02/2023',
            sheduel!.day! + '   ' + sheduel!.date!,
            style: TextStyle(
              color: primary,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: primary,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            // '2:00 PM',
            sheduel!.time!,
            style: TextStyle(
              color: primary,
            ),
          ))
        ],
      ),
    );
  }
}
