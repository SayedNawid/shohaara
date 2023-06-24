import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shohaara/LoginScreens/sign_up_page.dart';

import '../../constants.dart';

class RichTextContainer extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String thirdText;
  const RichTextContainer({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.thirdText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: 300,
      height: 50,
      child: RichText(
        text: TextSpan(
          text: firstText,
          style: const TextStyle(
              fontSize: 16,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w500,
              color: kPrimaryColor),
          children: <TextSpan>[
            TextSpan(
              text: secondText,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Vazir",
                  fontWeight: FontWeight.w500,
                  color: Colors.blueAccent),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => SignUpPage(),
                      ));
                },
            ),
            TextSpan(
              text: thirdText,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Vazir",
                  fontWeight: FontWeight.w500,
                  color: kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
