import 'package:bs_assessment/core/networking/dio_client.dart';
import 'package:bs_assessment/features/home/data/datasources/home_data_src.dart';
import 'package:bs_assessment/features/home/domain/usecases/get_product_usecases.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    // Bloc
    ..registerFactory(() => HomeBloc(useCases: sl()))

    // Use cases
    ..registerLazySingleton(() => GetProductUseCases(sl()))

    // repositories
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()))

    // Data sources
    ..registerLazySingleton<HomeDataSrc>(() => HomeDataSrcImpl(client: sl()))

    // external dependencies
    ..registerLazySingleton(() => DioClient());
}
