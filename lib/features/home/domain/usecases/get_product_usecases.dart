import '../../../../core/usecases/usecases.dart';
import '../../../../core/utils/typedef.dart';
import '../../features/home/domain/entities/product_entity.dart';
import '../../features/home/domain/repositories/home_repository.dart';

class GetUsers extends UsecaseWithoutParams<List<ProductEntity>> {
  final HomeRepository _repository;
  const GetUsers(this._repository);

  @override
  ResultFuture<List<ProductEntity>> call() async {
    return await _repository.getProducts();
  }
}
