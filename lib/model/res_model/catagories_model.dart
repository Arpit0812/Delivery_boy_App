// To parse this JSON data, do
//
//     final catagories = catagoriesFromJson(jsonString);

import 'dart:convert';

Catagories catagoriesFromJson(String str) =>
    Catagories.fromJson(json.decode(str));

String catagoriesToJson(Catagories data) => json.encode(data.toJson());

class Catagories {
  Catagories({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory Catagories.fromJson(Map<String, dynamic> json) => Catagories(
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
    this.categories,
  });

  List<Category>? categories;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.image,
  });

  int? id;
  String? name;
  String? image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
