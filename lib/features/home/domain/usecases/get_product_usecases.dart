import '../../../../core/usecases/usecases.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/product_entity.dart';
import '../repositories/home_repository.dart';

class GetProductUseCases extends UsecaseWithoutParams<List<ProductEntity>> {
  final HomeRepository _repository;
  const GetProductUseCases(this._repository);

  @override
  ResultFuture<List<ProductEntity>> call() async {
    return await _repository.getProducts();
  }
}
