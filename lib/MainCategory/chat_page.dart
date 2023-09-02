import 'package:flutter/material.dart';
import 'package:shohaara/constants.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 260),
        child: Center(
          child: Text(
            "...بزودی",
            style: TextStyle(
                fontFamily: "Vazir",
                fontSize: 20,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
