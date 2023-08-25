import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shohaara/main_page.dart';

import '../constants.dart';
import '../navigation/sideMenu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 65,
            child: Card(
              shadowColor: kPrimaryColor,
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  "حساب کابری",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontFamily: "Vazir",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                      minimumSize: const Size(35, 55),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  icon: Icon(
                    FontAwesomeIcons.userEdit,
                    color: kPrimaryColor,
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "محمد احسان یارخیل ",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Vazir",
                          color: kPrimaryColor),
                    ),
                    Text(
                      "+93 795 461 668",
                      style: TextStyle(fontSize: 12, color: kPrimaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  width: 8,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("images/profile.png"),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: 340,
            color: kPrimaryColor,
          ),
          SizedBox(
            height: 10,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.bookmark_outlined,
                      color: kPrimaryColor,
                    ),
                    title: Text(
                      "ذخیره شده ها",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Vazir",
                          color: kPrimaryColor),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.info_rounded,
                      color: kPrimaryColor,
                    ),
                    title: Text(
                      "درباره شعراء",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Vazir",
                          color: kPrimaryColor),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.rule,
                      color: kPrimaryColor,
                    ),
                    title: Text(
                      "قوانین و شرایط",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Vazir",
                          color: kPrimaryColor),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: kPrimaryColor,
                    ),
                    title: Text(
                      "تنظیمات",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Vazir",
                          color: kPrimaryColor),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: ((context) => SignInPage())));
              },
              child: Text(
                "خروج از حساب کاربری",
                style: const TextStyle(
                    color: kPrimaryColor, fontFamily: "Vazir", fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(left: 10, right: 10),
                backgroundColor: Colors.white,
                minimumSize: const Size(350, 50),
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
          Container(
            height: 180,
            child: Image.asset("images/Resumefolderbro.png"),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
