import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/riverpod/product_notifier.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/widget/riverpod_products_view.dart';

class RiverpodHomeView extends ConsumerStatefulWidget {
  const RiverpodHomeView({super.key});

  @override
  ConsumerState<RiverpodHomeView> createState() => _RiverpodHomeViewState();
}

class _RiverpodHomeViewState extends ConsumerState<RiverpodHomeView> {
  @override
  void initState() {
    super.initState();
    // Trigger initial fetch
    Future.microtask(() => ref.read(productProvider.notifier).getProducts());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: RiverpodProductsView(),
      ),
    );
  }
}
