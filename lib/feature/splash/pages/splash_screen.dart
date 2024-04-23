// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:test_x/feature/splash/bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashBloc splashBloc;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToOnboardingPage();
    });
    splashBloc = context.read<SplashBloc>();
    super.initState();
  }

  _navigateToOnboardingPage() {
    int timeDurationSplash = 3880;
    Future.delayed(Duration(milliseconds: timeDurationSplash)).then((_) {
      splashBloc.add(CheckSessionEvent(context: context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
              child: Lottie.asset(
            'assets/animation/animation.json',
            fit: BoxFit.cover,
          )),
        ),
      ),
    );
  }
}
