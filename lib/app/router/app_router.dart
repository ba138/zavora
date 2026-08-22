import 'package:go_router/go_router.dart';
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

    // GoRoute(
    //   path: '/login',
    //   name: 'login',
    //   builder: (context, state) {
    //     return const LoginScreen();
    //   },
    // ),

    // GoRoute(
    //   path: '/home',
    //   name: 'home',
    //   builder: (context, state) {
    //     return const HomeScreen();
    //   },
    // ),
  ],
);
