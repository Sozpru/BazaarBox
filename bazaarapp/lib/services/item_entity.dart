// To parse this JSON data, do
//
//     final itemEntity = itemEntityFromJson(jsonString);

import 'dart:convert';

List<ItemEntity> itemEntityFromJson(String str) =>
    List<ItemEntity>.from(json.decode(str).map((x) => ItemEntity.fromJson(x)));

String itemEntityToJson(List<ItemEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

ItemEntity singleItemEntityFromJson(String str) =>
    ItemEntity.fromJson(json.decode(str));

String singleItemEntityToJson(ItemEntity data) => json.encode(data.toJson());

class ItemEntity {
  int id;
  String itemName;
  String description;
  String category;
  String imageUrl;
  int price;

  ItemEntity({
    required this.id,
    required this.itemName,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.price,
  });

  factory ItemEntity.fromJson(Map<String, dynamic> json) => ItemEntity(
        id: json["id"],
        itemName: json["item_name"],
        description: json["description"],
        category: json["category"],
        imageUrl: json["image_url"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "item_name": itemName,
        "description": description,
        "category": category,
        "image_url": imageUrl,
        "price": price,
      };
}
