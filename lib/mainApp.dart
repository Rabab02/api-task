import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/customBottomNavigator.dart';

class mainAppPage extends StatefulWidget {
  const mainAppPage({super.key});
  @override
  State<mainAppPage> createState() => _mainAppPageState();
}

final Uri _urlJOS = Uri.parse(
    'http://www.civilsociety-jo.net/en/organization/306/jordan-orthopedic-association');

class _mainAppPageState extends State<mainAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "MAIN APPLICATION",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: Colors.grey.shade100),
              child: const Image(
                image: AssetImage("images/JOS.png"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "JORDAN ORTHPEDIC ASSOCIATION",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: _launchUrlJOS,
                    child:
                        const Image(image: AssetImage("images/Group 90.png"))),
                InkWell(
                    onTap: () {
                      launch(
                          "https://play.google.com/store/apps/details?id=com.fuais.doctor_association&hl=en_US");
                    },
                    child: const Image(
                        image: AssetImage("images/googleplay.png"))),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "About",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      bottom: 150, top: 20, right: 30, left: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade200),
                  child: const Text(
                    "Lorem ipsum dolor sit amet consectetur.Dictum id dui viverra amet nunc consequatorci nibh pellentesque. Auctor eu maecenasaugue congue lectus.",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrlJOS() async {
    if (!await launchUrl(_urlJOS)) {
      throw Exception('Could not launch $_urlJOS');
    }
  }
}
