import 'package:flutter/material.dart';
import 'package:shohaara/LoginScreens/sign_in_page.dart';

import '../../constants.dart';
import 'TextFieldContainer.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    super.key,
    required this.hintText,
    required this.iconData,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        showCursor: false,
        onChanged: onChanged,
        style: TextStyle(
            color: kSecondrayColor,
            fontFamily: "Vazir",
            fontSize: 18,
            fontWeight: FontWeight.w400),
        textAlign: TextAlign.right,
        decoration: InputDecoration(
            suffixIcon: Icon(
              size: 20,
              iconData,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            hintStyle: TextStyle(fontFamily: "Vazir", color: kPrimaryColor),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  width: 2,
                  color: kPrimaryColor,
                ))),
      ),
    );
  }
}