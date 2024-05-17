import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/repository_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_data_src.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSrc _dataSrc;

  HomeRepositoryImpl(this._dataSrc);
  @override
  ResultFuture<List<RepositoryEntity>> getRepositories() async {
    try {
      final result = await _dataSrc.getRepositories();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
