import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/widgets/k_back_login.dart';
import '../../../core/widgets/k_button.dart';
import '../../../core/widgets/k_form.dart';
import 'otp.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  //final _formKey = GlobalKey<FormState>();
  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();
  @override
  void dispose() {
    _password1Controller.dispose();
    _password2Controller.dispose();
    super.dispose();
  }

/*     Validation
  void _submitForm() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      if (_password1Controller.text == _password2Controller.text) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OTPScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Passwords do not match!")));
      }
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
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
              'Reset Password',
              style: styleAddress,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            const Text(
              'Please enter the new password',
              style: styleLabel13,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            KForm(
              hintText: "Enter Password",
              controller: _password1Controller,
              isPasswordField: true,
              suffixIcon: const Icon(Icons.visibility_off),
              validator: (value) => value == null || value.length < 6
                  ? 'Password must be at least 6 characters'
                  : null,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            KForm(
              hintText: "Confirm Password",
              controller: _password2Controller,
              isPasswordField: true,
              suffixIcon: const Icon(Icons.visibility_off),
              validator: (value) => value == null || value.length < 6
                  ? 'Password must be at least 6 characters'
                  : null,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            KButton(
              text: 'Submit',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OTPScreen()));
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
