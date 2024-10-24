import 'package:flutter/material.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/app_style.dart';
import 'arabia_care/arabia_care.dart';

class GuestServices extends StatelessWidget {
  const GuestServices({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: height * 0.02,
        ),
        const Text('Guest Services', style: styleTitle3),
        SizedBox(
          height: height * 0.02,
        ),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ArabiaCareScreen()),
            );
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return kprimaryColor.withOpacity(0.5);
              }
              return kcategoryColor2;
            }),
            foregroundColor: WidgetStateProperty.all<Color>(kcatFontColor),
            elevation: WidgetStateProperty.all<double>(0),
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          ),
          icon: CircleAvatar(
              backgroundColor: kbuttonColor,
              radius: 19.0,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image.asset('assets/mic.png'),
              )),
          label: const Text(
            'Arabia Care',
            style: styleCat,
          ),
        ),
      ],
    );
  }
}
