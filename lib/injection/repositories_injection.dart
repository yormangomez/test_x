part of 'injection_container.dart';

void _initRepositoriesInjections() {
  sl.registerLazySingleton<CatRepository>(
      () => CatRepositoryImpl(catDatasource: sl()));
}
