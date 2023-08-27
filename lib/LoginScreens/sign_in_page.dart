import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shohaara/FireBase/AuthServices.dart';
import 'package:shohaara/LoginScreens/sign_up_page.dart';
import 'package:shohaara/main_page.dart';

import '../constants.dart';
import 'components/button_confirm.dart';
import 'components/rich_text_class.dart';
import 'components/rounded_input_field.dart';
import 'components/rounded_pasword_field.dart';
import 'package:shohaara/FireBase/Users.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
<<<<<<< HEAD
  final AuthService _authService = AuthService();

  String email = '';
  String password = '';
  Future<void> signIn() async {
    _authService.signInWithEmailAndPassword(
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

=======
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
>>>>>>> 81a7b5ebece7ce25699b86327127f2ba36b4deb4
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Form(
              key: _formKey,
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
<<<<<<< HEAD
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
=======
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
>>>>>>> 81a7b5ebece7ce25699b86327127f2ba36b4deb4
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "Vazir",
                          fontWeight: FontWeight.w400,
                          color: kSecondrayColor),
                    ),
                  ),
                  RoundedInputField(
                   
                    hintText: "نام کاربری",
                    iconData: Icons.person,
                    onChanged: (value){},
                  ),
                  RoundedInputPassword(
                    onChanged: (value){},
                    hintText: "رمز عبور",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ButtonConfirm(
                    onPressed: (){},
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
