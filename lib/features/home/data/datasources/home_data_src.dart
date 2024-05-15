import 'dart:convert';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/networking/api_url.dart';
import '../../../../core/networking/dio_client.dart';
import '../models/product_model.dart';

abstract class HomeDataSrc {
  Future<List<ProductModel>> getProducts();
}

class HomeDataSrcImpl implements HomeDataSrc {
  final DioClient client;

  HomeDataSrcImpl({required this.client});

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final result = await client.get(url: UrlManager.productListUrl);

      final res = ProductResponse.fromJson(jsonDecode(json.encode(result)));

      return res.results ?? [];
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}
