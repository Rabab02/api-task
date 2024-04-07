import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:trainig/LoginPage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("images/Logo 1.png"),
      backgroundColor: Colors.white,
      showLoader: true,
      logoWidth: 100,
      loaderColor: Colors.blueAccent,
      navigator: LoginPage(),
      durationInSeconds: 5,
    );
  }
}
