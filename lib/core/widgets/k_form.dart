import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_style.dart';

class KForm extends StatefulWidget {
  final String hintText;
  final bool? isPasswordField;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final FormFieldSetter<String>? onSaved;
  final String? Function(String?)? validator;
  const KForm(
      {super.key,
      required this.hintText,
      this.isPasswordField,
      required this.controller,
      this.keyboardType,
      this.suffixIcon,
      this.validator,
      this.onSaved});

  @override
  State<KForm> createState() => _KFormState();
}

class _KFormState extends State<KForm> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.isPasswordField == true ? obscureText : false,
        validator: widget.validator,
        onSaved: widget.onSaved,
        //textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: widget.hintText,
          fillColor: kformColor,
          filled: true,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: widget.isPasswordField == true
                ? Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color:
                        obscureText == false ? kprimaryColor : kSecondryColor,
                  )
                : const Text(""),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          hintStyle: styleHint,
        ),
      ),
    );
  }
}
