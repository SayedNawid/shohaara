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
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
        margin: EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.purple[900],
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.purple,
              hoverColor: Colors.purple.shade900,
              gap: 8,
              activeColor: Colors.purple[900],
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.settings,
                  iconColor: Colors.white,
                  text: 'تنظیمات',
                ),
                GButton(
                  icon: Icons.chat,
                  iconColor: Colors.white,
                  text: 'شعرجنگی',
                ),
                GButton(
                  icon: LineIcons.home,
                  iconColor: Colors.white,
                  text: 'خانه',
                ),
                GButton(
                  icon: Icons.supervised_user_circle_sharp,
                  iconColor: Colors.white,
                  text: 'شاعران',
                ),
                GButton(
                  icon: Icons.person,
                  iconColor: Colors.white,
                  text: 'پروفایل',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
        body: Container(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                      builder: (ctx) => SideMenu()));
                            },
                            icon: Icon(
                              Icons.vertical_distribute_outlined,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                        Text(
                          "شعراء",
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  color: kPrimaryColor.withOpacity(0.4),
                                  blurRadius: 18.0,
                                  offset: Offset(5.0, 7.0),
                                ),
                              ],
                              fontSize: 40,
                              fontFamily: "A.Ali_banner3az.ir",
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor),
                        ),
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage()));
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                                color: kSecondrayColor,
                              ),
                              label: Text("")),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 360,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()));
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
                              style:
                                  TextStyle(fontSize: 12, color: kPrimaryColor),
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
                  Container(
                    width: 350,
                    height: 215,
                    alignment: Alignment.centerRight,
                    child: ListView(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: ListTile(
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
                            color: kPrimaryColor,
                            fontFamily: "Vazir",
                            fontSize: 18),
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
                    width: 250,
                    height: 180,
                    child: Image.asset("images/Resumefolderbro.png"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
