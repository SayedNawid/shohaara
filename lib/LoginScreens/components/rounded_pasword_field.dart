import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shohaara/LoginScreens/sign_in_page.dart';
import '../../constants.dart';
import 'TextFieldContainer.dart';

class RoundedInputPassword extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedInputPassword({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        showCursor: false,
        obscureText: true,
        style: TextStyle(
            color: kSecondrayColor,
            fontFamily: "Vazir",
            fontSize: 18,
            fontWeight: FontWeight.w400),
        textAlign: TextAlign.right,
        decoration: InputDecoration(
            suffixIcon: Icon(
              size: 20,
              FontAwesomeIcons.lock,
              color: kPrimaryColor,
            ),
            prefixIcon: Icon(
              size: 20,
              FontAwesomeIcons.eyeLowVision,
              color: kPrimaryColor,
            ),
            hintText: "رمز عبور",
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