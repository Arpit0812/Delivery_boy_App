// To parse this JSON data, do
//
//     final insight = insightFromJson(jsonString);

import 'dart:convert';

Insight insightFromJson(String str) => Insight.fromJson(json.decode(str));

String insightToJson(Insight data) => json.encode(data.toJson());

class Insight {
  Insight({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory Insight.fromJson(Map<String, dynamic> json) => Insight(
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
    this.insight,
    this.productList,
    this.chartEarnings,
  });

  InsightClass? insight;
  List<ProductList>? productList;
  List<ChartEarning>? chartEarnings;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        insight: InsightClass.fromJson(json["insight"]),
        productList: List<ProductList>.from(
            json["productList"].map((x) => ProductList.fromJson(x))),
        chartEarnings: List<ChartEarning>.from(
            json["chart_earnings"].map((x) => ChartEarning.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "insight": insight?.toJson(),
        "productList": List<dynamic>.from(productList!.map((x) => x.toJson())),
        "chart_earnings":
            List<dynamic>.from(chartEarnings!.map((x) => x.toJson())),
      };
}

class ChartEarning {
  ChartEarning({
    this.time,
    this.earnings,
  });

  String? time;
  int? earnings;

  factory ChartEarning.fromJson(Map<String, dynamic> json) => ChartEarning(
        time: json["time"],
        earnings: json["earnings"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "earnings": earnings,
      };
}

class InsightClass {
  InsightClass({
    this.totalOrder,
    this.totalItem,
    this.totalEarning,
  });

  int? totalOrder;
  int? totalItem;
  int? totalEarning;

  factory InsightClass.fromJson(Map<String, dynamic> json) => InsightClass(
        totalOrder: json["totalOrder"],
        totalItem: json["totalItem"],
        totalEarning: json["totalEarning"],
      );

  Map<String, dynamic> toJson() => {
        "totalOrder": totalOrder,
        "totalItem": totalItem,
        "totalEarning": totalEarning,
      };
}

class ProductList {
  ProductList({
    this.productId,
    this.total,
    this.product,
  });

  int? productId;
  int? total;
  Product? product;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        productId: json["product_id"],
        total: json["total"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "total": total,
        "product": product?.toJson(),
      };
}

class Product {
  Product({
    this.id,
    this.storeId,
    this.isAdminProduct,
    this.name,
    this.image,
    this.price,
    this.categoryId,
    this.subCategoryId,
    this.unitId,
    this.serviceId,
    this.details,
    this.status,
    this.imageBack,
    this.imageOne,
    this.imageTwo,
  });

  int? id;
  int? storeId;
  int? isAdminProduct;
  String? name;
  String? image;
  int? price;
  int? categoryId;
  int? subCategoryId;
  int? unitId;
  dynamic? serviceId;
  String? details;
  int? status;
  dynamic? imageBack;
  dynamic? imageOne;
  dynamic? imageTwo;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        storeId: json["store_id"],
        isAdminProduct: json["is_admin_product"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        unitId: json["unit_id"],
        serviceId: json["service_id"],
        details: json["details"],
        status: json["status"],
        imageBack: json["image_back"],
        imageOne: json["image_one"],
        imageTwo: json["image_two"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "is_admin_product": isAdminProduct,
        "name": name,
        "image": image,
        "price": price,
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
        "unit_id": unitId,
        "service_id": serviceId,
        "details": details,
        "status": status,
        "image_back": imageBack,
        "image_one": imageOne,
        "image_two": imageTwo,
      };
}
