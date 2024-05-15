import '../../../../../../core/utils/typedef.dart';
import '../entities/product_entity.dart';

abstract class HomeRepository {
  const HomeRepository();

  ResultFuture<List<ProductEntity>> getProducts();
}
