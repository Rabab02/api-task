import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainig/LoginPage.dart';
import 'package:trainig/model/prov.dart';
import 'package:trainig/profile.dart';
import 'package:trainig/signupPage.dart';
import 'package:trainig/splash.dart';
import 'package:trainig/videoLinks.dart';
import 'package:trainig/zoomLinks.dart';
import 'HomePage.dart';
import 'EaxmPage.dart';
import 'OrthopedicPage.dart';
import 'bookLinks.dart';
import 'completeProfile.dart';
import 'components/customBottomNavigator.dart';
import 'mainApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => prov(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
        routes: {
          "signupPage": (context) => signupPage(),
          "LoginPage": (context) => LoginPage(),
          "completeProfilePage": (context) => completeProfilePage(),
          "HomePage": (context) => HomePage(),
          "ExamPage": (context) => examLinksPage(),
          "OrthopedicPage": (context) => OrthopedicPage(),
          "profilePage": (context) => profilePage(),
          "mainAppPage": (context) => mainAppPage(),
          "zoomLinksPage": (context) => zoomLinksPage(),
          "bookLinksPage": (context) => bookLinksPage(),
          "videoLinksPage": (context) => videoLinksPage(),
          "customBottomNavigater": (context) => customBottomNavigater(),
        },
      ),
    );
  }
}
