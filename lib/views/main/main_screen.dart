import 'package:flutter/material.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/app_style.dart';
import 'account_screen.dart';
import 'my_policies.dart';
import 'products.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<BottomNavigationBarItem> _bottomNavItems = [
    const BottomNavigationBarItem(
      icon: ImageIcon(AssetImage('assets/product.png')),
      label: 'Products',
    ),
    const BottomNavigationBarItem(
      icon: ImageIcon(AssetImage('assets/home.png')),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: ImageIcon(AssetImage('assets/account.png')),
      label: 'Account ',
    ),
  ];
  final List<Widget> screens = [
    const Products(),
    const MyPoliciesScreen(),
    const AccountScreen()
  ];
  int myCurrentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: BottomNavigationBarTheme(
        data: BottomNavigationBarThemeData(
          backgroundColor: kBackgroundColor,
          selectedItemColor: kbuttonColor,
          unselectedItemColor: kbuttonColor.withOpacity(0.6),
          selectedLabelStyle: styleLabel14,
        ),
        child: BottomNavigationBar(
            currentIndex: myCurrentIndex,
            items: _bottomNavItems,
            onTap: (int index) {
              setState(() {
                myCurrentIndex = index;
              });
            }),
      ),
      body: IndexedStack(
        index: myCurrentIndex,
        children: screens,
      ),
    );
  }
}
