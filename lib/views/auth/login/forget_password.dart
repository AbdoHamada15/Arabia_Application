import 'package:arabia_applicaltion/core/widgets/k_back_login.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/widgets/k_button.dart';
import '../../../core/widgets/k_form.dart';
import 'otp_forget.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool isLoading = false;
  final _nationalCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 37, right: 32, top: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Image.asset(
              'assets/logo.png',
              height: 90,
            ),
            SizedBox(
              height: height * 0.025,
            ),
            const Text(
              'Forget Password',
              style: styleAddress,
              textAlign: TextAlign.center, // Center the heading
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              "Welcome",
              style: styleLabel11,
            ),
            const Text(
              "To Arabia Online Plateform",
              style: styleAddress,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            KForm(
              hintText: "Enter National Id/Iqama Number",
              controller: _nationalCon,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            KButton(
              text: 'Next',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OTPPassScreen()),
                );
              },
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const KBackLogin(),
          ]),
        ));
  }
}
