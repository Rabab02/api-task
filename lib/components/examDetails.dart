import 'package:flutter/material.dart';
import 'package:trainig/components/customButton.dart';
import 'package:url_launcher/url_launcher.dart';

class examDetails extends StatefulWidget {
  final String title;
  final String description;
  final String url;
  final String date;
  final String time;
  const examDetails(
      {key,
      required this.title,
      required this.description,
      required this.url,
      required this.date,
      required this.time});
  @override
  State<examDetails> createState() =>
      _examDetailsState(time, title, description, url, date);
}

class _examDetailsState extends State<examDetails> {
  _examDetailsState(
      String title, String time, String date, String description, String url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exam Detail"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  widget.description,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Exam date: ${widget.date}",
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Exam time: ${widget.time}",
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  minWidth: double.infinity,
                  onPressed: () async {
                    if (!await launchUrl(Uri.parse(widget.url))) {
                      throw Exception(
                          'Could not launch ${Uri.parse(widget.url)}');
                    }
                  },
                  color: Colors.grey.shade200,
                  child: const Text(
                    "Start the exam",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
