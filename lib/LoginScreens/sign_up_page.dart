import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shohaara/LoginScreens/components/button_confirm.dart';
import 'package:shohaara/LoginScreens/components/rounded_username_field.dart';
import 'package:shohaara/LoginScreens/components/starField.dart';
import 'package:shohaara/main_page.dart';
import '../constants.dart';
import 'components/rounded_input_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("images/profile.png"),
                      ),
                      Spacer(),
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
                    ],
                  ),
                ),
                Column(
                  children: [
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
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: 300,
                      height: 40,
                      child: const Text(
                        textAlign: TextAlign.center,
                        "حساب جدید",
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
                        "لطفا فیلد های ستاره دار را پر کنید",
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
                    RoundedInputField(
                      hintText: "نام فامیلی",
                      iconData: FontAwesomeIcons.userCheck,
                      onChanged: (value) {},
                    ),
                    RoundedStarField(
                      hintText: "شماره مبایل",
                      iconData: FontAwesomeIcons.phone,
                      onChanged: (value) {},
                    ),
                    RoundedInputField(
                      hintText: "ایمیل آدرس",
                      iconData: FontAwesomeIcons.mailchimp,
                      onChanged: (value) {},
                    ),
                    RoundedUserNameField(
                        onChanged: (value) {},
                        hintText: "نام کاربری",
                        iconData: FontAwesomeIcons.userGear),
                    RoundedUserNameField(
                      hintText: "رمز عبور",
                      iconData: FontAwesomeIcons.lockOpen,
                      onChanged: (value) {},
                    ),
                    RoundedUserNameField(
                      hintText: "تآیید رمز عبور",
                      iconData: FontAwesomeIcons.lock,
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ButtonConfirm(),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: 300,
                      height: 50,
                      child: RichText(
                        text: TextSpan(
                          text: "حساب دارم میخواهم ",
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Vazir",
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: "وارد ",
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
                                        builder: (ctx) => MainPage(),
                                      ));
                                },
                            ),
                            TextSpan(
                              text: "شوم ",
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
