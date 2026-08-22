import 'package:go_router/go_router.dart';
import 'package:zavora/features/auth/screens/login_screen.dart';
import 'package:zavora/features/auth/screens/onboarding1_screen.dart';
import 'package:zavora/features/auth/screens/onboarding2_screen.dart';
import 'package:zavora/features/auth/screens/onboarding3_screen.dart';
import 'package:zavora/features/auth/screens/signin_screen.dart';
import 'package:zavora/features/auth/screens/splash_screen.dart';
import 'package:zavora/features/dashboard/screen/custom_nav_bar.dart';

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
    GoRoute(
      path: '/onboarding2',
      name: 'onboarding2',
      builder: (context, state) {
        return const OnBoarding2Screen();
      },
    ),
    GoRoute(
      path: '/onboarding3',
      name: 'onboarding3',
      builder: (context, state) {
        return const OnBoarding3Screen();
      },
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/signin',
      name: 'signin',
      builder: (context, state) {
        return const SignInScreen();
      },
    ),
    GoRoute(
      path: '/navbar',
      name: 'navbar',
      builder: (context, state) {
        return const CustomBottomNavBar();
      },
    ),
  ],
);
