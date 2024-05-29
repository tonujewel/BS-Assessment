import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/repository_entity.dart';
import '../../domain/usecases/get_repository_usecases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetRepositoryUseCases useCases;

  int page = 0;

  HomeBloc({required this.useCases}) : super(const HomeState()) {
    on<GetProductEvent>((_getRepositoryHandler));
  }

  Future<void> _getRepositoryHandler(GetProductEvent event, Emitter<HomeState> emit) async {
    // emit(HomeLoading());
    // if (event.isPagination) {
    //   page++;
    // }
    // final result = await useCases.call(PageParams(page: page));

    // try {
    //   result.fold(
    //     (error) => emit(const HomeErrorState(message: "Something went wrong")),
    //     (productList) {
    //       _productList.addAll(productList);
    //       emit(HomeLoadedState(_productList));
    //     },
    //   );
    // } catch (e) {
    //   const HomeErrorState(message: "Something went wrong");
    // }

    log("message ${state.status}");

    page++;

    if (state.hasReachedMax) return;
    try {
      if (state.status == PostStatus.loading) {
        final result = await useCases.call(PageParams(page: page));

        result.fold(
          (l) => emit(state.copyWith(
              status: PostStatus.success,
              posts: List.of(state.posts)..addAll([]),
              hasReachedMax: false,
              errorMessage: l.message)),
          (r) => r.isEmpty
              ? emit(
                  state.copyWith(
                    status: PostStatus.success,
                    hasReachedMax: true,
                  ),
                )
              : emit(state.copyWith(
                  status: PostStatus.success,
                  posts: r,
                  hasReachedMax: false,
                )),
        );

        // return posts.isEmpty
        //     ? emit(state.copyWith(status: PostStatus.success, hasReachedMax: true))
        //     : emit(state.copyWith(status: PostStatus.success, posts: posts, hasReachedMax: false));
      } else {
        // final posts = await PostsApi.getPosts(state.posts.length);
        final result = await useCases.call(PageParams(page: page));

        result.fold(
          (l) => emit(state.copyWith(
            status: PostStatus.success,
            posts: List.of(state.posts)..addAll([]),
            hasReachedMax: false,
            errorMessage: l.message,
          )),
          (r) => r.isEmpty
              ? emit(state.copyWith(hasReachedMax: true))
              : emit(state.copyWith(
                  status: PostStatus.success,
                  posts: List.of(state.posts)..addAll(r),
                  hasReachedMax: false,
                )),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: PostStatus.error, errorMessage: "failed to fetch posts"));
    }
  }
}
