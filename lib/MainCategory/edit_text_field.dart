import 'package:flutter/material.dart';

import '../constants.dart';

class edit_text_field extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> onChanged;
  final String value;
  const edit_text_field({
    super.key,
    required this.hintText,
    required this.iconData,
    required this.onChanged,
    required this.value,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: TextFormField(
        initialValue: value,
        showCursor: true,
        cursorColor: kPrimaryColor,
        cursorHeight: 25,
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
            iconData,
            color: kPrimaryColor,
          ),
          prefixIcon: Icon(
            Icons.mode_edit,
            size: 14,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          hintStyle: TextStyle(fontFamily: "Vazir", color: kSecondrayColor),
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
