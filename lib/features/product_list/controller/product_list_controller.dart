import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/api/product_api.dart';

final allProductListProvider = FutureProvider.family((ref, int filterId) async {
  final api = ref.read(productAPIProvider);
  return api.fetchAllProduct(
    filterID: filterId.toString(),
  );
});
