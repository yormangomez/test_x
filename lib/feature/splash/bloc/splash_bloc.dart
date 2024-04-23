import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_x/navigator.dart';

part 'splash_event.dart';
part 'splash_state.dart';

///Se genera el bloc que maneja el estado despues del splash
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<CheckSessionEvent>(_checkSession);
  }

  ///En este evento se valida si hay sesión iniciada
  _checkSession(CheckSessionEvent event, emit) {
    emit(state.copyWith(submissionStatus: SplashSubmissionStatus.fetching));

    ///Se hace la validación
    AppNavigator.push(Routes.HOME);
  }
}
