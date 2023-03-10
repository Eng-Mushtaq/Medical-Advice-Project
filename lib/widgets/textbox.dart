import 'package:doctor_app/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(50)),
      child: TextField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
            hintText: "البحث",
            hintStyle: subTitle.copyWith(color: Colors.grey, fontSize: 17)
            // TextStyle(color: Colors.grey, fontSize: 17),
            ),
      ),
    );
  }
}
