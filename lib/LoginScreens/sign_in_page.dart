import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shohaara/LoginScreens/sign_up_page.dart';
import 'package:shohaara/main_page.dart';

import '../constants.dart';
import '../main_page.dart';
import '../services/api_service.dart';
import 'components/button_confirm.dart';
import 'components/rounded_input_field.dart';
import 'components/rounded_pasword_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  String email = '';
  String password = '';
  Future<void> signIn() async {
    ApiService.login(
      email: email,
      password: password,
      whenComplete: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      },
      onError: (error) {
        print(error);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Form(
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
                  height: 30,
                  child: const Text(
                    textAlign: TextAlign.center,
                    "ایمیل آدرس و رمز عبور تان را وارد کنید",
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Vazir",
                        fontWeight: FontWeight.w400,
                        color: kSecondrayColor),
                  ),
                ),
                 RoundedInputField(
                  hintText: "ایمیل",
                  iconData: FontAwesomeIcons.user,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                RoundedInputPassword(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  hintText: "رمز عبور",
                ),
                SizedBox(
                  height: 15,
                ),
                ButtonConfirm(
                  text: "تآیید",
                  onPressed: () {
                    signIn();
                  },
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
                                      builder: (ctx) => SignUpPage(),
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
                        ]
                      ),
                    ),
                  ),   
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
