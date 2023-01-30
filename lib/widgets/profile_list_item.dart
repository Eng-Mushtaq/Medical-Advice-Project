import 'package:doctor_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class ProfileListItem extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final bool hasNavigation;
  VoidCallback? press;

   ProfileListItem({
    Key? key,
    this.icon,
    this.text,
    this.hasNavigation = true,
    this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 55,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ).copyWith(
          bottom: 20,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey.shade300,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 25,
            ),
            const SizedBox(width: 15),
            Text(
              text!,
             style: titleText,
              // style: kTitleTextStyle.copyWith(
              //     fontWeight: FontWeight.w500, fontFamily: "Poppins"),
            ),
            const Spacer(),
            if (hasNavigation)
              const Icon(
                LineAwesomeIcons.angle_left,
                size: 25,
              ),
          ],
        ),
      ),
    );
  }
}
