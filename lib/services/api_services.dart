import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

GetStorage storage = GetStorage();

class ApiServices {
  /// login services///
  static Future<int?> logInService({Map<String, dynamic>? body}) async {
    List token = [];
    http.Response response = await http
        .post(
      Uri.parse('https://api.mursalexpress.com/store/login'),
      body: body,
    )
        .catchError((e) {
      print('ERRRROOORRR:$e');
    });
    if (response.statusCode == 200) {
      print('LOGIN : ${response.body}');

      var jsonString = jsonDecode(response.body);
      token = [];
      token.add(jsonString);
      var userToken = token[0]['data']['user']['token'];
      var name = token[0]['data']['user']['name'];
      var lat = token[0]['data']['store']['latitude'];
      var lng = token[0]['data']['store']['longitude'];
      var image = token[0]['data']['store']['image'];
      storage.write('token', userToken);
      storage.write('name', name);
      storage.write('lat', lat);
      storage.write('lng', lng);
      storage.write('image', image);
      print('TOKENNN : - ${storage.read('token')}');
      print('NAME : - ${storage.read('name')}');
      print('LAT : - ${storage.read('lat')}');
      print('LNG : - ${storage.read('lng')}');
      print('IMAGE : - ${storage.read('image')}');
      return jsonString['code'];
    }
    return null;
  }

  ///Register services///

  static Future<int?> registerData(
      {required Map<String, dynamic>? reqBody}) async {
    http.Response? response = await http.post(
        Uri.parse('https://api.mursalexpress.com/store/register'),
        body: reqBody);

    if (response.statusCode == 200) {
      print(response.body);
      var jsonString = jsonDecode(response.body);
      return jsonString['code'];
    } else {
      return null;
    }
  }

  ///Log Out Services///
  static Future<int?> logOutData(
      {required Map<String, dynamic> reqBody}) async {
    http.Response? response = await http.post(
        Uri.parse('https://api.mursalexpress.com/store/logout'),
        body: reqBody);

    if (response.statusCode == 200) {
      print(response.body);
      var jsonString = jsonDecode(response.body);
      return jsonString['code'];
    }
  }
}
