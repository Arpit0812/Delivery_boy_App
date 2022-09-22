// To parse this JSON data, do
//
//     final myOrder = myOrderFromJson(jsonString);

import 'dart:convert';

MyOrder myOrderFromJson(String str) => MyOrder.fromJson(json.decode(str));

String myOrderToJson(MyOrder data) => json.encode(data.toJson());

class MyOrder {
  MyOrder({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory MyOrder.fromJson(Map<String, dynamic> json) => MyOrder(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.totalOrders,
    this.orders,
  });

  int? totalOrders;
  List<Order>? orders;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalOrders: json["total_orders"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_orders": totalOrders,
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.orderType,
    this.orderTitle,
    this.pickupImage,
    this.pickupName,
    this.pickupAddress,
    this.pickupLatitude,
    this.pickupLongitude,
    this.dropName,
    this.orderId,
    this.dropAddress,
    this.dropLatitude,
    this.dropLongitude,
    this.orderStatus,
    this.orderData,
    this.modeOfPayment,
    this.orderTotal,
    this.subTotal,
    this.discount,
    this.serviceFee,
    this.deliveryFee,
    this.orderNote,
    this.deliveryBoyDetails,
    this.totalItems,
    this.orderInfo,
  });

  int? orderType;
  String? orderTitle;
  String? pickupImage;
  String? pickupName;
  String? pickupAddress;
  String? pickupLatitude;
  String? pickupLongitude;
  String? dropName;
  int? orderId;
  String? dropAddress;
  String? dropLatitude;
  String? dropLongitude;
  String? orderStatus;
  String? orderData;
  String? modeOfPayment;
  int? orderTotal;
  int? subTotal;
  dynamic? discount;
  int? serviceFee;
  int? deliveryFee;
  String? orderNote;
  DeliveryBoyDetails? deliveryBoyDetails;
  int? totalItems;
  List<OrderInfo>? orderInfo;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderType: json["order_type"],
        orderTitle: json["order_title"],
        pickupImage: json["pickup_image"],
        pickupName: json["pickup_name"],
        pickupAddress: json["pickup_address"],
        pickupLatitude: json["pickup_latitude"],
        pickupLongitude: json["pickup_longitude"],
        dropName: json["drop_name"],
        orderId: json["order_id"],
        dropAddress: json["drop_address"],
        dropLatitude: json["drop_latitude"],
        dropLongitude: json["drop_longitude"],
        orderStatus: json["order_status"],
        orderData: json["order_data"],
        modeOfPayment: json["mode_of_payment"],
        orderTotal: json["order_total"],
        subTotal: json["sub_total"],
        discount: json["discount"],
        serviceFee: json["service_fee"],
        deliveryFee: json["delivery_fee"],
        orderNote: json["order_note"],
        deliveryBoyDetails:
            DeliveryBoyDetails.fromJson(json["delivery_boy_details"]),
        totalItems: json["total_items"],
        orderInfo: List<OrderInfo>.from(
            json["order_info"].map((x) => OrderInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_type": orderType,
        "order_title": orderTitle,
        "pickup_image": pickupImage,
        "pickup_name": pickupName,
        "pickup_address": pickupAddress,
        "pickup_latitude": pickupLatitude,
        "pickup_longitude": pickupLongitude,
        "drop_name": dropName,
        "order_id": orderId,
        "drop_address": dropAddress,
        "drop_latitude": dropLatitude,
        "drop_longitude": dropLongitude,
        "order_status": orderStatus,
        "order_data": orderData,
        "mode_of_payment": modeOfPayment,
        "order_total": orderTotal,
        "sub_total": subTotal,
        "discount": discount,
        "service_fee": serviceFee,
        "delivery_fee": deliveryFee,
        "order_note": orderNote,
        "delivery_boy_details": deliveryBoyDetails?.toJson(),
        "total_items": totalItems,
        "order_info": List<dynamic>.from(orderInfo!.map((x) => x.toJson())),
      };
}

class DeliveryBoyDetails {
  DeliveryBoyDetails({
    this.name,
    this.mobileNo,
    this.currentLocationLatitude,
    this.currentLocationLongitude,
  });

  String? name;
  String? mobileNo;
  String? currentLocationLatitude;
  String? currentLocationLongitude;

  factory DeliveryBoyDetails.fromJson(Map<String, dynamic> json) =>
      DeliveryBoyDetails(
        name: json["name"] == null ? null : json["name"],
        mobileNo: json["mobile_no"] == null ? null : json["mobile_no"],
        currentLocationLatitude: json["current_location_latitude"] == null
            ? null
            : json["current_location_latitude"],
        currentLocationLongitude: json["current_location_longitude"] == null
            ? null
            : json["current_location_longitude"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "mobile_no": mobileNo == null ? null : mobileNo,
        "current_location_latitude":
            currentLocationLatitude == null ? null : currentLocationLatitude,
        "current_location_longitude":
            currentLocationLongitude == null ? null : currentLocationLongitude,
      };
}

class OrderInfo {
  OrderInfo({
    this.productName,
    this.qty,
    this.price,
    this.unit,
    this.unitValue,
  });

  String? productName;
  int? qty;
  int? price;
  String? unit;
  String? unitValue;

  factory OrderInfo.fromJson(Map<String, dynamic> json) => OrderInfo(
        productName: json["product_name"],
        qty: json["qty"],
        price: json["price"],
        unit: json["unit"],
        unitValue: json["unit_value"],
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "qty": qty,
        "price": price,
        "unit": unit,
        "unit_value": unitValue,
      };
}
