import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:avatar_glow/avatar_glow.dart';
import '../../core/utils/app_color.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: AvatarGlow(
        startDelay: const Duration(milliseconds: 250),
        glowColor: kbuttonColor,
        glowShape: BoxShape.circle,
        curve: Curves.fastOutSlowIn,
        child: Material(
          elevation: 6.0,
          shape: const CircleBorder(),
          child: CircleAvatar(
            backgroundColor: kBackgroundColor,
            radius: 200.0,
            child: Image.asset(
              'assets/logo.png',
              height: 170,
            ),
          ),
        ),
      ),
      duration: 2000,
      nextScreen: const HomeScreen(),
      splashIconSize: 300,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
