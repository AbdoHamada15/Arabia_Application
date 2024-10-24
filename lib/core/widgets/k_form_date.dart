import 'package:flutter/material.dart';
import '../utils/app_color.dart';
import '../utils/app_style.dart';

class KFormDate extends StatefulWidget {
  final TextEditingController? datecontroller;
  final String? labelText;
  final VoidCallback onTap;
  final Key? fieldKey;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final TextInputType? inputType;

  const KFormDate({
    super.key,
    this.datecontroller,
    this.fieldKey,
    this.hintText,
    this.validator,
    this.inputType,
    required this.onTap,
    this.labelText,
  });

  @override
  // ignore: library_private_types_in_public_api
  _KFormDateState createState() => _KFormDateState();
}

class _KFormDateState extends State<KFormDate> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 359,
        height: 50,
        decoration: BoxDecoration(
            color: kformColor, borderRadius: BorderRadius.circular(10)),
        child: TextField(
          style: const TextStyle(color: kHeaderTextColor),
          controller: widget.datecontroller,
          keyboardType: widget.inputType,
          key: widget.fieldKey,
          readOnly: true,
          onTap: widget.onTap,
          cursorColor: kBackgroundColor,
          decoration: InputDecoration(
            fillColor: kformColor,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            //hintText: widget.hintText,
            iconColor: kprimaryTextColor,
            labelText: widget.labelText,
            labelStyle: styleLabel13,
            contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            suffixIcon: const Icon(Icons.calendar_month),
            // hintStyle: const TextStyle(color: Colors.black26),
          ),
        ));
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: kprimaryColor,
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
