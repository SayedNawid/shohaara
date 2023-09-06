import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants.dart';
import 'TextFieldContainer.dart';

class RoundedUserNameField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final IconData iconData;
  //final FormFieldValidator<String>? validator ;
  const RoundedUserNameField({
    super.key,
    required this.onChanged,
    required this.hintText,
    required this.iconData, //required this.validator,
  });
  
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        //validator:validator ,
        onChanged: onChanged,
        showCursor: true,
        cursorColor: kPrimaryColor,
        cursorHeight: 25,
        obscureText: false,
        keyboardType: TextInputType.text,
        style: const TextStyle(
            color: kPrimaryColor,
            fontFamily: "Vazir",
            fontSize: 18,
            fontWeight: FontWeight.w400),
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 20),
            suffixIcon: Icon(
              size: 20,
              iconData,
              color: kPrimaryColor,
            ),
            prefixIcon: const Icon(
              size: 15,
              FontAwesomeIcons.star,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(fontFamily: "Vazir", color: kPrimaryColor),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  width: 2,
                  color: kPrimaryColor,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  width: 2,
                  color: kPrimaryColor,
                ))),
      ),
    );
  }
}
