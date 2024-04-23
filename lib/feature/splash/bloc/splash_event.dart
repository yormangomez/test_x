part of 'splash_bloc.dart';

///Se genera el evento que nos escucha lo que pasa despues del splash
class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object?> get props => [];
}

///Se genera el evento que valida la sesión iniciada
class CheckSessionEvent extends SplashEvent {
  ///Se declara variables necesarias para la funcionalidad
  const CheckSessionEvent({this.context});
  final BuildContext? context;

  @override
  List<Object?> get props => [context];
}
