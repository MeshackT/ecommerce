import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "category")
  String? category;

  @JsonKey(name: "brand")
  String? brand;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "offer")
  bool? offer;

  @JsonKey(name: "imageUrl")
  String? imageUrl;

  Product({
    this.id,
    this.name,
    this.brand,
    this.category,
    this.description,
    this.price,
    this.imageUrl,
    this.offer,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
