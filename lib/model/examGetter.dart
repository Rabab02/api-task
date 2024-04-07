import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trainig/model/exam.dart';

class examGetter {
  Future<List<exam>> getAll() async {
    const url =
        "https://api.joa-orthopedic.com/en-US/api/SOD_Exam/GetAllSOD_Exam?skip=0&take=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> result = json['result'];
      final List<dynamic> data = result[0]['data'];
      final Exam = data.map((e) {
        return exam(
            date: e['date'],
            time: e['time'],
            description: e['description'],
            title: e['title'],
            url: e['url']);
      }).toList();
      return Exam;
    }
    return [];
    //throw "Something went Wrong";
  }
}
