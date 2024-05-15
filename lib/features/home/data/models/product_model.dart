import '../../domain/entities/product_entity.dart';

class ProductResponse {
  final List<ProductModel>? results;
  final bool? success;

  ProductResponse({this.results, this.success});

  factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
        results: json["results"] == null
            ? []
            : List<ProductModel>.from(json["results"]!.map((x) => ProductModel.fromJson(x))),
        success: json["success"],
      );
}

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.enTitle,
    required super.thumbImage,
    required super.price,
    required super.variations,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"] ?? "",
        enTitle: json["en_title"] ?? "",
        thumbImage: json["thumbImage"] ?? "",
        price: json["price"] ?? 0,
        variations: json["variations"] == null
            ? []
            : List<VariationModel>.from(json["variations"].map((x) => VariationModel.fromJson(x))),
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
        variationName: json["variationName"] ?? "",
        price: json["price"] ?? 0,
        sku: json["sku"] ?? "",
        qty: json["qty"] ?? "",
      );
}
