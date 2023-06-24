import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';
import 'TextFieldContainer.dart';

class RoundedStarField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final IconData iconData;
  const RoundedStarField({
    super.key,
    required this.onChanged,
    required this.hintText,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        showCursor: false,
        obscureText: false,
        keyboardType: TextInputType.number,
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
            prefixIcon: Icon(
              size: 20,
              FontAwesomeIcons.star,
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
