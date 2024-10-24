import 'package:arabia_applicaltion/views/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/widgets/k_button.dart';
import '../../../core/widgets/k_form.dart';
import '../login/otp.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool agreedToTerms = false;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final _idController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _mobileController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    _idController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (agreedToTerms) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OTPScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Please accept the Terms & Conditions")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 37, right: 32, top: 30),
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 90,
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
                    controller: _idController,
                    keyboardType: TextInputType.number,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter your ID'
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
                    validator: (value) => value == null ||
                            value.length < 6 // Combined conditions
                        ? (value == null || value.isEmpty
                            ? 'Please enter a password'
                            : 'Password must be at least 6 characters') // Conditional error message
                        : null,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  KForm(
                    hintText: "Enter Mobile number",
                    controller: _mobileController,
                    keyboardType: TextInputType.number,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter your Mobile number'
                        : null,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  KForm(
                    hintText: "Enter Email Address",
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter your Email Address'
                        : null,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: agreedToTerms,
                        checkColor: kBackgroundColor,
                        activeColor: kbuttonColor,
                        onChanged: (value) {
                          setState(() {
                            agreedToTerms = value!;
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          /*
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> const TermsAndConditionsScreen()));
                           */
                        },
                        child: const Text(
                          "Accept Terms & Conditions",
                          style: styleAddress2,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  KButton(
                    text: 'Create',
                    onTap: _submitForm,
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      "Already have an account?",
                      style: styleLabel5,
                    ),
                  )
                ]),
          ),
        ));
  }
}
