import 'package:flutter/material.dart';
import 'package:shohaara/MainCategory/ProfilePage.dart';

import '../constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 40,
              ),
              Text(
                "شعراء",
                style: TextStyle(
                    shadows: [
                      Shadow(
                        color: kPrimaryColor.withOpacity(0.4),
                        blurRadius: 18.0,
                        offset: const Offset(5.0, 7.0),
                      ),
                    ],
                    fontSize: 40,
                    fontFamily: "A.Ali_banner3az.ir",
                    fontWeight: FontWeight.w500,
                    color: kPrimaryColor),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  style: IconButton.styleFrom(
                      minimumSize: const Size(35, 55),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (cnotext) => ProfilePage()));
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
