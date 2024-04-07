import 'dart:convert';
import 'package:http/http.dart' as http;
import 'book.dart';

class bookGetter {
  Future<List<Book>> getAll() async {
    const url =
        "https://api.joa-orthopedic.com/en-US/api/SOD_Book/GetAllBook?skip=0&take=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> result = json['result'];
      final List<dynamic> data = result[0]['data'];
      final books = data.map((e) {
        return Book(
            image: e['image'],
            description: e['description'],
            title: e['title'],
            url: e['url'],
            id: e['id']);
      }).toList();
      return books;
    }
    return [];
    //throw "Something went Wrong";
  }
}
