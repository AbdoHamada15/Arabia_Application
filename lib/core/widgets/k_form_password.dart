import 'package:flutter/material.dart';
import '../utils/app_color.dart';
import '../utils/app_style.dart';

class KFormPassword extends StatefulWidget {
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

  const KFormPassword(
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
  _KFormPasswordState createState() => _KFormPasswordState();
}

class _KFormPasswordState extends State<KFormPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 359,
        height: 50,
        decoration: BoxDecoration(
            color: kBackgroundColor, borderRadius: BorderRadius.circular(5)),
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
            fillColor: kformColor,
            filled: true,
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            //prefixIcon: const Icon(Icons.lock_open_outlined),
            hintStyle: styleHint,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: widget.isPasswordField == true
                  ? Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: _obscureText == false ? Colors.blue : Colors.grey,
                    )
                  : const Text(""),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
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
