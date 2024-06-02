import 'package:flutter/material.dart';

import 'router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Scaffold(),
    ),
  ],
);
