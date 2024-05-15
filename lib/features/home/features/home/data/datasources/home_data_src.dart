import 'package:bs_assessment/features/home/features/home/data/models/product_model.dart';

abstract class HomeDataSrc {
  Future<List<ProductModel>> getProducts();
}

class HomeDataSrcImpl implements HomeDataSrc {
  @override
  Future<List<ProductModel>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
