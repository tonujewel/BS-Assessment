import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.enTitle,
    required super.thumbImage,
    required super.price,
    required super.variations,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        enTitle: json["enTitle"],
        thumbImage: json["thumbImage"],
        price: json["price"],
        variations: json["variations"] == null
            ? []
            : List<VariationEntity>.from(json["variations"].map((x) => VariationModel.fromJson(x))),
      );
}

class VariationModel extends VariationEntity {
  const VariationModel({
    required super.variationName,
    required super.price,
    required super.sku,
    required super.qty,
  });

  factory VariationModel.fromJson(Map<String, dynamic> json) => VariationModel(
        variationName: json["variationName"],
        price: json["price"],
        sku: json["sku"],
        qty: json[" qty"],
      );
}
