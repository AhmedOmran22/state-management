import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/data/models/product_model.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/riverpod/product_notifier.dart';

class RiverpodFavoriteIcon extends ConsumerWidget {
  final String productId;

  const RiverpodFavoriteIcon({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We select only the specific product's isFavorite status to rebuild efficiently
    final isFavorite = ref.watch(
      productProvider.select((state) {
        final product = state.products?.firstWhere(
          (p) => p.id == productId,
          orElse: () => ProductModel.fakeProduct,
        );
        return product?.isFavorite ?? false;
      }),
    );

    return IconButton(
      onPressed: () {
        ref.read(productProvider.notifier).toggleFavorite(productId);
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey,
      ),
    );
  }
}
