import 'dart:convert';

import '../../core/api_helper/future_either.dart';
import '../iapi/i_product_api.dart';
import '../model/product/product_model.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productAPIProvider = Provider<ProductAPI>((ref) {
  return ProductAPI();
});

final class ProductAPI implements IProductAPI {
  @override
  FutureEither<List<Product>> fetchAllProduct({required String filterID}) async {
    try {
      // load data from asset json file with filter
      await Future.delayed(const Duration(seconds: 3));
      final String response = await rootBundle.loadString('assets/json/response.json');
      final decodedResponse = jsonDecode(response);
      final List<Product> products = (decodedResponse as List).map((e) => Product.fromJson(e)).toList();

      switch (filterID) {
        case '0':
          // newest
          products.sort((a, b) => b.dateCreatedGmt.compareTo(a.dateCreatedGmt));
          break;
        case '1':
          products.sort((a, b) => a.dateCreatedGmt.compareTo(b.dateCreatedGmt));
          break;

        case "2":
          // price Low > High
          products.sort((a, b) => double.parse(a.price).compareTo(double.parse(b.price)));
          break;

        case "3":
          // price High > Low
          products.sort((a, b) => double.parse(b.price).compareTo(double.parse(a.price)));
          break;
        default:
          products.sort((a, b) => b.dateCreatedGmt.compareTo(a.dateCreatedGmt));
          break;
      }
      return right(products);
    } catch (e, st) {
      return returnFailure(
        methodName: "[ProductAPI][fetchAllProduct]",
        e: e,
        st: st,
      );
    }
  }
}
