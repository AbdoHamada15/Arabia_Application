import 'package:flutter/material.dart';
import 'core/themes/app_theme.dart';
import 'views/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Arabia',
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darkTheme,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.dark,
        routes: {
          '/': (context) => const SplashScreen(),
        });
  }
}
