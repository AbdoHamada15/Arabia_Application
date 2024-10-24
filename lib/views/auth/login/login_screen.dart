import 'package:arabia_applicaltion/core/widgets/k_form.dart';
import 'package:arabia_applicaltion/views/auth/registration/registration.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/widgets/k_button.dart';
import 'forget_password.dart';
import 'otp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  final _idController = TextEditingController(); // Use more descriptive names
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  /*
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
    
      Navigator.push(context, MaterialPageRoute(builder: (context) => const OTPScreen()));

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
              height: height * 0.03,
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
              controller: _idController,
              keyboardType: TextInputType.number, // Set keyboard type
              validator: (value) => value == null || value.isEmpty
                  ? 'Please enter your ID/Iqama' // More specific message
                  : null,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            KForm(
              hintText: "Enter Password",
              controller: _passwordController,
              isPasswordField: true,
              suffixIcon: const Icon(Icons.visibility_off),
              validator: (value) => value == null || value.length < 6
                  ? 'Password must be at least 6 characters'
                  : null,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  checkColor: kBackgroundColor,
                  activeColor: kprimaryColor,
                  onChanged: (bool? value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),
                const Text(
                  "Remember Me",
                  style: styleAddress2,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgetPassword()),
                    );
                  },
                  child: const Text(
                    "Forget password?",
                    style: styleAddress2,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            KButton(
                text: 'Login',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OTPScreen()),
                  );
                }),
            SizedBox(
              height: height * 0.01,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                );
              },
              child: const Text("Create an Account", style: styleLabel5),
            ),
          ]),
        ));
  }
}
