import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class bookDetails extends StatefulWidget {
  final String title;
  final String description;
  final String url;
  final String image;
  const bookDetails(
      {key,
      required this.title,
      required this.description,
      required this.url,
      required this.image});
  @override
  State<bookDetails> createState() =>
      _bookDetailsState(title, description, url, image);
}

class _bookDetailsState extends State<bookDetails> {
  _bookDetailsState(
      String titles, String description, String url, String image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Image(
                image: NetworkImage(widget.image),
                height: 330,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 21,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.description,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade200),
                      width: double.infinity,
                      child: const Text(
                        "Open the book",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                  onTap: () async {
                    if (!await launchUrl(Uri.parse(widget.url))) {
                      throw Exception(
                          'Could not launch ${Uri.parse(widget.url)}');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
