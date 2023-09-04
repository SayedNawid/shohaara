import 'package:flutter/material.dart';

import '../constants.dart';

class EditTextField extends StatefulWidget {
  final String hintText;
  final IconData iconData;
  final String initialValue;
  final ValueChanged<String> onChanged;

  const EditTextField({
    Key? key,
    required this.hintText,
    required this.iconData,
    required this.onChanged,
    required this.initialValue,
  }) : super(key: key);

  @override
  _EditTextFieldState createState() => _EditTextFieldState();
}

class _EditTextFieldState extends State<EditTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: TextFormField(
        controller: _controller,
        showCursor: true,
        cursorColor: kPrimaryColor,
        cursorHeight: 25,
        style: TextStyle(
          color: kPrimaryColor,
          fontFamily: "Vazir",
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.right,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 20),
          suffixIcon: Icon(
            widget.iconData,
            size: 20,
            color: kPrimaryColor,
          ),
          prefixIcon: Icon(
            Icons.mode_edit,
            size: 14,
            color: kPrimaryColor,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(fontFamily: "Vazir", color: kSecondrayColor),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2,
              color: kPrimaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
