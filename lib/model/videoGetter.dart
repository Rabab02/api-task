import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trainig/model/video.dart';

class videoGetter {
  Future<List<video>> getAll() async {
    const url =
        "https://api.joa-orthopedic.com/en-US/api/SOD_Course/GetAllCourse?skip=0&take=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> result = json['result'];
      final List<dynamic> data = result[0]['data'];
      final Video = data.map((e) {
        return video(
            description: e['description'],
            title: e['title'],
            image: e['image'],
            url: e['url']);
      }).toList();
      return Video;
    }
    return [];
    //throw "Something went Wrong";
  }
}
