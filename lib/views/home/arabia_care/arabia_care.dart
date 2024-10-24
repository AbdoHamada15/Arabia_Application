import 'package:arabia_applicaltion/views/home/arabia_care/new_support_ticket.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/widgets/k_icon.dart';
import '../../../core/widgets/k_list_tile.dart';
import '../../../core/widgets/k_text.dart';

class ArabiaCareScreen extends StatelessWidget {
  const ArabiaCareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              height: 90,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: <Widget>[
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
            const SizedBox(height: 24),
            const KText(text: 'Support Tickets', textStyle: styleAddress2),
            KListTile(
              leadingImagePath: "assets/note.png",
              title: 'Submit new ticket',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewSupportTicket())),
            ),
            KListTile(
              leadingImagePath: "assets/note.png",
              title: 'Check previous ticket status',
              onTap: () {},
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const KText(text: 'Contact Us', textStyle: styleAddress2),
            KListTile(
              leadingImagePath: "assets/call.png",
              title: 'Customer Care',
              trailing: const Text('920005002', style: styleLabel11),
              onTap: () {},
            ),
            KListTile(
              leadingImagePath: "assets/call.png",
              title: 'Toll Free',
              trailing: const Text('8001288888', style: styleLabel11),
              onTap: () {},
            ),
            KListTile(
              leadingImagePath: "assets/call.png",
              title: 'Medical Approvals',
              trailing: const Text('920002013', style: styleLabel11),
              onTap: () {},
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const KIcon(icon: FontAwesomeIcons.facebookF),
                SizedBox(width: width * 0.02),
                const KIcon(icon: FontAwesomeIcons.twitter),
                SizedBox(width: width * 0.02),
                const KIcon(icon: FontAwesomeIcons.instagram),
                SizedBox(width: width * 0.02),
                const KIcon(icon: FontAwesomeIcons.linkedinIn),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
