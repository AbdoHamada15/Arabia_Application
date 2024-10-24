import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../utils/app_style.dart';
import 'k_form_date.dart';

class KLabeledDate extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  const KLabeledDate(
      {super.key,
      required this.label,
      required this.controller,
      this.initialDate,
      this.firstDate,
      this.lastDate});

  @override
  State<KLabeledDate> createState() => _KLabeledDateState();
}

class _KLabeledDateState extends State<KLabeledDate> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: styleLabel,
        ),
        SizedBox(
          height: height * 0.01,
        ),
        KFormDate(
          datecontroller: widget.controller,
          validator: (value) => value == null || value.isEmpty
              ? '${widget.label} is required'
              : null,
          onTap: () {
            _showCupertinoDatePicker(context, widget.controller);
          },
        ),
      ],
    );
  }

  Future<void> _showCupertinoDatePicker(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        DateTime selectedDate = widget.initialDate ?? DateTime.now();

        return SizedBox(
          height: 270,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('Cancel', style: styleAddress),
                    onPressed: () => Navigator.pop(context),
                  ),
                  CupertinoButton(
                    child: const Text('Done', style: styleAddress),
                    onPressed: () {
                      Navigator.pop(context, selectedDate);
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  minimumYear: widget.firstDate?.year ?? 1950,
                  maximumYear: widget.lastDate?.year ?? DateTime.now().year,
                  maximumDate: widget.lastDate ?? DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime newDate) {
                    selectedDate = newDate;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    if (picked != null) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd'); // Format the date
      controller.text = formatter.format(picked);
    }
  }
}
