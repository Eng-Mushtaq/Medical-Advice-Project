import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/pages/doctor_profile_page.dart';
import 'package:doctor_app/pages/view_profile_screen.dart';
import 'package:doctor_app/theme/colors.dart';
import 'package:doctor_app/widgets/avatar_image.dart';
import 'package:doctor_app/widgets/doctor_box.dart';
import 'package:doctor_app/widgets/textbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../model/doctor_model.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  var currentUser = FirebaseAuth.instance.currentUser?.uid;
  List<Doctor> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "الأطباء",
          style: titleText.copyWith(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        //  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Icon(
              Icons.info,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: getBody(),
    );
  }

  getBody() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Doctors')
            .where('userId', isNotEqualTo: currentUser)
            .snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              final data = snapshot.data!.docs;
              list = data.map((e) => Doctor.fromJson(e.data())).toList();
          }
          if (list.isNotEmpty) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: CustomTextBox()),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.filter_list_rounded,
                          color: primary,
                          size: 35,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(
                              list.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Badge(
                                        badgeColor: Colors.green,
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        position: BadgePosition.topEnd(
                                            top: -3, end: 0),
                                        badgeContent: Text(''),
                                        child: AvatarImage(list[index].image
                                              
                                            .toString())),
                                  ))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    getDoctorList()
                  ],
                ),
              ),
            );
          } else
            return Center(
              child: Text('لا يوجد بيانات حاليا'),
            );
        });
  }

  getDoctorList() {
    if (list.isNotEmpty) {
      return StaggeredGridView.countBuilder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) => DoctorBox(
            onTap: () {
              list[index].userType == 'Doctor'
                  ? Get.to(
                      DoctorProfilePage(
                        doctor: list[index],
                      ),
                    )
                  : Get.to(() => ViewProfileScreen(
                        user: list[index],
                      ));
            },
            index: index,
            doctor: list[index]),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 3 : 2),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      );
    } else {
      return Center(
        child: Text('no data foud'),
      );
    }
  }
}
