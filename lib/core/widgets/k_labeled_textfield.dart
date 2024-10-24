import 'package:flutter/material.dart';

import '../utils/app_style.dart';
import 'k_text_form_field.dart';

class KLabeledTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const KLabeledTextField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: styleLabel,
        ),
        const SizedBox(height: 8),
        KTextField(
          controller: controller,
          validator: (value) =>
              value == null || value.isEmpty ? '$label is required' : null,
          onTap: () {},
        ),
      ],
    );
  }
}
