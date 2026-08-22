import 'package:go_router/go_router.dart';
import 'package:zavora/features/auth/screens/onboarding1_screen.dart';
import 'package:zavora/features/auth/screens/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',

  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/onboarding1',
      name: 'onboarding1',
      builder: (context, state) {
        return const OnBoarding1Screen();
      },
    ),
  ],
);
