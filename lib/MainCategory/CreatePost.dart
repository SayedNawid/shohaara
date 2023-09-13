import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shohaara/MainCategory/utils.dart';
import '../constants.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  Uint8List? _image;
  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    if (img != null) {
      setState(() {
        _image = img;
      });
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
                const SizedBox(
                  width: 40,
                ),
                Text(
                  "ایجاد پست جدید",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                          color: kPrimaryColor.withOpacity(0.4),
                          blurRadius: 18.0,
                          offset: const Offset(5.0, 7.0),
                        ),
                      ],
                      fontSize: 28,
                      fontFamily: "A.Ali_banner3az.ir",
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    style: IconButton.styleFrom(
                        minimumSize: const Size(35, 55),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
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
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: kPrimaryColor,
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Container(
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            maxLines: 4,
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: "Vazir",
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: " چه چیزی در ذهن خود دارید ...",
                              hintStyle: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "Vazir",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            cursorColor: kPrimaryColor,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ),
                    ),
                    _image != null
                        ? Image.memory(_image!)
                        : const SizedBox(
                            height: 16,
                          ),
                    Divider(),
                    TextButton(
                        onPressed: () {
                          selectImage();
                        },
                        child: const Text(
                          "انتخاب کردن عکس",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: "Vazir",
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "ذخیره کردن",
                style: const TextStyle(
                    color: Colors.white, fontFamily: "Vazir", fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(left: 10, right: 10),
                backgroundColor: kPrimaryColor,
                minimumSize: const Size(345, 50),
                elevation: 10,
                shadowColor: kPrimaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
