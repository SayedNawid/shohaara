import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shohaara/LoginScreens/sign_in_page.dart';
import 'package:shohaara/SpalshScreens/OnBoardingSceen.dart';
import 'package:shohaara/hiveModels/userModel.dart';
import 'package:shohaara/main_page.dart';

import '../constants.dart';
import 'drawer_category_items_list_widget.dart';

List<Map<String, dynamic>> dashboardDrawerItemsList = [
  {
    'category_index': 1,
    'icon': Icons.bookmark,
    'title': 'ذخیره شده ها',
  },
  {
    'category_index': 1,
    'icon': Icons.info_rounded,
    'title': 'درباره شعراء',
  },
  {'category_index': 1, 'icon': Icons.rule, 'title': 'قوانین و شرایط'},
  {'category_index': 1, 'icon': Icons.settings, 'title': 'تنظیمات'},
];
List<Map<String, dynamic>> communicationDrawerItemsList = [
  {
    'category_index': 2,
    'icon': Icons.contact_mail_rounded,
    'title': 'ارتباط با ما'
  },
  {'category_index': 2, 'icon': Icons.share_rounded, 'title': 'اشتراک گذاری'},
];
List<Map<String, dynamic>> appDrawerItemsList = [
  {'category_index': 3, 'icon': Icons.exit_to_app_rounded, 'title': 'خروج'},
];

class CustomDrawerWidget extends StatefulWidget {
  const CustomDrawerWidget({
    Key? key,
    required this.onTap,
    required this.currentDrawerIndex,
  }) : super(key: key);

  final Function(int) onTap;
  final int currentDrawerIndex;

  @override
  _CustomDrawerWidgetState createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {
  User? userData;

  void signOut(BuildContext context) async {
    final userBox = await Hive.openBox<User>('users');
    await userBox.clear(); // Clear user data from Hive
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const SignInPage()),
      (Route<dynamic> route) => false, // Remove all previous routes
    );
  }

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
      });
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => const OnBoardingScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
        ),
        backgroundColor: kPrimaryColor,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      userData != null &&
                            userData!.profilePicture != null &&
                            userData!.profilePicture!.isNotEmpty
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(
                              userData!.profilePicture!,
                            ),
                          )
                        : CircleAvatar(
                            backgroundImage: AssetImage("images/profile.png"),
                          ),
                      Column(
                        children: [
                          Text(
                            userData != null
                                ? " ${userData!.firstName} ${userData!.lastName}"
                                : "User Name",
                            style: TextStyle(
                              fontFamily: "Vazir",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            userData != null ? "${userData!.phoneNumber}" : 
                            "+93 799 000 000",
                            style: TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  'شعراء',
                  textAlign: TextAlign.center,
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
                      color: Colors.white),
                ),
              ),
              DrawerCategoryItemsListWidget(
                onTap: widget.onTap, // Use widget.onTap
                currentDrawerIndex:
                    widget.currentDrawerIndex, // Use widget.currentDrawerIndex
                flagIndex: 1,
                title: 'داشبورد ',
                itemsList: dashboardDrawerItemsList,
              ),
              DrawerCategoryItemsListWidget(
                onTap: widget.onTap, // Use widget.onTap
                currentDrawerIndex:
                    widget.currentDrawerIndex, // Use widget.currentDrawerIndex
                flagIndex: 2,
                title: 'ارتباطات',
                itemsList: communicationDrawerItemsList,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ListTile(
                    onTap: () {
                      signOut(
                          context); // Call the signOut function when "خروج" button is pressed
                    },
                    leading: Icon(
                      Icons.exit_to_app_rounded,
                      color: Colors.white,
                    ),
                    title: Text(
                      'خروج',
                      style: TextStyle(
                        fontFamily: "Vazir",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
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
