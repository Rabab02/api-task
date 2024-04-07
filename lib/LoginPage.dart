import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainig/components/customButton.dart';
import 'package:trainig/components/customTextField.dart';
import 'model/prov.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  Text error = const Text("");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<prov>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100, left: 35, right: 35),
                child: Column(
                  children: [
                    const Image(image: AssetImage("images/login 1.png")),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Enter your email and  password to login",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    customTextField(
                        hinttext: "Username",
                        mycontroller: username,
                        keboardType: TextInputType.name,
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
                      height: 10,
                    ),
                    InkWell(
                      child: const Text(
                        "Forget your password?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () async {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    error,
                    const SizedBox(height: 10.0),
                    customButtons(
                        onPressed: () async {
                          await value.login(
                              username: username.text.toString(),
                              password: password.text.toString());
                          if (value.isExist) {
                            Navigator.of(context)
                                .pushReplacementNamed("HomePage");
                          }
                        },
                        title: "Login",
                        color: Colors.blue,
                        width: double.infinity),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: Text(
                        "Create new Account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed("signupPage");
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
