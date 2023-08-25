import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shohaara/MainCategory/CommentPage.dart';
import 'package:shohaara/MainCategory/CreatePost.dart';
import 'package:shohaara/MainCategory/ProfilePage.dart';
import 'package:shohaara/MainCategory/search_post.dart';
import 'package:shohaara/constants.dart';
import 'package:shohaara/navigation/custom_drawer_widget.dart';
import 'package:shohaara/navigation/sideMenu.dart';

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
    Center(
      child: Text('data'),
    ),
    Center(
      child: Text('data'),
    ),
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
              });
            }),
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
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: ElevatedButton.icon(
                  //       style: ElevatedButton.styleFrom(
                  //         minimumSize: const Size(50, 35),
                  //         backgroundColor: Colors.white,
                  //         elevation: 5,
                  //         shadowColor: Colors.black,
                  //         shape: const RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.only(
                  //             topLeft: Radius.circular(50),
                  //             bottomLeft: Radius.circular(50),
                  //           ),
                  //         ),
                  //       ),
                  //       onPressed: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => MainPage()));
                  //       },
                  //       icon: Icon(
                  //         Icons.arrow_forward,
                  //         color: kSecondrayColor,
                  //       ),
                  //       label: Text("")),
                  // ),
                ],
              ),
            ),
            screens[_selectedIndex]
          ],
        ),
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
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => CreatePost())));
                  },
                  child: Text(
                    "آیا کدام شعر جدید دارید",
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
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  shadowColor: kPrimaryColor,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(35, 55),
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage()));
                              },
                              icon: Icon(
                                Icons.more_vert_outlined,
                                color: kPrimaryColor,
                              ),
                              label: Text(""),
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
                                  "2March - 02:34pm",
                                  style: TextStyle(
                                      fontSize: 12, color: kPrimaryColor),
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
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: kPrimaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          child: Text(
                            "من حلقه های زلفش از عشق می شمارم \n ور نه کجا رسد کس در حدو در شمارش \n یک جان چه بود صد جان منی ای خوب من",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontFamily: "Vazir",
                                color: kPrimaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 170,
                        child: Image.asset("images/matn2.jpg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          child: Row(
                            children: [
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(35, 55),
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100))),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.bookmark_outline_outlined,
                                  color: kPrimaryColor,
                                ),
                                label: Text(""),
                              ),
                              Spacer(),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(35, 55),
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CommentPage()));
                                },
                                icon: Text(
                                  "10",
                                  style: TextStyle(
                                      fontFamily: "Vazir",
                                      color: kPrimaryColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                label: Icon(
                                  FontAwesomeIcons.comment,
                                  color: kPrimaryColor,
                                ),
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(35, 55),
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                onPressed: () {},
                                icon: Text(
                                  "10",
                                  style: TextStyle(
                                      fontFamily: "Vazir",
                                      color: kPrimaryColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                label: Icon(
                                  Icons.favorite_border_outlined,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
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
