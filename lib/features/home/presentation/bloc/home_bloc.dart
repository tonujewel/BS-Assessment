import 'package:bs_assessment/features/home/domain/usecases/get_product_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductUseCases useCases;

  HomeBloc({required this.useCases}) : super(HomeInitial()) {
    on<GetProductEvent>(_getProductsHandler);
  }

  Future<void> _getProductsHandler(GetProductEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final result = await useCases.call();

    try {
      result.fold(
        (l) => emit(HomeError(message: l.message)),
        (r) => emit(HomeLoaded(r)),
      );
    } catch (e) {
      const HomeError(message: "message");
    }
  }
}
