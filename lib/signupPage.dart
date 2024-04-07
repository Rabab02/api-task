import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trainig/components/customTextField.dart';

import 'components/customButton.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});
  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Text error = Text("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Image(image: AssetImage("images/Group 25.png")),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Create account",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter Your email and password to register with us",
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                customTextField(
                    hinttext: "Email",
                    mycontroller: email,
                    keboardType: TextInputType.emailAddress,
                    isPassword: false,
                    color: Colors.grey.shade300),
                const SizedBox(
                  height: 15,
                ),
                customTextField(
                    hinttext: "Password",
                    mycontroller: password,
                    keboardType: TextInputType.visiblePassword,
                    isPassword: true,
                    color: Colors.grey.shade300),
                const SizedBox(
                  height: 50,
                ),
                error,
                const SizedBox(
                  height: 10.0,
                ),
                customButtons(
                    onPressed: () async {
                      if (email.text.isEmpty || password.text.isEmpty) {
                        setState(() {
                          error = const Text(
                            "* All fields are required",
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          );
                        });
                      } else {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          );
                          Navigator.of(context)
                              .pushReplacementNamed("completeProfilePage");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            setState(() {
                              error = const Text(
                                '* The password provided is too weak.',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 18),
                              );
                            });
                          } else if (e.code == 'email-already-in-use') {
                            setState(() {
                              error = const Text(
                                'The account already exists for that email.',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 18),
                              );
                            });
                          } else {
                            setState(() {
                              error = Text(
                                e.code.toString(),
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 18),
                              );
                            });
                          }
                        } catch (e) {
                          setState(() {
                            error = Text(e.toString());
                          });
                        }
                      }
                    },
                    title: "Login",
                    color: Colors.blue,
                    width: double.infinity),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  child: Text(
                    "You have account? Login now",
                    style: TextStyle(color: Colors.grey),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed("LoginPage");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
