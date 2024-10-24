import 'package:arabia_applicaltion/core/widgets/k_resend_code.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/widgets/k_back_login.dart';
import '../../../core/widgets/k_button.dart';
import '../../main/main_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 35, right: 30, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 90,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                'One-Time Password',
                style: styleAddress,
                textAlign: TextAlign.center, // Center the heading
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                'Please enter the 4 digits code',
                style: styleLabel11,
              ),
              const Text(
                'Sent to +966 05xxxxx2267',
                style: styleLabel11,
              ),
              SizedBox(
                height: height * 0.055,
              ),
              Pinput(
                controller: _pinController,
                length: 4,
                defaultPinTheme: PinTheme(
                  width: 55,
                  height: 55,
                  textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                  decoration: BoxDecoration(
                      color: kformColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const KResendCode(),
              SizedBox(
                height: height * 0.01,
              ),
              KButton(
                text: 'Verify',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const KBackLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
