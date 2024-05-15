part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<ProductEntity> products;

  const HomeLoadedState(this.products);
  @override
  List<Object> get props => [products];
}

class HomeErrorState extends HomeState {
  const HomeErrorState({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
