import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trainig/components/customButton.dart';
import 'package:trainig/components/customTextField.dart';

class completeProfilePage extends StatefulWidget {
  const completeProfilePage({super.key});
  @override
  State<completeProfilePage> createState() => _completeProfilePageState();
}

class _completeProfilePageState extends State<completeProfilePage> {
  TextEditingController email =
      TextEditingController(text: FirebaseAuth.instance.currentUser?.email);
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController phone = TextEditingController();
  Text error = const Text("");
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() {
    return users
        .add({
          'first_name': fname.text,
          'last_name': lname.text,
          'phone': phone.text,
          'email': email.text,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 35, right: 35),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Image(image: AssetImage("images/Group 89.png")),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Complete the profile",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Please enter the data to complete the profile",
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                customTextField(
                    hinttext: "First Name",
                    mycontroller: fname,
                    keboardType: TextInputType.text,
                    isPassword: false,
                    color: Colors.grey.shade300),
                const SizedBox(
                  height: 15,
                ),
                customTextField(
                    hinttext: "Last name",
                    mycontroller: lname,
                    keboardType: TextInputType.text,
                    isPassword: false,
                    color: Colors.grey.shade300),
                const SizedBox(
                  height: 15,
                ),
                customTextField(
                    hinttext: "Phone number",
                    mycontroller: phone,
                    keboardType: TextInputType.number,
                    isPassword: false,
                    color: Colors.grey.shade300),
                const SizedBox(
                  height: 20,
                ),
                error,
                const SizedBox(height: 10.0),
                customButtons(
                    onPressed: () {
                      if (fname.text.isEmpty ||
                          lname.text.isEmpty ||
                          phone.text.isEmpty) {
                        setState(() {
                          error = const Text(
                            "* All fields are required",
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          );
                        });
                      } else {
                        addUser();
                        Navigator.of(context).pushReplacementNamed("HomePage");
                      }
                    },
                    title: "Continue",
                    color: Colors.blue,
                    width: double.infinity),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
