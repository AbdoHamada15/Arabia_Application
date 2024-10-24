import 'package:arabia_applicaltion/core/utils/app_color.dart';
import 'package:arabia_applicaltion/core/widgets/k_icon_button.dart';
import 'package:arabia_applicaltion/core/widgets/k_list_tile.dart';
import 'package:arabia_applicaltion/core/widgets/k_text.dart';
import 'package:arabia_applicaltion/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_style.dart';
import '../auth/login/reset_password.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: height * 0.008,
            ),
            Center(
              child: Image.asset(
                'assets/logo.png',
                height: 100,
                width: 150,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Column(
                  children: [
                    Text(
                      'Hello there,',
                      style: styleCat2,
                    ),
                    Text(
                      'ID# 2193978656',
                      style: styleLabel14,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    KIconButton(
                        title: "Quotes",
                        image: Image.asset(
                          "assets/caricon.png",
                          width: 24,
                          height: 24,
                        ),
                        onTap: () {}),
                    SizedBox(
                      width: height * 0.01,
                    ),
                    KIconButton(
                        title: "Policies",
                        image: Image.asset(
                          "assets/policies.png",
                          width: 24,
                          height: 24,
                        ),
                        onTap: () {}),
                  ],
                ),
              ],
            ),
            const KText(text: 'MY ACCOUNT', textStyle: styleLabel6),
            KListTile(
              leadingImagePath: "assets/user.png",
              title: 'Profile',
              onTap: () {},
            ),
            KListTile(
              leadingImagePath: "assets/lock.png",
              title: 'Change Password',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResetPassword())),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const KText(text: 'SETTINGS', textStyle: styleLabel6),
            KListTile(
              leadingImagePath: "assets/lang.png",
              title: 'Language',
              trailing: const Text('عربي', style: styleLabel11),
              onTap: () {},
            ),
            KListTile(
              leadingImagePath: "assets/moon.png",
              title: 'Dark Mode',
              trailing: const Text('System', style: styleLabel11),
              onTap: () {},
            ),
            KListTile(
              leadingImagePath: "assets/notification.png",
              title: 'Notifications',
              onTap: () {},
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const KText(text: 'REACH OUT TO US', textStyle: styleLabel6),
            KListTile(
              leadingImagePath: "assets/contactus.png",
              title: 'Contact Us',
              onTap: () {},
            ),
            SizedBox(
              height: height * 0.015,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                child: const Center(
                  child: Text(
                    'Logout',
                    style: styleAddress,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
