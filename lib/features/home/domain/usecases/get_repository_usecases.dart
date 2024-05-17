import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecases.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/repository_entity.dart';
import '../repositories/home_repository.dart';

class GetRepositoryUseCases extends UsecaseWithParams<List<RepositoryEntity>, PageParams> {
  final HomeRepository _repository;
  const GetRepositoryUseCases(this._repository);

  @override
  ResultFuture<List<RepositoryEntity>> call(PageParams params) async {
    return await _repository.getRepositories(params.page);
  }
}

class PageParams extends Equatable {
  final int page;

  const PageParams({
    required this.page,
  });

  @override
  List<Object?> get props => [page];
}
