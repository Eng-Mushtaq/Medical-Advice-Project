import 'package:doctor_app/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/chat_screen.dart';

class ContactBox extends StatelessWidget {
  ContactBox(
      {Key? key, required this.icon, required this.color, required this.onTap})
      : super(key: key);
  IconData icon;
  Color color;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 45,
        decoration: BoxDecoration(
            color: color.withAlpha(30),
            borderRadius: BorderRadius.circular(30)),
        child: Icon(
          icon,
          color: color,
          size: 25,
        ),
      ),
    );
  }
}
