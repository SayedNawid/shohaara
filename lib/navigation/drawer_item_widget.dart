import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  const DrawerItemWidget({
    super.key,
    required this.onTap,
    required this.index,
    required this.currentDrawerIndex,
    required this.icon,
    required this.title,
  });

  final Function(int) onTap;
  final int index;
  final int currentDrawerIndex;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        decoration: index == currentDrawerIndex
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              )
            : const BoxDecoration(),
        child: ListTile(
          leading: Icon(
            icon,
            color: Theme.of(context).iconTheme.color,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}
