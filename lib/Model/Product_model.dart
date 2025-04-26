// To parse this JSON data, do
//
//     final productscreenmodel = productscreenmodelFromJson(jsonString);

import 'dart:convert';

List<Productscreenmodel> productscreenmodelFromJson(String str) =>
    List<Productscreenmodel>.from(
        json.decode(str).map((x) => Productscreenmodel.fromJson(x)));

String productscreenmodelToJson(List<Productscreenmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Productscreenmodel {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  Category? category;
  List<String>? images;
  DateTime? creationAt;
  DateTime? updatedAt;

  Productscreenmodel({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
    this.creationAt,
    this.updatedAt,
  });

  factory Productscreenmodel.fromJson(Map<String, dynamic> json) =>
      Productscreenmodel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        price: json["price"],
        description: json["description"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        creationAt: json["creationAt"] == null
            ? null
            : DateTime.parse(json["creationAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "price": price,
        "description": description,
        "category": category?.toJson(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "creationAt": creationAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Category {
  int? id;
  Name? name;
  Slug? slug;
  String? image;
  DateTime? creationAt;
  DateTime? updatedAt;

  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        slug: slugValues.map[json["slug"]]!,
        image: json["image"],
        creationAt: json["creationAt"] == null
            ? null
            : DateTime.parse(json["creationAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "slug": slugValues.reverse[slug],
        "image": image,
        "creationAt": creationAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

enum Name {
  BEBIDAS,
  CHANGE,
  FURNITURE,
  MISCELLANEOUS,
  NUEVO,
  ROYAL_ITEMS,
  SHOES,
  UN_NUEVO_NOMBRE
}

final nameValues = EnumValues({
  "Bebidas": Name.BEBIDAS,
  "change": Name.CHANGE,
  "Furniture": Name.FURNITURE,
  "Miscellaneous": Name.MISCELLANEOUS,
  "nuevo": Name.NUEVO,
  "Royal Items": Name.ROYAL_ITEMS,
  "Shoes": Name.SHOES,
  "un nuevo nombre": Name.UN_NUEVO_NOMBRE
});

enum Slug {
  BEBIDAS,
  CHANGE,
  FURNITURE,
  MISCELLANEOUS,
  NUEVO,
  ROYAL_ITEMS,
  SHOES,
  UN_NUEVO_NOMBRE
}

final slugValues = EnumValues({
  "bebidas": Slug.BEBIDAS,
  "change": Slug.CHANGE,
  "furniture": Slug.FURNITURE,
  "miscellaneous": Slug.MISCELLANEOUS,
  "nuevo": Slug.NUEVO,
  "royal-items": Slug.ROYAL_ITEMS,
  "shoes": Slug.SHOES,
  "un-nuevo-nombre": Slug.UN_NUEVO_NOMBRE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
