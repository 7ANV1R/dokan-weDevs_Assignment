import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/api/profile_api.dart';
import '../../../data/services/shared_pref_services.dart';

final profileDataProvider = FutureProvider.autoDispose((ref) async {
  final api = ref.read(profileAPIProvider);
  final res = SharedPrefServices.getIdAndToken();
  return api.fetchProfile(
    token: res.$2 ?? '',
    id: res.$1 ?? '',
  );
});
