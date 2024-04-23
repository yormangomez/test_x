import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_x/feature/home/presentation/bloc/cat/cat_bloc.dart';
import 'package:test_x/feature/home/presentation/bloc/home/home_bloc.dart';
import 'package:test_x/feature/splash/bloc/splash_bloc.dart';
import 'package:test_x/feature/splash/pages/splash_screen.dart';
import 'package:test_x/flavor.dart';
import 'package:test_x/navigator.dart';

import 'injection/injection_container.dart' as di;

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  onGoToRoute(Routes route) {
    String? routeName = AppNavigator.getNameByRoute(route);
    String? currentRouteName = AppNavigator.getCurrentRoute();
    if (routeName != currentRouteName) {
      AppNavigator.push(route);
    }
  }

  bool _isInForeground = true;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    _isInForeground = state == AppLifecycleState.resumed;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<SplashBloc>()),
          BlocProvider(create: (context) => di.sl<HomeBloc>()),
          BlocProvider(create: (context) => di.sl<CatBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner:
              Flavor.instance.value == FlavorType.dev ? true : false,
          title: 'test',
          // localizationsDelegates: AppLocalizations.localizationsDelegates,
          // supportedLocales: L10n.all,
          navigatorKey: kIsWeb ? null : AppNavigator.navigatorKey,
          scaffoldMessengerKey: scaffoldMessengerKey,
          onGenerateRoute: kIsWeb ? null : AppNavigator.onGenerateRoute,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
