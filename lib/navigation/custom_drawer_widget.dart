import 'package:flutter/material.dart';

import 'drawer_category_items_list_widget.dart';

List<Map<String, dynamic>> dashboardDrawerItemsList = [
  {'category_index': 1, 'icon': Icons.home, 'title': 'Home'},
  {
    'category_index': 1,
    'icon': Icons.currency_exchange_rounded,
    'title': 'Exchange Rates'
  },
  {
    'category_index': 1,
    'icon': Icons.wb_sunny_rounded,
    'title': 'Weather Forecast'
  },
  {
    'category_index': 1,
    'icon': Icons.location_on_rounded,
    'title': 'My Location'
  },
  {'category_index': 1, 'icon': Icons.language_rounded, 'title': 'Language'},
  {'category_index': 1, 'icon': Icons.book_rounded, 'title': 'References'},
];
List<Map<String, dynamic>> communicationDrawerItemsList = [
  {
    'category_index': 2,
    'icon': Icons.contact_mail_rounded,
    'title': 'Contact Us'
  },
  {'category_index': 2, 'icon': Icons.share_rounded, 'title': 'Share'},
];
List<Map<String, dynamic>> appDrawerItemsList = [
  {'category_index': 3, 'icon': Icons.exit_to_app_rounded, 'title': 'Exit'},
];

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    super.key,
    required this.onTap,
    required this.currentDrawerIndex,
  });

  final Function(int) onTap;
  final int currentDrawerIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Text(
                  'شعرا',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              DrawerCategoryItemsListWidget(
                onTap: onTap,
                currentDrawerIndex: currentDrawerIndex,
                flagIndex: 1,
                title: 'Dashboard',
                itemsList: dashboardDrawerItemsList,
              ),
              DrawerCategoryItemsListWidget(
                onTap: onTap,
                currentDrawerIndex: currentDrawerIndex,
                flagIndex: 2,
                title: 'Communication',
                itemsList: communicationDrawerItemsList,
              ),
              DrawerCategoryItemsListWidget(
                onTap: onTap,
                currentDrawerIndex: currentDrawerIndex,
                flagIndex: 3,
                title: 'App',
                itemsList: appDrawerItemsList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
