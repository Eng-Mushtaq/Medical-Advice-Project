import 'package:doctor_app/model/doctor_model.dart';
import 'package:doctor_app/pages/doctor_profile_page.dart';
import 'package:doctor_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'avatar_image.dart';

class PopularDoctor extends StatelessWidget {
  PopularDoctor({Key? key, required this.doctor}) : super(key: key);
  Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => DoctorProfilePage(doctor: doctor)),
      child: Container(
          margin: EdgeInsets.only(right: 15),
          padding: EdgeInsets.all(15),
          width: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              AvatarImage(doctor.image!),
              SizedBox(
                width: 7,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor.name!,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: subTitle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )
                      //  TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(doctor.qualification!,
                      style: subTitle.copyWith(fontSize: 12, color: Colors.grey)
                      //  TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 14,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        " تقييم",
                        style: subTitle.copyWith(fontSize: 12),
                        // style: TextStyle(fontSize: 12),
                      )
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
