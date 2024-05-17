import '../../../../core/usecases/usecases.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/repository_entity.dart';
import '../repositories/home_repository.dart';

class GetRepositoryUseCases extends UsecaseWithoutParams<List<RepositoryEntity>> {
  final HomeRepository _repository;
  const GetRepositoryUseCases(this._repository);

  @override
  ResultFuture<List<RepositoryEntity>> call() async {
    return await _repository.getRepositories();
  }
}
