part of 'injection_container.dart';

void _initResourcesInjections() {
  sl.registerLazySingleton<CatDataSource>(
      () => CatDataSourceImpl(centerApi: sl()));
}
