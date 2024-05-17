import 'package:bs_assessment/features/home/domain/entities/repository_entity.dart';

import '../../../../../../core/utils/typedef.dart';

abstract class HomeRepository {
  const HomeRepository();

  ResultFuture<List<RepositoryEntity>> getRepositories();
}
