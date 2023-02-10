import 'package:doctor_app/theme/colors.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  CategoryBox({Key? key, required this.title, required this.icon, this.color,this.onTap})
      : super(key: key);
  IconData icon;
  Color? color;
  String title;
  var onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        
          margin: EdgeInsets.only(right: 15),
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
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
          child: Column(
            children: [
              Icon(
                icon,
                size: 40,
                color: color,
              ),
              SizedBox(height: 10),
              Text(title,
                  style: subTitle.copyWith(
                    color: color,
                  )),
              //  TextStyle(color: color),)
            ],
          )),
    );
  }
}
