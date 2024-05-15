import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<NavigateToHomeEvent>((event, emit) async {
      emit(SplashLoading());
      await Future.delayed((const Duration(seconds: 2)));
      emit(SplashLoaded());
    });
  }
}
