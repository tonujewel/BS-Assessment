import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/repository_entity.dart';
import '../../domain/usecases/get_repository_usecases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetRepositoryUseCases useCases;

  final List<RepositoryEntity> _productList = [];
  int page = 1;

  HomeBloc({required this.useCases}) : super(HomeInitial()) {
    on<GetProductEvent>(_getRepositoryHandler);
  }

  Future<void> _getRepositoryHandler(GetProductEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    if (event.isPagination) {
      page++;
    }
    final result = await useCases.call(PageParams(page: page));

    try {
      result.fold(
        (error) => emit(const HomeErrorState(message: "Something went wrong")),
        (productList) {
          _productList.addAll(productList);
          emit(HomeLoadedState(_productList));
        },
      );
    } catch (e) {
      const HomeErrorState(message: "Something went wrong");
    }
  }
}
