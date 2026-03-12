import 'package:go_router/go_router.dart';
import 'package:patas_unidas_mobile/presentation/pages/login_page.dart';
import 'package:patas_unidas_mobile/presentation/pages/onboarding_page.dart';

class AppRoutes {
  static const onboarding = '/';
  static const login = '/login';

  static final router = GoRouter(
    initialLocation: onboarding,
    routes: [
      GoRoute(
        path: onboarding,
        name: 'onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}
