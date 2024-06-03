import '../features/auth/sign_in/sign_in_page.dart';
import '../features/auth/sign_up/sign_up_page.dart';
import 'router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      name: RouteOf.registerPage,
      path: '/${RouteOf.registerPage}',
      builder: (context, state) => const SignUpPage(),
    ),
  ],
);
