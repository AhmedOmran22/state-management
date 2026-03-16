import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/data/models/product_model.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/provider/product_provider.dart';

class ProviderFavoriteIcon extends StatelessWidget {
  final String productId;

  const ProviderFavoriteIcon({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Selector<ProductProvider, bool>(
      selector: (_, provider) {
        final product = provider.state.products?.firstWhere(
          (p) => p.id == productId,
          orElse: () => ProductModel.fakeProduct,
        );
        return product?.isFavorite ?? false;
      },
      builder: (context, isFavorite, child) {
        return IconButton(
          onPressed: () {
            context.read<ProductProvider>().toggleFavorite(productId);
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
        );
      },
    );
  }
}
