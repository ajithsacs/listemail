import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCall {
  final int id;
  final String title;
  final String body;
  const ApiCall({required this.id, required this.title, required this.body});
  factory ApiCall.formJson(Map<String, dynamic> json) {
    return ApiCall(
        id: json['id'] as int,
        title: json['title'] as String,
        body: json['body'] as String);
  }
}

Future<List<ApiCall>> getdata() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var dummy = compute(listformation, response.body);
  print('the response is:$dummy');
  return dummy;
}

List<ApiCall> listformation(String responsenbody) {
  final convertdata = jsonDecode(responsenbody);
  print(convertdata);
  return convertdata.map<ApiCall>((json) => ApiCall.formJson(json)).toList();
}
