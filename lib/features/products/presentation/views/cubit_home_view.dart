import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managemnet_di_newtorking_task/core/services/service_locator.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/cubit/product_cubit.dart';
import '../../data/repos/product_repo.dart';
import '../widget/products_list_view_bloc_builder.dart';

class CubitHomeView extends StatelessWidget {
  const CubitHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(getIt.get<ProductRepo>())..getProducts(),
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ProductsListViewBlocBuilder(),
        ),
      ),
    );
  }
}
