import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shohaara/LoginScreens/LoginPage.dart';

import '../constants.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(50, 35),
                        backgroundColor: Colors.white,
                        elevation: 5,
                        shadowColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.arrowRight,
                        color: kSecondrayColor,
                      ),
                      label: Text("")),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  height: 70,
                  child: Text(
                    "شعراء",
                    style: TextStyle(
                        shadows: [
                          Shadow(
                            color: kPrimaryColor.withOpacity(0.4),
                            blurRadius: 18.0,
                            offset: Offset(5.0, 7.0),
                          ),
                        ],
                        fontSize: 50,
                        fontFamily: "A.Ali_banner3az.ir",
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor),
                  ),
                ),
                Container(
                  child: Image.asset(
                    "images/Mobile-login-cuate.png",
                    height: 300,
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: 300,
                  height: 40,
                  child: const Text(
                    textAlign: TextAlign.center,
                    "خوش آمدی",
                    style: const TextStyle(
                        fontSize: 26,
                        fontFamily: "Vazir",
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: 300,
                  height: 30,
                  child: const Text(
                    textAlign: TextAlign.center,
                    "نام کاربری و رمز عبور تان را وارد کنید",
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Vazir",
                        fontWeight: FontWeight.w400,
                        color: kSecondrayColor),
                  ),
                ),
                RoundedInputField(
                  hintText: "نام کاربری",
                  iconData: FontAwesomeIcons.user,
                  onChanged: (value) {},
                ),
                TextFieldContainer(
                  child: TextField(
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
                        hintStyle: TextStyle(
                            fontFamily: "Vazir", color: kPrimaryColor),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              width: 2,
                              color: kPrimaryColor,
                            ))),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "تآیید",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Vazir",
                          fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      backgroundColor: kPrimaryColor,
                      minimumSize: const Size(315, 60),
                      elevation: 10,
                      shadowColor: kPrimaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: 300,
                  height: 50,
                  child: RichText(
                    text: TextSpan(
                      text: "میخواهم یک حساب کاربری جدید",
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "Vazir",
                          fontWeight: FontWeight.w500,
                          color: kPrimaryColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: " ایجاد ",
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
                                    builder: (ctx) => LoginPage(),
                                  ));
                            },
                        ),
                        TextSpan(
                          text: "کنم ",
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Vazir",
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
