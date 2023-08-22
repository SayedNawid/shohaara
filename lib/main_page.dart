import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shohaara/MainCategory/CommentPage.dart';
import 'package:shohaara/MainCategory/CreatePost.dart';
import 'package:shohaara/MainCategory/ProfilePage.dart';
import 'package:shohaara/MainCategory/search_post.dart';
import 'package:shohaara/constants.dart';
import 'package:shohaara/navigation/sideMenu.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
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
                                    builder: (context) => SearchPost()));
                          },
                          icon: Icon(
                            Icons.search,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                                backgroundImage:
                                    AssetImage("images/profile.png"),
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
                                            builder: (context) =>
                                                CommentPage()));
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
      ),
    );
  }
}
