import 'package:bs_assessment/features/home/features/home/data/datasources/home_data_src.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../features/home/domain/entities/product_entity.dart';
import '../../features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSrc _dataSrc;

  HomeRepositoryImpl(this._dataSrc);
  @override
  ResultFuture<List<ProductEntity>> getProducts() async {
    try {
      final result = await _dataSrc.getProducts();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
