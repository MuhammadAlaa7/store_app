import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<dynamic> get({
    required String url,
    @required String? token,
    // if you get data like profile data you must have access so you need a token
  }) async {
    try {
      Map<String, String> headers = {};
      if (token != null) {
        headers.addAll({
          'Authorization': 'Bearer $token',
        });
      }

      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        // if it is okay convert the data from string to json

        return jsonDecode(response.body);
      } else {
        throw Exception('Error in status code : ${response.statusCode}');
      }
    } on Exception catch (error) {
      throw Exception('There is an error in the Get Method : => >  $error');
    }
  }

  static Future<dynamic> post({
    required String url,
    required dynamic body,
    @required String? token,
  }) async {
    try {
      Map<String, String> headers = {};
      if (token != null) {
        headers.addAll({
          'Authorization': 'Bearer $token',
        });
      }

      http.Response response = await http.post(
        Uri.parse(url),
        body: body,
        headers: headers,
      );
      print('to url : $url \n  with body : $body   \n with token $token');
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        // the return is one opject >>> map
        return data;
      } else {
        throw Exception(
            'There is an error in status code ${response.statusCode} with body ${jsonDecode(response.body)}');
      }
    } catch (errorMessage) {
      throw Exception('There is an error in post method $errorMessage');
    }
  }

  static Future<dynamic> put({
    required String url,
    required dynamic body,
    @required token,
  }) async {
    try {
      print('to url : $url \n  with body : $body   \n with token $token');
      Map<String, String> headers = {};
      if (token != null) {
        headers.addAll({
          'Authorization': 'Bearer $token',
        });
      }

      http.Response response = await http.put(
        Uri.parse(url),
        body: body,
        headers: headers,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        // the return is one opject >>> map
        print('The data comes after modification $data');
        return data;
      } else {
        throw Exception(
            'There is an error in status code ${response.statusCode} with body ${jsonDecode(response.body)}');
      }
  
    } catch (errorMessage) {
      throw Exception('There is an error in put method $errorMessage');
    }
  }
}
