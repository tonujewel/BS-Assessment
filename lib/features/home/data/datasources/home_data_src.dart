
import '../../../../core/errors/exceptions.dart';
import '../../../../core/networking/api_url.dart';
import '../../../../core/networking/dio_client.dart';
import '../../features/home/data/models/product_model.dart';

abstract class HomeDataSrc {
  Future<List<ProductModel>> getProducts();
}

class HomeDataSrcImpl implements HomeDataSrc {
  final DioClient client;

  HomeDataSrcImpl({required this.client});

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final result = await client.get(url: UrlManager.baseUrl);

      if (result.statusCode != 200) {
        throw ApiException(message: result.body, statusCode: result.statusCode);
      }

      // return List<ProductModel>.from(jsonDecode(result.body) as List)
      //     .map((userData) => ProductModel.fromJson(userData))
      //     .toList();

      return [];
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}
