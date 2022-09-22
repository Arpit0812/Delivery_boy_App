import 'package:delivery_boy_app/model/res_model/my_order_model.dart';
import 'package:delivery_boy_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/res_model/my_order_model.dart';

class ApiServicesGet {
  static Future<MyOrder?> MyOrders() async {
    http.Response? response = await http.get(Uri.parse(
        'https://api.mursalexpress.com/store/order/get?token=${storage.read('token')}&skip=0&take=10&status=1'));
    if (response.statusCode == 200) {
      print('======json====${response.body}');
      var jsonData = myOrderFromJson(response.body);
      return jsonData;
    }
  }
}
