import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants.dart';
import 'TextFieldContainer.dart';

class RoundedInputPassword extends StatelessWidget {
   final ValueChanged<String> onChanged;
  
  final String hintText;
  const RoundedInputPassword(
      {super.key,
       required this.onChanged,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
         onChanged: onChanged,
        showCursor: true,
        cursorColor: kPrimaryColor,
        cursorHeight: 25,
        obscureText: true,
        style: TextStyle(
            color: kPrimaryColor,
            fontFamily: "Vazir",
            fontSize: 18,
            fontWeight: FontWeight.w400),
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 20),
          suffixIcon: Icon(
            size: 20,
            FontAwesomeIcons.lock,
            color: kPrimaryColor,
          ),
          prefixIcon: Icon(
            size: 15,
            FontAwesomeIcons.eyeLowVision,
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
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                width: 2,
                color: kPrimaryColor,
              )),
        ),
      ),
    );
  }
}
