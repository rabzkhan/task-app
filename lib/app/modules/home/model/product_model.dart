// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.barcode,
    this.description,
    this.subCategory,
    this.brand,
    this.quantity,
    this.productPrice,
    this.image,
  });

  int? id;
  String? name;
  String? barcode;
  String? description;
  Brand? subCategory;
  Brand? brand;
  Quantity? quantity;
  ProductPrice? productPrice;
  String? image;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        barcode: json["barcode"],
        description: json["description"],
        subCategory: json["subCategory"] == null
            ? null
            : Brand.fromJson(json["subCategory"]),
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        quantity: json["quantity"] == null
            ? null
            : Quantity.fromJson(json["quantity"]),
        productPrice: json["productPrice"] == null
            ? null
            : ProductPrice.fromJson(json["productPrice"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "barcode": barcode,
        "description": description,
        "subCategory": subCategory?.toJson(),
        "brand": brand?.toJson(),
        "quantity": quantity?.toJson(),
        "productPrice": productPrice?.toJson(),
        "image": image,
      };
}

class Brand {
  Brand({
    this.id,
    this.name,
    this.description,
    this.image,
    this.category,
  });

  int? id;
  String? name;
  String? description;
  String? image;
  Brand? category;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        category:
            json["category"] == null ? null : Brand.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "category": category?.toJson(),
      };
}

class ProductPrice {
  ProductPrice({
    this.id,
    this.price,
    this.unitPrice,
    this.mrp,
  });

  int? id;
  double? price;
  double? unitPrice;
  double? mrp;

  factory ProductPrice.fromJson(Map<String, dynamic> json) => ProductPrice(
        id: json["id"],
        price: json["price"],
        unitPrice: json["unitPrice"],
        mrp: json["mrp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "unitPrice": unitPrice,
        "mrp": mrp,
      };
}

class Quantity {
  Quantity({
    this.id,
    this.quantity,
    this.unit,
    this.unitValue,
    this.pastQuantity,
  });

  int? id;
  int? quantity;
  String? unit;
  double? unitValue;
  int? pastQuantity;

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
        id: json["id"],
        quantity: json["quantity"],
        unit: json["unit"],
        unitValue: json["unitValue"],
        pastQuantity: json["pastQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "unit": unit,
        "unitValue": unitValue,
        "pastQuantity": pastQuantity,
      };
}
