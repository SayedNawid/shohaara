import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'CommentPage.dart';
import 'CreatePost.dart';
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
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => ProfilePage()));
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