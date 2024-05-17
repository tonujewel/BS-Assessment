part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetProductEvent extends HomeEvent {
  final bool isPagination;
  const GetProductEvent(this.isPagination);
}
