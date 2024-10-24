import 'package:flutter/material.dart';

import '../utils/app_style.dart';

class KResendCode extends StatelessWidget {
  const KResendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the row
        children: [
          RichText(
            // Use RichText to style parts of the text differently
            textAlign: TextAlign.center, // Center the text
            text: const TextSpan(
              text: "Didn't receive the code? ",
              style: styleLabel12,
              children: [
                TextSpan(
                  text: "Resend in 5 mins",
                  style: styleAddress2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
