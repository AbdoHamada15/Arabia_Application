import 'package:arabia_applicaltion/core/utils/app_color.dart';
import 'package:arabia_applicaltion/core/utils/app_style.dart';
import 'package:arabia_applicaltion/core/widgets/k_button.dart';
import 'package:flutter/material.dart';
import '../auth/login/login_screen.dart';
import 'category/categories_screen.dart';
import 'guest_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.008,
              ),
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  height: 85,
                  width: 129,
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Center(
                child: Text(
                  "Welcome to Arabia",
                  style: styleTitle1,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              KButton(
                text: "Login or Create an Account",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text('Get a Quote', style: styleTitle3),
              const Categoires(),
              const GuestServices()
            ],
          ),
        ),
      ),
    );
  }
}
