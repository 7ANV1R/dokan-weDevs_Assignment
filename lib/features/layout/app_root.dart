import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/services/shared_pref_services.dart';
import '../auth/sign_in/sign_in_page.dart';
import 'home_layout.dart';

final userTokenProvider = StateProvider<String?>((ref) {
  final token = SharedPrefServices.getToken();
  return token;
});

class AppRoot extends ConsumerWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(userTokenProvider);
    return Scaffold(
      body: token != null ? const HomeLayoutPage() : const SignInPage(),
    );
  }
}
