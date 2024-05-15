import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String enTitle;
  final String thumbImage;
  final String description;
  final int price;
  final List<VariationEntity> variations;

  const ProductEntity({
    required this.id,
    required this.enTitle,
    required this.thumbImage,
    required this.price,
    required this.variations,
    required this.description,
  });

  @override
  List<Object?> get props => [id, enTitle, thumbImage, price];
}

class VariationEntity extends Equatable {
  final String variationName;
  final String price;
  final String sku;
  final String qty;

  const VariationEntity({
    required this.variationName,
    required this.price,
    required this.sku,
    required this.qty,
  });

  @override
  List<Object?> get props => [variationName, price, sku, qty];
}
