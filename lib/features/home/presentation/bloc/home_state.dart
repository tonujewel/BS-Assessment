part of 'home_bloc.dart';

// abstract class HomeState extends Equatable {
//   const HomeState();

//   @override
//   List<Object> get props => [];
// }

// class HomeInitial extends HomeState {}

// class HomeLoading extends HomeState {}

// class HomeLoadedState extends HomeState {
//   final List<RepositoryEntity> repositories;

//   const HomeLoadedState(this.repositories);
//   @override
//   List<Object> get props => [repositories];
// }

// class HomeErrorState extends HomeState {
//   const HomeErrorState({required this.message});

//   final String message;

//   @override
//   List<Object> get props => [message];
// }

enum PostStatus { loading, success, error }

class HomeState extends Equatable {
  final PostStatus status;
  final List<RepositoryEntity> posts;
  final bool hasReachedMax;
  final String errorMessage;

  const HomeState({
    this.status = PostStatus.loading,
    this.hasReachedMax = false,
    this.posts = const [],
    this.errorMessage = "",
  });

  HomeState copyWith({
    PostStatus? status,
    List<RepositoryEntity>? posts,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, posts, hasReachedMax, errorMessage];
}
