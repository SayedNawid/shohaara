import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shohaara/MainCategory/edit_profile.dart';
import '../SpalshScreens/OnBoardingSceen.dart';
import '../constants.dart';
import 'package:hive/hive.dart';
import 'package:shohaara/hiveModels/userModel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? userData;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    final userBox = await Hive.openBox<User>('users');
    final user = userBox.get('user');
    if (user != null) {
      setState(() {
        userData = user;
        print("object 123" );
      });
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => const OnBoardingScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                height: 60,
                width: 340,
                child: Card(
                  shadowColor: kPrimaryColor,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
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
              Padding(
                padding: const EdgeInsets.all(14.0),
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
                                builder: (context) => const EditProfile()));
                      },
                      icon: const Icon(
                        FontAwesomeIcons.userEdit,
                        color: kPrimaryColor,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          userData != null
                              ? "${userData!.firstName} , ${userData!.lastName}"
                              : "User Name",
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text(
                          userData != null
                              ? "${userData!.phoneNumber}"
                              : "+93 792 881 775",
                          style: TextStyle(fontSize: 12, color: kPrimaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    const CircleAvatar(
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
              Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.bookmark_outlined,
                        color: kPrimaryColor,
                      ),
                      title: const Text(
                        "ذخیره شده ها",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Vazir",
                            color: kPrimaryColor),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.info_rounded,
                        color: kPrimaryColor,
                      ),
                      title: const Text(
                        "درباره شعراء",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Vazir",
                            color: kPrimaryColor),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.rule,
                        color: kPrimaryColor,
                      ),
                      title: const Text(
                        "قوانین و شرایط",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Vazir",
                            color: kPrimaryColor),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.settings,
                        color: kPrimaryColor,
                      ),
                      title: const Text(
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
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: ((context) => SignInPage())));
                },
                child: const Text(
                  "خروج از حساب کاربری",
                  style: TextStyle(
                      color: kPrimaryColor, fontFamily: "Vazir", fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  backgroundColor: Colors.white,
                  minimumSize: const Size(350, 50),
                  elevation: 0,
                  side: const BorderSide(
                    color: kPrimaryColor,
                  ),
                  shadowColor: kPrimaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ],
          ),
          Image.asset(
            "images/Resumefolderbro.png",
            height: 170,
          ),
        ],
      ),
    );
  }
}
