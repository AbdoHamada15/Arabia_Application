import 'package:arabia_applicaltion/core/utils/app_color.dart';
import 'package:arabia_applicaltion/core/widgets/k_labeled_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../core/utils/app_style.dart';
import '../../core/widgets/k_button.dart';

import 'eeee.dart';

class KYCInfo extends StatefulWidget {
  const KYCInfo({super.key});

  @override
  State<KYCInfo> createState() => _KYCInfoState();
}

class _KYCInfoState extends State<KYCInfo> {
  final _con1 = TextEditingController();
  final _con2 = TextEditingController();
  final _con3 = TextEditingController();
  final _con4 = TextEditingController();
  bool isSwitched = true;
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
          style: styleAddress,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: kBackgroundColor,
            padding: kDefaultPadding,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "KYC Information",
                  style: styleLabel1,
                ),
                SizedBox(
                  height: height * 0.022,
                ),
                KLabeledTextField(label: "IBAN Number", controller: _con1),
                SizedBox(
                  height: height * 0.039,
                ),
                KLabeledTextField(label: "Income Source", controller: _con2),
                SizedBox(
                  height: height * 0.022,
                ),
                KLabeledTextField(label: "Annual Income", controller: _con3),
                SizedBox(
                  height: height * 0.022,
                ),
                KLabeledTextField(label: "Work Name", controller: _con4),
                SizedBox(
                  height: height * 0.031,
                ),
                /*
                KSwitchTile(title: 'The owner is the payer?', value: _isOwnerThePayer, onChanged: (value) {
                  setState(() {
                    _isOwnerThePayer = value;
                  });
                })
                */

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "The Owner is the payer?",
                      style: styleLabel,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlutterSwitch(
                          width: 40.0,
                          height: 23.0,
                          valueFontSize: 12.0,
                          toggleSize: 14.0,
                          value: isSwitched,
                          onToggle: (val) {
                            setState(() {
                              isSwitched = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                KButton(
                  text: 'Continue',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DateOfBirthInput()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
