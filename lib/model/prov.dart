import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:trainig/model/bookGetter.dart';
import 'package:trainig/model/exam.dart';
import 'package:trainig/model/video.dart';
import 'package:trainig/model/videoGetter.dart';
import 'package:trainig/model/zoom.dart';
import 'package:trainig/model/zoomGetter.dart';
import 'book.dart';
import 'examGetter.dart';

class prov with ChangeNotifier {
  final books = bookGetter();
  final zooms = zoomGetter();
  final videoes = videoGetter();
  final exams = examGetter();
  List<bool> isLoading = [false, false, false, false];
  List<Book> _books = [];
  List<Book> get BOOKS => _books;
  List<zoom> _zoom = [];
  List<zoom> get ZOOM => _zoom;
  List<video> _video = [];
  List<video> get VIDEO => _video;
  List<exam> _exam = [];
  List<exam> get EXAM => _exam;

  Future<void> getAllBooks() async {
    isLoading[0] = true;
    notifyListeners();
    final response = await books.getAll();
    _books = response;
    isLoading[0] = false;
    notifyListeners();
  }

  Future<void> getZoom() async {
    isLoading[1] = true;
    notifyListeners();
    final response = await zooms.getAll();
    _zoom = response;
    isLoading[1] = false;
    notifyListeners();
  }

  Future<void> getVideo() async {
    isLoading[2] = true;
    notifyListeners();
    final response = await videoes.getAll();
    _video = response;
    isLoading[2] = false;
    notifyListeners();
  }

  Future<void> getExam() async {
    isLoading[3] = true;
    notifyListeners();
    final response = await exams.getAll();
    _exam = response;
    isLoading[3] = false;
    notifyListeners();
  }

  bool isExist = false;

  Future<void> login(
      {required String username, required String password}) async {
    try {
      Response response = await post(
          Uri.parse("https://api.joa-orthopedic.com/en-US/api/Auth/Login"),
          body: {
            "username": username,
            "password": password,
            "deviceToken": "string",
            "platform": "string",
            "version": "string",
            "language": "string",
            "role": "string"
          });
      if (response.statusCode == 200) {
        print("Successfully");
        isExist = true;
        notifyListeners();
      } else {
        print("Failed");
        isExist = false;
        notifyListeners();
      }
    } catch (e) {
      print("===============${e.toString()}");
    }
  }
}
