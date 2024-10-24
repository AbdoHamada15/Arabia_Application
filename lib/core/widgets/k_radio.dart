import 'package:flutter/material.dart';

import '../utils/app_style.dart';

class KRadio extends StatefulWidget {
  final String label;
  final List<String> options;
  final ValueChanged<String?> onChanged;

  const KRadio({
    super.key,
    required this.label,
    required this.options,
    required this.onChanged,
  });

  @override
  State<KRadio> createState() => _KRadioState();
}

class _KRadioState extends State<KRadio> {
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: styleLabel,
        ),
        Column(
          children: widget.options.map((option) {
            return RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
                widget.onChanged(value!);
              },
            );
          }).toList(),
        )
      ],
    );
  }
}
