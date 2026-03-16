import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final Widget? favoriteWidget;

  const ProductItem({super.key, required this.product, this.favoriteWidget});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final discountedPrice =
        product.price! * (1 - (product.discountPercentage! / 100));

    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          shadowColor: Colors.black26,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: product.coverPictureUrl!,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.image, size: 48)),
                  ),

                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[200],
                    child: const Icon(
                      Icons.broken_image,
                      size: 48,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              // Info Section
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name!,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber[600], size: 18),
                        const SizedBox(width: 4),
                        Text(
                          product.rating!.toStringAsFixed(1),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '(${product.reviewsCount} reviews)',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '\$${discountedPrice.toStringAsFixed(2)}',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (product.discountPercentage! > 0)
                          Text(
                            '\$${product.price!.toStringAsFixed(2)}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        const Spacer(),
                        Text(
                          '${product.discountPercentage!.toStringAsFixed(0)}% OFF',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                    Text(
                      'In stock: ${product.stock!}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: product.stock! > 0 ? Colors.white : Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // ? blocBuilder <PriductsCubit, ProductState>
                    // favourite Widget
                    // ? buildWhen state chainge from fav to not fav
                  ],
                ),
              ),
            ],
          ),
        ),
        favoriteWidget ?? const SizedBox(),
      ],
    );
  }
}
