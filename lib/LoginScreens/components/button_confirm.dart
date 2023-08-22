import 'package:flutter/material.dart';
import 'package:shohaara/main_page.dart';

import '../../constants.dart';

class ButtonConfirm extends StatelessWidget {
  const ButtonConfirm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainPage()));
        },
        child: Text(
          "تآیید",
          style: const TextStyle(
              color: Colors.white, fontFamily: "Vazir", fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(left: 15, right: 15),
          backgroundColor: kPrimaryColor,
          minimumSize: const Size(315, 50),
          elevation: 10,
          shadowColor: kPrimaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
      ),
    );
  }
}
