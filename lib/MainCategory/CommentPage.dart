import 'package:flutter/material.dart';

import '../constants.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
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
              SizedBox(
                height: 20,
              ),
              Text(
                "...کامینت",
                style: TextStyle(
                    color: kSecondrayColor,
                    fontFamily: "Vazir",
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              
            ],
          ),
        ),
      ),
    );
    ;
  }
}
