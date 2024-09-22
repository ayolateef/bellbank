import 'package:bell/feature/auth/onboarding/onboarding.dart';
import 'package:flutter/cupertino.dart';

import '../../feature/auth/login/login.dart';
import '../../feature/auth/route/routes.dart';
import '../../feature/auth/splash_screen.dart';
import 'animations/fade_route.dart';

var routes = (RouteSettings settings) {
  switch (settings.name) {
    case AuthRoutes.initial:
      return FadeRoute(
        page: const SplashScreen(),
      );

    case AuthRoutes.onboarding:
      return FadeRoute(
        page: const OnboardingPage(),
      );

    case AuthRoutes.login:
      return FadeRoute(
        page: const LoginPage(),
      );
  }
};