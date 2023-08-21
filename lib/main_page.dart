import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shohaara/constants.dart';

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
                      CircleAvatar(
                        backgroundImage: AssetImage("images/profile.png"),
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
                                minimumSize: const Size(35, 55),
                                elevation: 0,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))),
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: kPrimaryColor,
                            ),
                            label: Text("")),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    showCursor: true,
                    cursorColor: kSecondrayColor,
                    style: TextStyle(
                        color: kSecondrayColor,
                        fontFamily: "Vazir",
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "آیا شعر جدیدی دارید؟",
                      hintStyle:
                          TextStyle(fontFamily: "Vazir", color: kPrimaryColor),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(width: 1, color: kPrimaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(width: 1, color: kPrimaryColor),
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
                                onPressed: () {},
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
