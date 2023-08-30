import 'package:flutter/material.dart';
import 'package:shohaara/MainCategory/ProfilePage.dart';

import '../LoginScreens/components/button_confirm.dart';
import '../constants.dart';
import 'edit_text_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (cnotext) => ProfilePage()));
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 35,
                  backgroundImage: AssetImage("images/profile.png"),
                ),
                Text(
                  "اطلاعات شخصی",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontFamily: "Vazir",
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "برای نمایش اطلاعات روی فیلد ها کلیک کنید",
                  style: TextStyle(
                      color: kSecondrayColor,
                      fontFamily: "Vazir",
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                edit_text_field(
                  hintText: "نام کاربری جدید",
                  iconData: (Icons.person),
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 13,
                ),
                edit_text_field(
                  hintText: "شماره مبایل جدید",
                  iconData: (Icons.phone_android_sharp),
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 13,
                ),
                edit_text_field(
                  hintText: "ایمیل جدید",
                  iconData: (Icons.email),
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 25,
                ),
                ButtonConfirm(
                  text: "ذخیره",
                  onPressed: () {},
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
