import 'package:flutter/material.dart';

import '../constants.dart';

class Rules extends StatefulWidget {
  const Rules({super.key});

  @override
  State<Rules> createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage("images/Logo.png"),
                    backgroundColor: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'شعراء',
                            style: TextStyle(
                                fontSize: 38,
                                fontFamily: "A.Ali_banner3az.ir",
                                fontWeight: FontWeight.w500,
                                color: kPrimaryColor),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'نسخه 1.0.0 ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: kSecondrayColor,
                            ),
                          ),
                          Text(
                            'قوانین و شرایط',
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: "A.Ali_banner3az.ir",
                                fontWeight: FontWeight.w400,
                                color: kPrimaryColor),
                          ),
                          SizedBox(height: 8.0),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  " نمایه خود را ایجاد کنید",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: kPrimaryColor,
                                      fontFamily: "Vazir"),
                                  textAlign: TextAlign.right,
                                ),
                                Text(
                                  "کاربران می توانند با وارد کردن نام، نام خانوادگی، شماره تلفن، ایمیل، نام کاربری و آپلود عکس پروفایل، هویت شاعرانه خود را بسازند",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: kPrimaryColor,
                                      fontFamily: "Vazir"),
                                  textAlign: TextAlign.right,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "شعر را به اشتراک بگذارید",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: kPrimaryColor,
                                      fontFamily: "Vazir"),
                                  textAlign: TextAlign.right,
                                ),
                                Text(
                                  "در بخش نوشتن، کاربران می توانند اشعار خود را بنویسند، تصاویر خاطره انگیز اضافه کنند. هر شعر با تاریخ انتشار همراه است",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: kPrimaryColor,
                                      fontFamily: "Vazir"),
                                  textAlign: TextAlign.right,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "تعامل واتصال",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: kPrimaryColor,
                                      fontFamily: "Vazir"),
                                  textAlign: TextAlign.right,
                                ),
                                Text(
                                  "  فرصتی برای گذاشتن نظر، ارائه قدردانی از طریق لایک کردن، یا حتی نشانه گذاری برای الهام بعدی وجود دارد",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: kPrimaryColor,
                                      fontFamily: "Vazir"),
                                  textAlign: TextAlign.right,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "نشانک ها",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: kPrimaryColor,
                                      fontFamily: "Vazir"),
                                  textAlign: TextAlign.right,
                                ),
                                Text(
                                  "با استفاده از ویژگی نشانک، کاربران می توانند اشعار مورد علاقه خود را ذخیره کنند تا هر زمان که بخواهند دوباره از آن بازدید کنند",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: kPrimaryColor,
                                      fontFamily: "Vazir"),
                                  textAlign: TextAlign.right,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "فهرست شاعران",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: kPrimaryColor,
                                      fontFamily: "Vazir"),
                                  textAlign: TextAlign.right,
                                ),
                                Text(
                                  "در اینجا، آنها می توانند کل مجموعه شعر خود، از جمله تمام اشعار منتشر شده خود، زندگی نامه خود را به نمایش بگذارند. برای کسانی که به دنبال الهام گرفتن هستند یا به دنبال ارتباط با شاعران خاص هستند، فهرست شاعران فهرست جامعی از شاعران را ارائه می دهد که بر اساس نام مرتب شده اند، به کاربران این امکان را می دهد تا صداهای جدید را کشف کنند و واژه سازهای مورد علاقه خود را دنبال کنند",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: kPrimaryColor,
                                      fontFamily: "Vazir"),
                                  textAlign: TextAlign.right,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24.0),
                          Text(
                            'برنامه نویس',
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: "A.Ali_banner3az.ir",
                                fontWeight: FontWeight.w500,
                                color: kPrimaryColor),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'سید نوید محمدی',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: kPrimaryColor,
                                fontFamily: "Vazir"),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
