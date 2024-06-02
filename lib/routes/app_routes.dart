import 'package:dokan/features/auth/sign_in/sign_in_page.dart';

import 'router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SignInPage(),
    ),
  ],
);
