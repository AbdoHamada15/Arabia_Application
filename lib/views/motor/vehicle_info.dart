import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../core/utils/app_color.dart';
import '../../core/utils/app_style.dart';
import '../../core/widgets/k_button.dart';
import '../../core/widgets/k_form_email.dart';

class VehicleInfo extends StatefulWidget {
  const VehicleInfo({super.key});

  @override
  State<VehicleInfo> createState() => _VehicleInfoState();
}

class _VehicleInfoState extends State<VehicleInfo>
    with TickerProviderStateMixin {
  bool value = false;
  String? selectedCategorie = "Third Party";
  //final _formKey = GlobalKey<FormState>();
  final _Con1 = TextEditingController();
  late int selectedRadio;
  String? selectedValue;
  bool isSwitched = false;
  List items = ["Item1", "Item2", "Item3"];
  String? dropdownValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

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
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Vehicle Information",
                    style: styleHeader,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Vehicle Identifier:",
                            style: styleLabel,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                child: Row(
                                  children: <Widget>[
                                    Radio(
                                        value: 1,
                                        toggleable: true,
                                        activeColor: kprimaryColor,
                                        groupValue: selectedRadio,
                                        onChanged: (val) {
                                          setSelectedRadio(val!);
                                        }),
                                    const Text(
                                      "Sequence No",
                                      style: styleAddress,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                child: Row(
                                  children: <Widget>[
                                    Radio(
                                        value: 2,
                                        activeColor: kprimaryColor,
                                        groupValue: selectedRadio,
                                        onChanged: (val) {
                                          setSelectedRadio(val!);
                                        }),
                                    const Text(
                                      "Custom Card",
                                      style: styleAddress,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      KFormEmail(
                        controller: _Con1,
                        hintText: "Sequence No",
                        isPasswordField: false,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Sequence No is Empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Ownership transfer?",
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
                              /*
                                            Container(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                "Value: $isSwitched",
                                              ),
                                            ),*/
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      const Text(
                        "Vehicle Usage",
                        style: styleLabel,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: DropdownButtonFormField<String>(
                          hint: const Text(
                            'Vehicle Usage',
                            style: TextStyle(
                                color: Color.fromARGB(255, 148, 149, 149),
                                fontSize: 16),
                          ),
                          value: dropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          items: <String>[
                            'Vehicle Usage',
                            'Item2',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.06,
                      ),
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text('Additional Drivers'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // هنا يمكنك إضافة الكود الخاص بتنفيذ ما يحدث عند الضغط على هذا العنصر
                          print('Additional Drivers clicked');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.more_horiz),
                        title: const Text('Additional Information'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // هنا يمكنك إضافة الكود الخاص بتنفيذ ما يحدث عند الضغط على هذا العنصر
                          print('Additional Information clicked');
                        },
                      ),
                      SizedBox(
                        height: height * 0.07,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: value,
                            checkColor: kBackgroundColor,
                            activeColor: kprimaryColor,
                            onChanged: (bool? value) {
                              setState(() {
                                this.value = value!;
                              });
                            },
                          ),
                          const Text(
                            "Accept Terms & Conditions",
                            style: styleAddress,
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      KButton(
                        text: 'Next',
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
