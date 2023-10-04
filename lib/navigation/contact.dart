import 'package:flutter/material.dart';

import '../constants.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Column(
            children: [
              Text(
                "برای ارتیاط با ما",
                style: TextStyle(
                  shadows: [
                    Shadow(
                      color: kPrimaryColor.withOpacity(0.4),
                      blurRadius: 18.0,
                      offset: const Offset(5.0, 7.0),
                    ),
                  ],
                  fontSize: 28,
                  fontFamily: "A.Ali_banner3az.ir",
                  fontWeight: FontWeight.w500,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("images/Logo.png"),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "FLUTTER DEVELOPER",
                style: TextStyle(
                  fontFamily: "Source Sans Pro",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(
                height: 20,
                width: 300,
                child: Divider(
                  color: Colors.blueGrey.shade900,
                ),
              ),
              Card(
                  shadowColor: kPrimaryColor,
                  elevation: 5,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.white)),
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    // leading: Icon(
                    //   Icons.phone,
                    //   size: 30,
                    //   color: Colors.blueGrey,
                    // ),
                    title: Center(
                      child: Text(
                        "Sayed Nawid Mohammady",
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  )),
              Card(
                  shadowColor: kPrimaryColor,
                  elevation: 5,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.white)),
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      size: 30,
                      color: kPrimaryColor,
                    ),
                    title: Text(
                      "+(93) 792 881 775",
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20,
                        color: kPrimaryColor,
                      ),
                    ),
                  )),
              Card(
                  shadowColor: kPrimaryColor,
                  elevation: 5,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.white)),
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: kPrimaryColor,
                      size: 30,
                    ),
                    title: Text(
                      "sayednawidmohammady@gmail.com",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          color: kPrimaryColor,
                          fontSize: 12),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
