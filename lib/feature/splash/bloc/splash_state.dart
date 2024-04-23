part of 'splash_bloc.dart';

enum SplashSubmissionStatus { initial, fetching, success, failed, canceled }

///Se genera el estado en el cual se va a guardar los datos necesarios
class SplashState extends Equatable {
  ///Se declaran variables
  final bool authenticated;
  final SplashSubmissionStatus submissionStatus;

  ///Se inicializa las variables
  const SplashState({
    this.authenticated = false,
    this.submissionStatus = SplashSubmissionStatus.initial,
  });

  ///Se reemplaza el dato de la variable con el nuevo obtenido
  SplashState copyWith({
    bool? authenticated,
    SplashSubmissionStatus? submissionStatus,
  }) =>
      SplashState(
        authenticated: authenticated ?? this.authenticated,
        submissionStatus: submissionStatus ?? this.submissionStatus,
      );

  ///Se compara que se halla cambiado el dato de la variable
  @override
  List<Object?> get props => [
        authenticated,
        submissionStatus,
      ];
}
