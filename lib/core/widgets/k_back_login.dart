import 'package:flutter/material.dart';

import '../../views/auth/login/login_screen.dart';
import '../utils/app_style.dart';

class KBackLogin extends StatelessWidget {
  const KBackLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
      child: const Text(
        'Back to login',
        style: styleLabel6,
      ),
    );
  }
}
