import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class NetworkHelper {


  String appId = "0f1bebfd2ba98014701503fbda929d52";
  final String url;

  NetworkHelper({required this.url});

  Future<dynamic> getData() async {

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // print("")
        return jsonDecode(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

}