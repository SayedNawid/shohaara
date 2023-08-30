import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shohaara/LoginScreens/sign_in_page.dart';
import 'package:shohaara/LoginScreens/sign_up_page.dart';
import 'package:shohaara/main_page.dart';
import '../constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              Container(
                child: Image.asset(
                  "images/Mobile-login-amico.png",
                  height: 300,
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                width: 300,
                height: 30,
                child: const Text(
                  textAlign: TextAlign.center,
                  "میخواهم یک حساب کاربری جدید درست کنم",
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Vazir",
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: Text(
                    "حساب جدید",
                    style: const TextStyle(
                        color: Colors.white, fontFamily: "Vazir", fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    backgroundColor: kPrimaryColor,
                    minimumSize: const Size(315, 50),
                    elevation: 10,
                    shadowColor: kPrimaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                alignment: Alignment.topCenter,
                width: 300,
                height: 30,
                child: const Text(
                  textAlign: TextAlign.center,
                  "من حساب کاربری دارم",
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Vazir",
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => SignInPage())));
                  },
                  child: Text(
                    "وارد شدن",
                    style: const TextStyle(
                        color: kPrimaryColor,
                        fontFamily: "Vazir",
                        fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    backgroundColor: Colors.white,
                    minimumSize: const Size(315, 50),
                    elevation: 0,
                    side: BorderSide(
                      color: kPrimaryColor,
                    ),
                    shadowColor: kPrimaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                width: 300,
                height: 50,
                child: RichText(
                  text: TextSpan(
                    text: "میخواهم بدون حساب کاربری ",
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
                        text: "شوم",
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
    );
  }
}
