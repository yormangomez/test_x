part of 'injection_container.dart';

void _initNetworkInjections() {
  sl.registerLazySingleton<CenterApi>(() => CenterApi());
  sl.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  sl.registerLazySingleton(() => CatUseCases(repository: sl()));
  sl.registerLazySingleton(() => GetCatUseCases(repository: sl()));
}
