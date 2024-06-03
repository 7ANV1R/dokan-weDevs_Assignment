import '../../core/api_helper/future_either.dart';
import '../model/product/product_model.dart';

abstract class IProductAPI {
  FutureEither<List<Product>> fetchAllProduct({
    required String filterID,
  });
}
