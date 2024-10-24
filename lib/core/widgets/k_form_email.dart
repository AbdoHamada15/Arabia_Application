import 'package:flutter/material.dart';
import '../utils/app_color.dart';
import '../utils/app_style.dart';

class KFormEmail extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  const KFormEmail(
      {super.key,
      this.controller,
      this.isPasswordField,
      this.fieldKey,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.inputType});

  @override
  // ignore: library_private_types_in_public_api
  _KFormEmailState createState() => _KFormEmailState();
}

class _KFormEmailState extends State<KFormEmail> {
  final bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 359,
        height: 50,
        decoration: BoxDecoration(
            color: kformColor, borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: const TextStyle(color: Colors.black),
          controller: widget.controller,
          keyboardType: widget.inputType,
          key: widget.fieldKey,
          obscureText: widget.isPasswordField == true ? _obscureText : false,
          onSaved: widget.onSaved,
          cursorColor: kBackgroundColor,
          textInputAction: TextInputAction.done,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            hintText: widget.hintText,
            fillColor: kformColor,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            hintStyle: styleHint,
          ),
        ));
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black,
        content: SizedBox(
          height: size.height * 0.02,
          child: Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }
}
