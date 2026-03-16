import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managemnet_di_newtorking_task/core/services/service_locator.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/data/repos/product_repo.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/provider/product_provider.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/widget/provider_products_view.dart';

class ProviderHomeView extends StatelessWidget {
  const ProviderHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(getIt.get<ProductRepo>())..getProducts(),
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ProviderProductsView(),
        ),
      ),
    );
  }
}
