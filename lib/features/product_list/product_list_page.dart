import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:persistent_header_adaptive/persistent_header_adaptive.dart';

import '../../common/not_implemented.dart';
import '../../core/ui_helper/ui_helper.dart';
import 'controller/product_list_controller.dart';
import 'widgets/filter_bar.dart';
import 'widgets/product_card_shimmer.dart';
import 'widgets/product_item_card.dart';

final sortIDProvider = StateProvider<int>((ref) {
  return 0;
});

class ProductListPage extends HookConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilter = ref.watch(sortIDProvider);
    final productList = ref.watch(allProductListProvider(selectedFilter));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product List',
          style: context.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showNotImplementedSnackbar(context);
            },
            icon: const Icon(EvaIcons.search),
          )
        ],
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // Filter Header
            const AdaptiveHeightSliverPersistentHeader(
              floating: true,
              child: FilterBar(),
            ),
          ];
        },
        body: productList.when(
          data: (res) {
            return res.fold((l) {
              return Center(
                child: Text('Error: ${l.toString()}'),
              );
            }, (product) {
              return AlignedGridView.count(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                itemCount: product.length,
                itemBuilder: (context, index) {
                  final item = product[index];
                  return ProductItemCard(item: item);
                },
              );
            });
          },
          loading: () {
            return AlignedGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ProductCardShimmer();
              },
            );
          },
          error: (error, stack) => Center(
            child: Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}
