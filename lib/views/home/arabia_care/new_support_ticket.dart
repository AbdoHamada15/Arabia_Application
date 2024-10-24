import 'package:flutter/material.dart';

import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_style.dart';

class NewSupportTicket extends StatelessWidget {
  const NewSupportTicket({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Padding(
            padding: const EdgeInsets.only(left: 16, top: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 90,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: iconBack,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      CircleAvatar(
                          backgroundColor: kbuttonColor,
                          radius: 25.0,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset('assets/mic.png'),
                          )),
                      SizedBox(width: width * 0.03),
                      const Text('Arabia Care',
                          style: styleAddress, textAlign: TextAlign.center),
                    ],
                  ),
                ])));
  }
}
