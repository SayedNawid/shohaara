import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';

class PeotPage extends StatefulWidget {
  const PeotPage({
    super.key,
  });

  @override
  State<PeotPage> createState() => _PeotPageState();
}
Uri url= Uri.parse("https://www.google.com");
Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
     print('Could not launch $url');
  }
}

class _PeotPageState extends State<PeotPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  shadowColor: kPrimaryColor,
                  elevation: 5,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("images/molana1.jpg"),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          Text(
                            "مولانا جلال الدین محمد بلخی",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: "Vazir",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "  شاعر معروف قرن هفتم هجری قمری و صاحب کتاب معروف مثنوی معنوی یک از شاعران نامدار کشور و ولایت بلخ",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          TextButton(
                              onPressed: (){
                                _launchUrl(Uri.parse("https://fa.wikipedia.org/wiki/%D9%85%D9%88%D9%84%D9%88%DB%8C"));
                              },
                              child: const Text(
                                "...دیدن بیشتر",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  shadowColor: kPrimaryColor,
                  elevation: 5,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("images/molana.jpg"),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          Text(
                            "سعدی شیرازی",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: "Vazir",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "مشرف الدین مصلح بن عبدالله شیرازی شاعر و نویسنده بزرگ قرن هفتم هجری قمری و تخلص وی سعدی میباشد",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          TextButton(
                              onPressed: (){
                                 _launchUrl(Uri.parse("https://fa.wikipedia.org/wiki/%D8%B3%D8%B9%D8%AF%DB%8C"));
                              },
                              child: const Text(
                                "...دیدن بیشتر",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  shadowColor: kPrimaryColor,
                  elevation: 5,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("images/rodaki.jpg"),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          Text(
                            "شاعر رودکی",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: "Vazir",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "ابوعبدالله جعفربن محمدبن حکیم‌بن عبدالرحمن‌بن آدم رودکی زاده اواسط قرن سوم هجری قمری از شاعران ایرانی دورهٔ سامانی در سدهٔ چهارم هجری قمری است",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          TextButton(
                              onPressed: () async {
                                _launchUrl(Uri.parse("https://fa.wikipedia.org/wiki/%D8%B1%D9%88%D8%AF%DA%A9%DB%8C")); 
                              },
                              child: const Text(
                                "...دیدن بیشتر",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  shadowColor: kPrimaryColor,
                  elevation: 5,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("images/sanaee.jpg"),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          Text(
                            "ابوالمجد مجدود بن آدم سنایی غزنوی",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: "Vazir",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "شاعر دربار «بهرام شاه غزنوی» بود؛ پادشاهی که آنقدر به «سنایی» علاقه داشت که مقدمات ازدواج او با دخترش را ترتیب داد",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          TextButton(
                              onPressed: () async {
                                _launchUrl(Uri.parse("https://fa.wikipedia.org/wiki/%D9%85%D9%88%D9%84%D9%88%DB%8C"));
                              },
                              child: const Text(
                                "...دیدن بیشتر",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  shadowColor: kPrimaryColor,
                  elevation: 5,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("images/nazami.jpg"),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          Text(
                            "حکیم ابومحمد نظامی",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: "Vazir",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "حکیم ابومحمد الیاس بن یوسف بن زکی ابن مؤید نظامی شاعر معروف ایرانی در قرن ششم هجری قمری است. ",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          TextButton(
                              onPressed: () async {
                                const url = "https://wwww.google.com";
                                if (await canLaunchUrl(url as Uri)) {
                                  await launchUrl(url as Uri);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: const Text(
                                "...دیدن بیشتر",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  shadowColor: kPrimaryColor,
                  elevation: 5,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("images/attar.jpg"),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          Text(
                            "عطار نیشاپوری",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: "Vazir",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "فریدالدین ابوحامد محمد عطار نیشابوری» در حرفه ی داروسازی و داروشناسی—که از پدرش آموخته بود—فعالیت می کرد",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          TextButton(
                              onPressed: () async {
                                const url = "https://wwww.google.com";
                                if (await canLaunchUrl(url as Uri)) {
                                  await launchUrl(url as Uri);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: const Text(
                                "...دیدن بیشتر",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  shadowColor: kPrimaryColor,
                  elevation: 5,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("images/fidosi.jpg"),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          Text(
                            "حکیم ابوالقاسم فردوسی توسی",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: "Vazir",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "سخن‌سرای نامی ایران و سرایندهٔ شاهنامه حماسهٔ ملی ایرانیان. او را بزرگ‌ترین سرایندهٔ پارسی‌گو دانسته‌اند. نام و آوازه فردوسی در همه جای جهان شناخته و ستوده شده است",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          TextButton(
                              onPressed: () async {
                                const url = "https://wwww.google.com";
                                if (await canLaunchUrl(url as Uri)) {
                                  await launchUrl(url as Uri);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: const Text(
                                "...دیدن بیشتر",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  shadowColor: kPrimaryColor,
                  elevation: 5,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("images/kheyam.jpg"),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          Text(
                            "حکیم ابوالفتح خیام",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: "Vazir",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "حکیم ابوالفتح عمربن ابراهیم الخیامی مشهور به “خیام” فیلسوف و ریاضیدان و منجم و شاعر ایرانی در سال ۴۳۹ هجری قمری در نیشابور زاده شد.",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          TextButton(
                              onPressed: () async {
                                const url = "https://wwww.google.com";
                                if (await canLaunchUrl(url as Uri)) {
                                  await launchUrl(url as Uri);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: const Text(
                                "...دیدن بیشتر",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  shadowColor: kPrimaryColor,
                  elevation: 5,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("images/sadi.jpg"),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          Text(
                            "خواجه شمس الدین محمد حافظ شیرازی",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: "Vazir",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "شاعر معروف قرن پنجم میلادی و صاحب کتاب معروف مثنوی معنوی یک از شاعران نامدار کشور",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          TextButton(
                              onPressed: () async {
                                const url = "https://wwww.google.com";
                                if (await canLaunchUrl(url as Uri)) {
                                  await launchUrl(url as Uri);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: const Text(
                                "...دیدن بیشتر",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  shadowColor: kPrimaryColor,
                  elevation: 5,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("images/molana1.jpg"),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          Text(
                            "مولانا جلال الدین محمد بلخی",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: "Vazir",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "شاعر معروف قرن هفتم هجری قمری  و صاحب کتاب معروف مثنوی معنوی یک از شاعران نامدار کشور",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          TextButton(
                              onPressed: () async {
                                const url = "https://wwww.google.com";
                                if (await canLaunchUrl(url as Uri)) {
                                  await launchUrl(url as Uri);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: const Text(
                                "...دیدن بیشتر",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
