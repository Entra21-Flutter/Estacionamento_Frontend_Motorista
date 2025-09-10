import 'package:flutter/material.dart';
import 'package:vagaja/src/app/menu_app.dart';


class CustomBottomBarLayout extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomBarLayout({super.key, required this.selectedIndex});

  void _onItemTapped(BuildContext context, int index) {
    Navigator.pushReplacementNamed(context, appMenuitens[index].route);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) => _onItemTapped(context, index),
      type: BottomNavigationBarType.fixed,
      items: [
        ...appMenuitens.map(
          (item) => BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.title,
          ),
        ),
      ],
    );
  }
}
