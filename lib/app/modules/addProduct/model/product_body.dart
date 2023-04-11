// To parse this JSON data, do
//
//     final productBody = productBodyFromJson(jsonString);

import 'dart:convert';

ProductBody productBodyFromJson(String str) =>
    ProductBody.fromJson(json.decode(str));

String productBodyToJson(ProductBody data) => json.encode(data.toJson());

class ProductBody {
  ProductBody({
    this.name,
    this.barcode,
    this.description,
    this.image,
    this.subCategory,
    this.brand,
    this.quantity,
    this.productPrice,
  });

  String? name;
  String? barcode;
  String? description;
  String? image;
  int? subCategory;
  int? brand;
  Quantity? quantity;
  ProductPrice? productPrice;

  factory ProductBody.fromJson(Map<String, dynamic> json) => ProductBody(
        name: json["name"],
        barcode: json["barcode"],
        description: json["description"],
        image: json["image"],
        subCategory: json["subCategory"],
        brand: json["brand"],
        quantity: json["quantity"] == null
            ? null
            : Quantity.fromJson(json["quantity"]),
        productPrice: json["productPrice"] == null
            ? null
            : ProductPrice.fromJson(json["productPrice"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "barcode": barcode,
        "description": description,
        "image": image,
        "subCategory": subCategory,
        "brand": brand,
        "quantity": quantity?.toJson(),
        "productPrice": productPrice?.toJson(),
      };
}

class ProductPrice {
  ProductPrice({
    this.price,
    this.unitPrice,
    this.mrp,
  });

  int? price;
  int? unitPrice;
  int? mrp;

  factory ProductPrice.fromJson(Map<String, dynamic> json) => ProductPrice(
        price: json["price"],
        unitPrice: json["unitPrice"],
        mrp: json["mrp"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "unitPrice": unitPrice,
        "mrp": mrp,
      };
}

class Quantity {
  Quantity({
    this.quantity,
    this.unit,
    this.unitValue,
    this.pastQuantity,
  });

  int? quantity;
  String? unit;
  int? unitValue;
  int? pastQuantity;

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
        quantity: json["quantity"],
        unit: json["unit"],
        unitValue: json["unitValue"],
        pastQuantity: json["pastQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "unit": unit,
        "unitValue": unitValue,
        "pastQuantity": pastQuantity,
      };
}
