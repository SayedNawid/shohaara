import 'package:flutter/material.dart';

import '../constants.dart';
import 'drawer_category_items_list_widget.dart';

List<Map<String, dynamic>> dashboardDrawerItemsList = [
  {
    'category_index': 1,
    'icon': Icons.bookmark,
    'title': 'ذخیره شده ها',
  },
  {'category_index': 1, 'icon': Icons.info_rounded, 'title': 'درباره شعراء'},
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

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    super.key,
    required this.onTap,
    required this.currentDrawerIndex,
  });

  final Function(int) onTap;
  final int currentDrawerIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), bottomLeft: Radius.circular(50))),
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
                      CircleAvatar(
                        backgroundImage: AssetImage("images/profile.png"),
                      ),
                      Column(
                        children: [
                          Text(
                            " سید نوید محمدی",
                            style: TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "Software Engineer",
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
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                onTap: onTap,
                currentDrawerIndex: currentDrawerIndex,
                flagIndex: 1,
                title: 'داشبورد ',
                itemsList: dashboardDrawerItemsList,
              ),
              DrawerCategoryItemsListWidget(
                onTap: onTap,
                currentDrawerIndex: currentDrawerIndex,
                flagIndex: 2,
                title: 'ارتباطات',
                itemsList: communicationDrawerItemsList,
              ),
              DrawerCategoryItemsListWidget(
                onTap: onTap,
                currentDrawerIndex: currentDrawerIndex,
                flagIndex: 3,
                title: 'برنامه',
                itemsList: appDrawerItemsList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
