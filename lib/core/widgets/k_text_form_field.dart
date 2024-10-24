import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class KTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextInputType? inputType;
  final VoidCallback? onTap; // Make onTap optional
  final bool readOnly; // Add readOnly property
  final Widget? suffixIcon;
  const KTextField(
      {super.key,
      this.controller,
      this.labelText,
      required this.onTap,
      this.hintText,
      this.validator,
      this.inputType,
      this.onSaved,
      this.readOnly = false,
      this.suffixIcon,
      TextInputType? keyboardType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: TextFormField(
          style: const TextStyle(color: Colors.black),
          controller: controller,
          keyboardType: inputType,
          readOnly: readOnly,
          onTap: onTap,
          onSaved: onSaved,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: kformColor,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            // These are usually enough
          ),
        ));
  }
}
