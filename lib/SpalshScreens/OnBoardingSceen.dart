import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shohaara/LoginScreens/LoginPage.dart';
import 'package:shohaara/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController = PageController();
  int currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (i) {
              setState(() {
                currentPageIndex = i;
              });
            },
            controller: _pageController,
            children: [
              Container(
                color: Colors.white,
                child: _page("شعراء", "images/Poetry-amico.png", "🙂سلام",
                    "  به اپلیکیشن اجتماعی شعراء خوش آمدی     "),
              ),
              Container(
                color: Colors.white,
                child: _page(
                    "شعراء",
                    "images/Oil-lamp-amico.png",
                    "نقد و بررسی",
                    "دوست خوب من! هر شعر از هر\n شاعری را دوست داری اینجا نقد کن \nو برای دیگران به اشتراک بگذار "),
              ),
              Container(
                color: Colors.white,
                child: _page(
                    "شعراء",
                    "images/Writing-room-amico.png",
                    "دریافت و پیشنهاد",
                    "با شعراء میتوانید شعر و شاعر مورد علاقه خود را دریافت نموده و یا برای ما پیشنهاد کنید تا یه اپلیکییشن اضافه شود "),
              ),
              Container(
                color: Colors.white,
                child: _page1("شعراء", "images/Literature-amico.png",
                    "خوش آمدی \n کشیدن"),
              ),
              Container(
                color: Colors.white,
                child: _page1("شعراء", "images/Writing-room-amico.png", ""),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 320),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 5,
                effect: const JumpingDotEffect(
                  activeDotColor: kPrimaryColor,
                  dotColor: kSecondrayColor,
                  dotHeight: 12,
                  dotWidth: 12,
                  jumpScale: .7,
                  verticalOffset: 15,
                ),
                onDotClicked: (index) {
                  _pageController.jumpToPage(index);
                },
              ),
            ),
          ),
          Row(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      backgroundColor: Colors.white,
                      elevation: 5,
                      shadowColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                    icon: const Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: kSecondrayColor,
                    ),
                    label: const Text(
                      "بزن قبلی",
                      style: TextStyle(
                          color: kSecondrayColor,
                          fontFamily: "Vazirmatn-VariableFont_wght"),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 35, bottom: 8),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      });
                    },
                    child: const Text(
                      "بریم صفحه اصلی",
                      style: TextStyle(
                          color: kSecondrayColor,
                          fontFamily: "Vazirmatn-VariableFont_wght"),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 30),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      backgroundColor: Colors.white,
                      elevation: 5,
                      shadowColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                    ),
                    icon: const Text(
                      "بزن بعدی",
                      style: TextStyle(
                          color: kSecondrayColor,
                          fontFamily: "Vazirmatn-VariableFont_wght"),
                    ),
                    label: const Icon(
                      FontAwesomeIcons.arrowRight,
                      color: kSecondrayColor,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget _page(String GnTitle, String imagePath, String title, String subTitle) {
  return Container(
    padding: const EdgeInsets.all(15),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: 70,
            child: Text(
              GnTitle,
              style: TextStyle(
                  shadows: [
                    Shadow(
                      color: kPrimaryColor.withOpacity(0.4),
                      blurRadius: 18.0,
                      offset: Offset(5.0, 7.0),
                    ),
                  ],
                  fontSize: 50,
                  fontFamily: "A.Ali_banner3az.ir",
                  fontWeight: FontWeight.w500,
                  color: kPrimaryColor),
            ),
          ),
          Container(
            child: Image.asset(
              imagePath,
              height: 300,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            alignment: Alignment.center,
            width: 300,
            height: 60,
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: const TextStyle(
                  fontSize: 26,
                  fontFamily: "Vazirmatn-VariableFont_wght",
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: 150,
            child: Text(
              textAlign: TextAlign.center,
              subTitle,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: kPrimaryColor,
                fontFamily: "Vazirmatn-VariableFont_wght",
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _page1(String title, String imagePath1, String text1) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: 70,
      child: Text(
        title,
        style: TextStyle(
            shadows: [
              Shadow(
                color: kPrimaryColor.withOpacity(0.4),
                blurRadius: 18.0,
                offset: Offset(5.0, 7.0),
              ),
            ],
            fontSize: 50,
            fontFamily: "A.Ali_banner3az.ir",
            fontWeight: FontWeight.w500,
            color: kPrimaryColor),
      ),
    ),
    Container(
      child: Image.asset(
        imagePath1,
        height: 300,
      ),
    ),
    Container(
      alignment: Alignment.center,
      width: 300,
      height: 100,
      child: Text(
        textAlign: TextAlign.center,
        text1,
        style: const TextStyle(
            fontSize: 26,
            fontFamily: "Vazirmatn-VariableFont_wght",
            fontWeight: FontWeight.bold,
            color: kPrimaryColor),
      ),
    ),
  ]);
}
