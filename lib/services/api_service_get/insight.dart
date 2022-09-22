import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/res_model/catagories_model.dart';
import '../../model/res_model/insight_model.dart';
import '../api_services.dart';

class InsightServices {
  static Future<Insight?> insightServices() async {
    http.Response? response = await http.get(
      Uri.parse(
          'https://api.mursalexpress.com/store/insight/insight-info?token=${storage.read('token')}'),
    );
    if (response.statusCode == 200) {
      print(response.body);
      var result = insightFromJson(response.body);
      return result;
    }
  }
}
