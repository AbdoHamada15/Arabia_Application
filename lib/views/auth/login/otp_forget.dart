import 'package:arabia_applicaltion/views/auth/login/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/widgets/k_back_login.dart';
import '../../../core/widgets/k_button.dart';

class OTPPassScreen extends StatefulWidget {
  const OTPPassScreen({super.key});

  @override
  _OTPPassScreenState createState() => _OTPPassScreenState();
}

class _OTPPassScreenState extends State<OTPPassScreen> {
  // Controllers for PIN input fields
  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final double height = MediaQuery.of(context).size.height;
    return Padding(
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
                  color: kformColor, borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          _buildResendCodeRow(),
          SizedBox(
            height: height * 0.01,
          ),
          KButton(
            text: 'Verify',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResetPassword()),
              );
            },
          ),
          SizedBox(
            height: height * 0.01,
          ),
          const KBackLogin(),
        ],
      ),
    );
  }

  Widget _buildResendCodeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the row
      children: [
        const Text(
          "Didn't receive the code?",
          style: styleLabel12,
        ),
        TextButton(
          onPressed: _handleResend,
          child: const Text("Resend in 5 mins", style: styleAddress2),
        ),
      ],
    );
  }

  void _handleVerify() {
    String otp = _pinController.text;

    print('Entered OTP: $otp');
  }

  void _handleResend() {
    print('Resend OTP');
  }
}
