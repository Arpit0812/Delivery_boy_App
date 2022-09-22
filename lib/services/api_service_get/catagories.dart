import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/res_model/catagories_model.dart';
import '../api_services.dart';

class CatagoriesServices {
  static Future<Catagories?> catagoriesServices() async {
    http.Response? response = await http.get(
      Uri.parse(
          'https://api.mursalexpress.com/store/product/categories?token=${storage.read('token')}'),
    );
    if (response.statusCode == 200) {
      print(response.body);
      var result = catagoriesFromJson(response.body);
      return result;
    }
  }
}
