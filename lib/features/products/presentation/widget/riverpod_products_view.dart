import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/data/models/product_model.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/ui_state/product_state.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/riverpod/product_notifier.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/widget/riverpod_favorite_icon.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/widget/product_item_widget.dart';

class RiverpodProductsView extends ConsumerWidget {
  const RiverpodProductsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productProvider);

    switch (state.productsState) {
      case ProductsState.loading:
        return Skeletonizer(
          enabled: true,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return ProductItem(product: ProductModel.fakeProduct);
            },
          ),
        );
      case ProductsState.failure:
        return Center(
          child: Text(state.errMessage ?? 'Something went wrong'),
        );
      case ProductsState.success:
        if (state.products == null || state.products!.isEmpty) {
          return const Center(child: Text('No products found'));
        }
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: state.products!.length,
          itemBuilder: (context, index) {
            final product = state.products![index];
            return ProductItem(
              product: product,
              favoriteWidget: RiverpodFavoriteIcon(productId: product.id ?? ""),
            );
          },
        );
    }
  }
}
