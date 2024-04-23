import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_x/core/services/center_api.dart';
import 'package:test_x/feature/home/data/datasources/cat_datasource.dart';
import 'package:test_x/feature/home/data/network/cat_datasource_impl.dart';
import 'package:test_x/feature/home/data/repositories/cat_repository.dart';
import 'package:test_x/feature/home/domain/usecases/cat_usecases.dart';
import 'package:test_x/feature/home/domain/usecases/get_cat_usecases.dart';
import 'package:test_x/feature/home/presentation/bloc/cat/cat_bloc.dart';
import 'package:test_x/feature/home/presentation/bloc/home/home_bloc.dart';
import 'package:test_x/feature/splash/bloc/splash_bloc.dart';
import 'package:test_x/flavor.dart';

part 'blocs_injection.dart';
part 'network_injection.dart';
part 'repositories_injection.dart';
part 'resources_injection.dart';

/// Instance of the dependency injection container.
final sl = GetIt.instance;

/// Initialize the dependency injection container.
Future<void> init() async {
  //=======================
  // Network
  //=======================
  _initNetworkInjections();

  //=======================
  // DataSource / Resources
  //=======================
  _initResourcesInjections();

  //=======================
  // Repositories
  //=======================
  _initRepositoriesInjections();

  //=======================
  // Blocs
  //=======================
  _initBlocsInjections();

  if (Flavor.instance.showChuck == true) {}
}
