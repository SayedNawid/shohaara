import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shohaara/MainCategory/ProfilePage.dart';
import 'package:shohaara/services/api_service.dart';

import '../LoginScreens/components/button_confirm.dart';
import '../SpalshScreens/OnBoardingSceen.dart';
import '../constants.dart';
import '../hiveModels/userModel.dart';
import 'edit_text_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late String username = '';
  late String phoneNumber = '';
  late String email = '';
  bool isLoading = true;

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
        username = user.username!;
        phoneNumber = user.phoneNumber!;
        email = user.email!;
        isLoading = false;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => const OnBoardingScreen()),
      );
    }
  }

  void _updateUser() async {
    final userBox = await Hive.openBox<User>('users');
    final user = userBox.get('user');
    if (user != null) {
      final authToken = user.token ?? '';
      final userId = user.id ?? '';

      final response = await ApiService.updateUser(
        userId: userId,
        username: username,
        phoneNumber: phoneNumber,
        email: email,
        authToken: authToken,
        whenComplete: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (ctx) => const ProfilePage()),
          // );
        },
        onError: (error) {
          print(error);
        },
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => const OnBoardingScreen()),
      );
    }
  }

  void _updateUsername(String newValue) {
    setState(() {
      username = newValue;
    });
  }

  void _updatePhoneNumber(String newValue) {
    setState(() {
      phoneNumber = newValue;
    });
  }

  void _updateEmail(String newValue) {
    setState(() {
      email = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40),
                  Text(
                    "شعراء",
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          color: kPrimaryColor.withOpacity(0.4),
                          blurRadius: 18.0,
                          offset: const Offset(5.0, 7.0),
                        ),
                      ],
                      fontSize: 40,
                      fontFamily: "A.Ali_banner3az.ir",
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        minimumSize: const Size(35, 55),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            const CircleAvatar(
                              maxRadius: 35,
                              backgroundImage: AssetImage("images/profile.png"),
                            ),
                            Positioned(
                              bottom: 1,
                              right: 1,
                              child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  border: Border.all(color: kPrimaryColor),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    print('object');
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "اطلاعات شخصی",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: "Vazir",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "برای نمایش اطلاعات روی فیلد ها کلیک کنید",
                          style: TextStyle(
                            color: kSecondrayColor,
                            fontFamily: "Vazir",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        EditTextField(
                          hintText: "نام کاربری جدید",
                          iconData: Icons.person,
                          initialValue: username,
                          onChanged: _updateUsername,
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        EditTextField(
                          hintText: "شماره مبایل جدید",
                          iconData: Icons.phone_android_sharp,
                          initialValue: phoneNumber,
                          onChanged: _updatePhoneNumber,
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        EditTextField(
                          hintText: "ایمیل جدید",
                          iconData: Icons.email,
                          initialValue: email,
                          onChanged: _updateEmail,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ButtonConfirm(
                          text: "ذخیره",
                          onPressed: () {
                            _updateUser();
                          },
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
