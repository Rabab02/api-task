import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trainig/model/zoom.dart';

class zoomGetter {
  Future<List<zoom>> getAll() async {
    const url =
        "https://api.joa-orthopedic.com/en-US/api/SOD_Zoom_link/GetAllSOD_Zoom_link?skip=0&take=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> result = json['result'];
      final List<dynamic> data = result[0]['data'];
      final Zoom = data.map((e) {
        return zoom(
            id: e['id'],
            description: e['description'],
            title: e['title'],
            image: e['image'],
            url: e['url'],
            date: e['date']);
      }).toList();
      return Zoom;
    }
    return [];
    //throw "Something went Wrong";
  }
}
