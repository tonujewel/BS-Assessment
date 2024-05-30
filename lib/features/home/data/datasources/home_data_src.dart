import 'dart:convert';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/networking/api_url.dart';
import '../../../../core/networking/dio_client.dart';
import '../models/repository_model.dart';

abstract class HomeDataSrc {
  Future<List<RepositoryModel>> getRepositories(int page);
}

class HomeDataSrcImpl implements HomeDataSrc {
  final DioClient client;

  HomeDataSrcImpl({required this.client});

  @override
  Future<List<RepositoryModel>> getRepositories(page) async {
    try {
      final result = await client.get(url: UrlManager.searchUrl(page: page, perPage: 10));

      final res = RepositoryResponse.fromJson(jsonDecode(json.encode(result)));

      return res.results ?? [];
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}
