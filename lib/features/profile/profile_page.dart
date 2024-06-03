import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/services/shared_pref_services.dart';
import '../layout/app_root.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await SharedPrefServices.removeToken();
            ref.invalidate(userTokenProvider);
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
