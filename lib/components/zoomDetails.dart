import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class zoomDetails extends StatefulWidget {
  final String title;
  final String description;
  final String url;
  final String image;
  final String date;
  const zoomDetails(
      {key,
      required this.title,
      required this.description,
      required this.url,
      required this.image,
      required this.date});
  @override
  State<zoomDetails> createState() =>
      _zoomDetailsState(title, description, url, image);
}

class _zoomDetailsState extends State<zoomDetails> {
  _zoomDetailsState(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(widget.image),
                height: 330,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade500, width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lecture",
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.description,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Date of the lecture",
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.date.substring(0, 10),
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue),
                      width: double.infinity,
                      child: const Text(
                        "Link Zoom - join now",
                        style: TextStyle(
                            color: Colors.white,
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
