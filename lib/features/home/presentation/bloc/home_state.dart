part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ProductEntity> products;

  const HomeLoaded(this.products);
   @override
  List<Object> get props => [products];
}

class HomeError extends HomeState {
  const HomeError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
