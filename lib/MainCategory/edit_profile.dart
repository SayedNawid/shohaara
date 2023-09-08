import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shohaara/LoginScreens/sign_in_page.dart';
import 'package:shohaara/MainCategory/utils.dart';
import 'package:shohaara/services/api_service.dart';
import '../LoginScreens/components/button_confirm.dart';
import '../constants.dart';
import '../hiveModels/userModel.dart';
import 'edit_text_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User? userData;

  late String firstName = '';
  late String lastName = '';
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
        userData = user;
        firstName = user.firstName!;
        lastName = user.lastName!;
        username = user.username!;
        phoneNumber = user.phoneNumber!;
        email = user.email!;
        isLoading = false;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => const SignInPage()),
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
        firstName: firstName,
        lastName: lastName,
        username: username,
        phoneNumber: phoneNumber,
        email: email,
        authToken: authToken,
        whenComplete: () {
          Navigator.pop(context, true);
        },
        onError: (error) {
          print(error);
        },
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => const SignInPage()),
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

  void _updateFirstName(String newValue) {
    setState(() {
      firstName = newValue;
    });
  }

  void _updatelastName(String newValue) {
    setState(() {
      lastName = newValue;
    });
  }

  Uint8List? _image;

  // void selectImage() async {
  //   Uint8List? img = await pickImage(ImageSource.gallery);
  //   if (img != null) {
  //     setState(() {
  //       _image = img;
  //     });
  //     print(_image);
  //   } else {
  //     print("Image selection canceled");
  //   }
  // }
  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    if (img != null) {
      setState(() {
        _image = img;
      });
      ApiService.uploadImage(
        id: userData?.id,
        authToken: userData!.token as String,
        userData: userData,
        imageFile: img,
        fileType: 'user',
        onSuccess: (res) {
          print('');
        },
        onError: (error) {
          print(error);
        },
      );
    } else {
      print("Image selection canceled");
    }
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
              const SizedBox(
                height: 15,
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            if (_image != null)
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: MemoryImage(_image!),
                              )
                           else if (userData != null &&
                                userData!.profilePicture != null &&
                                userData!.profilePicture!.isNotEmpty)
                              CircleAvatar(
                                radius: 45,
                                backgroundImage:
                                    NetworkImage(userData!.profilePicture!),
                              )
                            else
                              const CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(
                                    'https://w7.pngwing.com/pngs/205/731/png-transparent-default-avatar-thumbnail.png'),
                              ),
                            Positioned(
                              child: IconButton(
                                onPressed: selectImage,
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  color: kPrimaryColor,
                                ),
                              ),
                              bottom: -10,
                              left: 50,
                            )
                          ],
                        ),
                        const Text(
                          "اطلاعات شخصی",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: "Vazir",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "برای نمایش اطلاعات روی فیلد ها کلیک کنید",
                          style: TextStyle(
                            color: kSecondrayColor,
                            fontFamily: "Vazir",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        EditTextField(
                          hintText: "نام کاربری جدید",
                          iconData: Icons.verified_user_outlined,
                          initialValue: username,
                          onChanged: _updateUsername,
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        EditTextField(
                          hintText: "نام جدید",
                          iconData: Icons.person,
                          initialValue: firstName,
                          onChanged: _updateFirstName,
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        EditTextField(
                          hintText: " تخلص جدید",
                          iconData: Icons.people_alt_outlined,
                          initialValue: lastName,
                          onChanged: _updatelastName,
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        EditTextField(
                          hintText: "شماره مبایل جدید",
                          iconData: Icons.phone_android_sharp,
                          initialValue: phoneNumber,
                          onChanged: _updatePhoneNumber,
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        EditTextField(
                          hintText: "ایمیل جدید",
                          iconData: Icons.email,
                          initialValue: email,
                          onChanged: _updateEmail,
                        ),
                        const SizedBox(
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
