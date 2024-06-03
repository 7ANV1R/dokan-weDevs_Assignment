import '../features/auth/sign_up/sign_up_page.dart';
import '../features/layout/app_root.dart';
import 'router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AppRoot(),
    ),
    GoRoute(
      name: RouteOf.registerPage,
      path: '/${RouteOf.registerPage}',
      builder: (context, state) => const SignUpPage(),
    ),
  ],
);
