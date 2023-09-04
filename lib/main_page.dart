import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
// import 'package:shohaara/MainCategory/CommentPage.dart';
// import 'package:shohaara/MainCategory/CreatePost.dart';
import 'package:shohaara/MainCategory/ProfilePage.dart';
import 'package:shohaara/MainCategory/chat_page.dart';
import 'package:shohaara/constants.dart';
import 'package:shohaara/navigation/custom_drawer_widget.dart';

import 'MainCategory/home_scrren.dart';
import 'MainCategory/peot_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int _selectedDrawerIndex = 0;
  int _selectedIndex = 3;
  List screens = [
    Chatpage(),
    PeotPage(),
    ProfilePage(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        endDrawer: CustomDrawerWidget(
            currentDrawerIndex: _selectedDrawerIndex,
            onTap: (index) {
              setState(() {
                _selectedDrawerIndex = index;
                _key.currentState!.closeEndDrawer();
                print('index: $index');
                if (index == 0) {
                } else if (index == 1) {
                  
                } else if (index == 2) {
                } else if (index == 8) {
                  SystemNavigator.pop();
                  
                }
              });
            }),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
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
                    icon: Icons.chat,
                    iconColor: Colors.white,
                    text: 'شعرجنگی',
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
                  ),
                  GButton(
                    icon: LineIcons.home,
                    iconColor: Colors.white,
                    text: 'خانه',
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40,
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
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      style: IconButton.styleFrom(
                          minimumSize: const Size(35, 55),
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      onPressed: () {
                        _key.currentState!.openEndDrawer();
                      },
                      icon: Icon(
                        Icons.vertical_distribute_outlined,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            screens[_selectedIndex],
          ],
        ),
      ),
    );
  }
}
