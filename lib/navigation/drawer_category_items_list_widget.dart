import 'package:flutter/material.dart';

import 'drawer_item_widget.dart';

class DrawerCategoryItemsListWidget extends StatelessWidget {
  const DrawerCategoryItemsListWidget({
    super.key,
    required this.onTap,
    required this.currentDrawerIndex,
    required this.flagIndex,
    required this.title,
    required this.itemsList,
  });

  final Function(int) onTap;
  final int currentDrawerIndex;
  final int flagIndex;
  final String title;
  final List<Map<String, dynamic>> itemsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .color!
                          .withOpacity(0.75),
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              ...List.generate(itemsList.length, (index) {
                return DrawerItemWidget(
                  onTap: onTap,
                  index: flagIndex == 1
                      ? index
                      : flagIndex == 2
                          ? index + 6
                          : index + 8,
                  currentDrawerIndex: currentDrawerIndex,
                  icon: itemsList[index]['icon'],
                  title: itemsList[index]['title'],
                );
              }),
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
