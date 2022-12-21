import 'package:flutter/material.dart';

import '../animations/bottomAnimation.dart';
import '../theme/colors.dart';

class textField extends StatelessWidget {
  final TextInputType? inputType;
  final TextEditingController? controller;
  final VoidCallback? onSumbmit;
  final String? lable;
  final IconData? iconData;
  // final Key? key;
  textField({
    this.inputType,
    this.controller,
    this.onSumbmit,
    this.lable,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        keyboardType: inputType,
        autofocus: false,
        // maxLength: 13,
        controller: controller,
        onSubmitted: (_) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
            filled: true,
            // errorText: validateCNIC(_controllerCNIC. text),
            fillColor: Colors.black.withOpacity(0.07),
            labelText: lable,
            labelStyle: subTitle,
            prefixIcon: WidgetAnimator(Icon(iconData)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
