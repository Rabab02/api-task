import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OrthopedicPage extends StatefulWidget {
  const OrthopedicPage({super.key});
  @override
  State<OrthopedicPage> createState() => _OrthopedicPageState();
}

final Uri _urlAO = Uri.parse('https://www.aofoundation.org/');
final Uri _urlAAOS = Uri.parse('https://www.aaos.org/');
final Uri _urlIS = Uri.parse('https://www.isakos.com/');
final Uri _urlJOS = Uri.parse(
    'http://www.civilsociety-jo.net/en/organization/306/jordan-orthopedic-association');

class _OrthopedicPageState extends State<OrthopedicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Orthopedic Societies",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: _launchUrl,
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Image(image: AssetImage("images/AO.png")),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: InkWell(
                    onTap: _launchUrlAAOS,
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Image(image: AssetImage("images/AAOS.png")),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: _launchUrlIS,
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Image(image: AssetImage("images/ISAKOS.png")),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: InkWell(
                    onTap: _launchUrlJOS,
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Image(image: AssetImage("images/JOS.png")),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_urlAO)) {
      throw Exception('Could not launch $_urlAO');
    }
  }

  Future<void> _launchUrlAAOS() async {
    if (!await launchUrl(_urlAAOS)) {
      throw Exception('Could not launch $_urlAAOS');
    }
  }

  Future<void> _launchUrlIS() async {
    if (!await launchUrl(_urlIS)) {
      throw Exception('Could not launch $_urlIS');
    }
  }

  Future<void> _launchUrlJOS() async {
    if (!await launchUrl(_urlJOS)) {
      throw Exception('Could not launch $_urlJOS');
    }
  }
}
