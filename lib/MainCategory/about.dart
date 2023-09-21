import 'package:flutter/material.dart';

import '../constants.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
                  // Text(
                  //   "درباره شعراء",
                  //   style: TextStyle(
                  //       shadows: [
                  //         Shadow(
                  //           color: kPrimaryColor.withOpacity(0.4),
                  //           blurRadius: 18.0,
                  //           offset: const Offset(5.0, 7.0),
                  //         ),
                  //       ],
                  //       fontSize: 38,
                  //       fontFamily: "A.Ali_banner3az.ir",
                  //       fontWeight: FontWeight.w500,
                  //       color: kPrimaryColor),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage("images/Logo.png"),
                    backgroundColor: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                          'شرح',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: "A.Ali_banner3az.ir",
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor),
                        ),
                        SizedBox(height: 8.0),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "شعراء برنامه ای است که عاشقان شاعر و شعر را به هم متصل می کند. شما می توانید به صورت رایگان به شعراء بپیوندید و پروفایل خود را بسازید. می توانید عکس پروفایل خود را آپلود کنید، بیوگرافی خود را بنویسید. همچنین می توانید سایر کاربرانی را که علایق شما را به اشتراک می گذارند دنبال کنیدو پست های آنها را در نظر یا فید خود مشاهده کنید",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: kPrimaryColor,
                                    fontFamily: "Vazir"),
                                textAlign: TextAlign.right,
                              ),
                              Text(
                                "در شعراء ، می توانید اشعار خود را پست کنید یا اشعاری را از منابع دیگر به اشتراک بگذارید. می توانید یک عکس و یک متن به پست خود اضافه کنید. همچنین می توانید سایر کاربران یا شاعرانی که از شما الهام گرفته اند را تگ کنید. پست های شما برای همه در شعراء قابل مشاهده خواهد بود و می توانید لایک و نظر سایر کاربران را دریافت کنید. همچنین می توانید پست های دیگران را لایک کرده و در مورد آنها نظر دهید و با آنها تعامل داشته باشید",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: kPrimaryColor,
                                    fontFamily: "Vazir"),
                                textAlign: TextAlign.right,
                              ),
                              Text(
                                "شعراء همچنین به شما کمک می کند اشعار و شاعران جدیدی را که ممکن است دوست داشته باشید کشف کنید. می‌توانید دسته‌ها و زبان‌های مختلف شعر مانند کلاسیک، مدرن، عاشقانه یا طنز را مرور کنید. شما می توانید با مراجعه به پروفایل شاعران، که در آنجا می توانید تصاویر، بیو و شعرهای آنها را مشاهده کنید، بیشتر در مورد آنها اطلاعات کسب کنید. همچنین می‌توانید پست‌هایی را که می‌خواهید برای بعد ذخیره کنید یا دوباره بخوانید، نشانک یا بایگانی کنید",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: kPrimaryColor,
                                    fontFamily: "Vazir"),
                                textAlign: TextAlign.right,
                              ),
                              Text(
                                "به محض ورود به دنیای الشهرا، کاربران با یک رابط کاربری یکپارچه و زیبا مورد استقبال قرار می‌گیرند و از آنها دعوت می‌کند تا یک حساب کاربری ایجاد کنند یا به حساب موجود خود وارد شوند",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: kPrimaryColor,
                                    fontFamily: "Vazir"),
                                textAlign: TextAlign.right,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
