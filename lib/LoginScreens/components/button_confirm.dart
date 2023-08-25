import 'package:flutter/material.dart';
import '../../constants.dart';

class ButtonConfirm extends StatelessWidget {
  final VoidCallback onPressed;  

  const ButtonConfirm({
    required this.onPressed,  
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 15, right: 15),
          backgroundColor: kPrimaryColor,
          minimumSize: const Size(315, 50),
          elevation: 10,
          shadowColor: kPrimaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),  
        child: const Text(
          "تآیید",
          style: TextStyle(
              color: Colors.white, fontFamily: "Vazir", fontSize: 18),
        ),
      ),
    );
  }
}
