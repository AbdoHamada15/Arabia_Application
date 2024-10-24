import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class DateOfBirthInput extends StatefulWidget {
  const DateOfBirthInput({super.key});

  @override
  _DateOfBirthInputState createState() => _DateOfBirthInputState();
}

class _DateOfBirthInputState extends State<DateOfBirthInput> {
  DateTime? _selectedDate;

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250, // Adjust height as needed
          color: CupertinoColors.white,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () {
                      if (_selectedDate != null) {
                        setState(() {}); // Refresh UI
                      }
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
              Expanded(
                // Important: Makes CupertinoDatePicker fill available space
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: _selectedDate ?? DateTime.now(),
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() => _selectedDate = newDate);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("Date Of Birth"),
        const SizedBox(height: 8),
        GestureDetector(
          // Use GestureDetector for tap functionality
          onTap: () => _showDatePicker(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Expanded(
                  // Makes the text field expand to fill available space
                  child: Text(
                    _selectedDate == null
                        ? "Date Of Birth"
                        : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                    style: TextStyle(
                      color: _selectedDate == null
                          ? Colors.grey[400]
                          : Colors.black,
                    ),
                  ),
                ),

                const Icon(CupertinoIcons.calendar), // Cupertino Calendar Icon
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(
    const CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: DateOfBirthInput(),
          ),
        ),
      ),
    ),
  );
}
