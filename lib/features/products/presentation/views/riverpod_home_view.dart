import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/widget/riverpod_products_view.dart';

class RiverpodHomeView extends ConsumerWidget {
  const RiverpodHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: RiverpodProductsView(),
      ),
    );
  }
}