import 'dart:convert';

import 'package:bs_assessment/features/home/data/models/repository_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/networking/api_url.dart';
import '../../../../core/networking/dio_client.dart';

abstract class HomeDataSrc {
  Future<List<RepositoryModel>> getRepositories();
}

class HomeDataSrcImpl implements HomeDataSrc {
  final DioClient client;

  HomeDataSrcImpl({required this.client});

  @override
  Future<List<RepositoryModel>> getRepositories() async {
    try {
      final result = await client.get(url: UrlManager.searchUrl);

      final res = RepositoryResponse.fromJson(jsonDecode(json.encode(result)));

      return res.results ?? [];
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}
