part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<RepositoryEntity> repositories;

  const HomeLoadedState(this.repositories);
  @override
  List<Object> get props => [repositories];
}

class HomeErrorState extends HomeState {
  const HomeErrorState({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
