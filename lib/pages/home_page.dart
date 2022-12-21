import 'package:badges/badges.dart';
import 'package:doctor_app/data/json.dart';
import 'package:doctor_app/theme/colors.dart';
import 'package:doctor_app/widgets/category_box.dart';
import 'package:doctor_app/widgets/popular_doctor.dart';
import 'package:doctor_app/widgets/textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Badge(
              position: BadgePosition.topEnd(top: 7, end: -4),
              badgeContent: Text(
                '1',
                style: TextStyle(color: Colors.white),
              ),
              child: Icon(
                Icons.notifications_sharp,
                color: primary,
              ),
            ),
          )
        ],
      ),
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: Text("مرحبا ,",
                style: subTitle.copyWith(
                    fontSize: 23, color: primary, fontWeight: FontWeight.w500)
                //  TextStyle(
                //     fontSize: 23, color: primary, fontWeight: FontWeight.w500),
                ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
              child: Text(
                  // "Let's Find Your Doctor",
                  'دعنا نبحث لك عن طبيب',
                  style: subTitle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w600)
                  //  TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )),
          SizedBox(
            height: 15,
          ),
          CustomTextBox(),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Text(
              "الأقسام",
              style: titleText,
              // style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 5),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryBox(
                  title: "القلب",
                  icon: Icons.favorite,
                  color: Colors.red,
                ),
                CategoryBox(
                  title: "الطوارئ",
                  icon: Icons.local_hospital,
                  color: Colors.blue,
                ),
                CategoryBox(
                  title: "طب أسنان",
                  icon: Icons.details_rounded,
                  color: Colors.purple,
                ),
                CategoryBox(
                  title: "جراحة عامة",
                  icon: Icons.healing_outlined,
                  color: Colors.green,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://media.istockphoto.com/vectors/electronic-health-record-concept-vector-id1299616187?k=20&m=1299616187&s=612x612&w=0&h=gmUf6TXc8w6NynKB_4p2TzL5PVIztg9UK6TOoY5ckMM="),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
              child: Text("أشهر الأطباء", style: titleText
                  // TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )),
          SizedBox(height: 10),
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 5),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PopularDoctor(
                  doctor: doctors[0],
                ),
                PopularDoctor(
                  doctor: doctors[1],
                ),
                PopularDoctor(
                  doctor: doctors[2],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
