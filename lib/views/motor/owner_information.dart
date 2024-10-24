import 'package:arabia_applicaltion/views/motor/kyc_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/app_style.dart';
import '../../core/widgets/k_button.dart';
import '../../core/widgets/k_labeled_date.dart';
import '../../core/widgets/k_labeled_textfield.dart';

class OwnerInformation extends StatefulWidget {
  const OwnerInformation({super.key});

  @override
  State<OwnerInformation> createState() => _OwnerInformationState();
}

class _OwnerInformationState extends State<OwnerInformation> {
  DateTime date = DateTime.now();
  TextEditingController dateCon = TextEditingController();
  final _con1 = TextEditingController();
  final _con2 = TextEditingController();
  TextEditingController dateCon2 = TextEditingController();
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        //leading: const MenuWidget(),
        elevation: 0,
        leading: IconButton(
          icon: iconBack,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: const Text(
          'Motor Insurance',
          style: styleHeader,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: kBackgroundColor,
            padding: kDefaultPadding,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Owner Information",
                    style: styleLabel1,
                  ),
                  SizedBox(
                    height: height * 0.022,
                  ),
                  KLabeledTextField(
                      label: "National ID/Iqama No", controller: _con1),
                  SizedBox(
                    height: height * 0.039,
                  ),
                  KLabeledDate(
                    controller: dateCon,
                    label: "Date Of Birth",
                  ),
                  SizedBox(
                    height: height * 0.031,
                  ),
                  KLabeledTextField(label: "Mobile No", controller: _con2),
                  SizedBox(
                    height: height * 0.031,
                  ),
                  KLabeledDate(
                    controller: dateCon2,
                    label: "Policy Effective Date",
                    lastDate: DateTime(2100),
                  ),
                  SizedBox(
                    height: height * 0.27,
                  ),
                  KButton(
                    text: 'Next',
                    onTap: () {
                      /*if (_formKey.currentState!.validate()) {
                                          //signUp();
                                        } */
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const KYCInfo()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _birthofDate(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            color: kBackgroundColor,
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
                  child: CupertinoDatePicker(
                    backgroundColor: kBackgroundColor,
                    initialDateTime: date,
                    minimumYear: 1950,
                    maximumYear: DateTime.now().year,
                    maximumDate: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime birthDate) {
                      setState(() {
                        dateCon.text = birthDate.toString().split(" ")[0];
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _showPolicyDate(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 300,
            //color: kBackgroundColor,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      child: const Text(
                        'Cancel',
                        style: styleAddress,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    CupertinoButton(
                      child: const Text(
                        'Done',
                        style: styleAddress,
                      ),
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
                  child: CupertinoDatePicker(
                    // backgroundColor: kBackgroundColor,
                    initialDateTime: date,
                    minimumYear: 1950,
                    maximumYear: DateTime.now().year,
                    maximumDate: DateTime(2100),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime birthDate2) {
                      setState(() {
                        dateCon2.text = birthDate2.toString().split(" ")[0];
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
