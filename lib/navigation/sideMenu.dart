import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:shohaara/navigation/custom_drawer_widget.dart';

import 'InfoCard.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        width: 288,
        height: double.infinity,
        color: Color(0xFF17203A),
        child: SafeArea(
          //     child: Column(
          //   children: [
          //     InfoCard(
          //       name: "Sayed Nawid ",
          //       profession: "Software Engineer",
          //     ),
          //     ListTile(
          //       leading: SizedBox(
          //         width: 34,
          //         height: 34,
          //         child: RiveAnimation.asset(
          //           "images/animated_home.riv",
          //           artboard: "HOME",
          //           onInit: (Artboard) {},
          //         ),
          //       ),
          //       title: Text(
          //         "Home",
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     ),
          //   ],
          // ),
          child: CustomDrawerWidget(currentDrawerIndex: 0, onTap: (index) {}),
        ),
      ),
    );
  }
}
