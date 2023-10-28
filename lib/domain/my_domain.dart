import 'dart:convert';
import 'dart:io';

import 'package:meduim_challenge/models/mymodel.dart';

import '../utils/http_helper.dart';

// dont use any package other than dart:convert and dart:io
// you can use any class from dart:convert and dart:io

class MyDomain {
  static final uri =
      Uri.parse("https://www.googleapis.com/books/v1/volumes?q=programming/");

  static Future<List<MyModel>> getData() async {
    try {
      HttpClientResponse res = await Http.get(uri);
      if (res.statusCode == 200) {
        final responseBody = await res.transform(utf8.decoder).join();
        final json = jsonDecode(responseBody);
        final items = json['items'];
        List<MyModel> data = [];
        for (var i in items) {
          data.add(MyModel.fromJson(i));
        }
        return data;
      } else {
        // Handle non-200 status codes here
        throw Exception('HTTP request failed with status ${res.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
