import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:test_x/core/services/db.dart';
import 'package:test_x/core/services/login_store.dart';
import 'package:test_x/core/services/user_store.dart';

import 'package:test_x/flavor.dart';

import 'app.dart';
import 'injection/injection_container.dart' as di;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Custom instance of [BlocObserver] which logs
/// any state changes and errors.
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

/// Bootstrap is responsible for any common setup and calls
/// [runApp] with the widget returned by [builder] in an error zone.
Future<void> bootstrap(FlavorType flavor) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  Bloc.observer = AppBlocObserver();
  await runZonedGuarded(() async {
    Flavor.instance.setFlavor = flavor;
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    await di.init();
    await DB.instance.init();

    await LoginStore.instance.init();
    await UserStore.instance.init();

    //await Future<void>.delayed(const Duration(milliseconds: 200));

    runApp(const MyApp());
  }, onError);
}

onError(Object exception, StackTrace stackTrace) {}
