import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCall {
  
  final String text;
  final List<Map> items;
  const ApiCall({ required this.text, required this.items});
  factory ApiCall.formJson(Map<String, dynamic> json) {
    return ApiCall(
        text: json['text'] as String,
        items: json['items'] as List<Map> );
  }
}

Future<List<ApiCall>> getdata() async {
  final response =
      await http.get(Uri.parse('https://pm.agilecyber.co.uk/report/api.php'));
  var dummy = compute(listformation, response.body);
  print('the response is:$dummy');
  return dummy;
}

List<ApiCall> listformation(String responsenbody) {
  final convertdata = jsonDecode(responsenbody);
  print(convertdata);
  return convertdata.map<ApiCall>((json) => ApiCall.formJson(json)).toList();
}
