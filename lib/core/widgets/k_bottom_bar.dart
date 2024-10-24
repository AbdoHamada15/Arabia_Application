import 'package:arabia_applicaltion/core/utils/app_color.dart';
import 'package:arabia_applicaltion/views/main/my_policies.dart';
import 'package:flutter/material.dart';

import '../../views/main/account_screen.dart';
import '../../views/main/products.dart';
import '../utils/app_style.dart';

class KBottomBar extends StatefulWidget {
  const KBottomBar({super.key});

  @override
  State<KBottomBar> createState() => _KBottomBarState();
}

class _KBottomBarState extends State<KBottomBar> {
  final List<Widget> pages = const [
    Products(),
    MyPoliciesScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    int myCurrentIndex = 1;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBackgroundColor,
        selectedItemColor: kbuttonColor,
        currentIndex: myCurrentIndex,
        selectedLabelStyle: styleLabel14,
        onTap: (index) {
          setState(() {
            myCurrentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(
                'assets/product.png')), // Use ImageIcon for better performance
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/home.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/account.png')),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
