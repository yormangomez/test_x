part of 'injection_container.dart';

void _initBlocsInjections() {
  sl.registerFactory(() => SplashBloc());
  sl.registerFactory(() => HomeBloc());
  sl.registerFactory(() => CatBloc(catUseCases: sl()));
}
