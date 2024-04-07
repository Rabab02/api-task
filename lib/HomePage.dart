import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trainig/mainApp.dart';
import 'package:trainig/profile.dart';
import 'package:http/http.dart' as http;
import 'components/customBottomNavigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "HOME",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "View Links",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("zoomLinksPage");
                    },
                    child: Container(
                      height: 160,
                      width: 150,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(250, 250, 250, 10),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Expanded(child: Image.asset("images/Group 1.png")),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("Zoom Links"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("videoLinksPage");
                    },
                    child: Container(
                      height: 160,
                      width: 150,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(250, 250, 250, 10),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Expanded(child: Image.asset("images/Group 2.png")),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("Video Links"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("ExamPage");
                    },
                    child: Container(
                      height: 160,
                      width: 150,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(250, 250, 250, 10),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Expanded(child: Image.asset("images/Group 3.png")),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("Exam Links"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("OrthopedicPage");
                    },
                    child: Container(
                      height: 160,
                      width: 150,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(250, 250, 250, 10),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Expanded(child: Image.asset("images/Group 4.png")),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("orthpedic"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("bookLinksPage");
                    },
                    child: Container(
                      height: 160,
                      width: 150,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(250, 250, 250, 10),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Expanded(child: Image.asset("images/Group 5.png")),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("Book Links"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
