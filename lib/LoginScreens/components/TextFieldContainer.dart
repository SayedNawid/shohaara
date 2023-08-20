import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      alignment: Alignment.center,
      width: size.width * 0.8,
      height: size.height * 0.060,
      decoration: BoxDecoration(
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
