import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/api/profile_api.dart';

final profileDataProvider = FutureProvider.autoDispose((ref) async {
  final api = ref.read(profileAPIProvider);
  return api.fetchProfile();
});
