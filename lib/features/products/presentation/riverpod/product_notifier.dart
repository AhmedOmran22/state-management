import 'package:riverpod/legacy.dart';
import 'package:state_managemnet_di_newtorking_task/core/services/service_locator.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/data/models/product_model.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/data/repos/product_repo.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/ui_state/product_state.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final ProductRepo productRepo;

  ProductNotifier(this.productRepo) : super(const ProductState());

  Future<void> getProducts() async {
    state = state.copyWith(productsState: ProductsState.loading);

    final result = await productRepo.getAllProducts();

    result.fold(
      (failure) => state = state.copyWith(
        errMessage: failure.errMessage,
        productsState: ProductsState.failure,
      ),
      (products) => state = state.copyWith(
        products: products,
        productsState: ProductsState.success,
      ),
    );
  }

  void toggleFavorite(String productId) async {
    final updatedProducts = List<ProductModel>.from(state.products ?? []);
    final index = updatedProducts.indexWhere((p) => p.id == productId);

    if (index == -1) return;
    final oldValue = updatedProducts[index].isFavorite;
    updatedProducts[index].isFavorite = !oldValue;
    state = state.copyWith(products: updatedProducts);

    final result = await productRepo.toggleFavorite(productId);

    result.fold((failure) {
      updatedProducts[index].isFavorite = oldValue;
      state = state.copyWith(products: updatedProducts);
    }, (_) {});
  }
}

final productProvider =
    StateNotifierProvider<ProductNotifier, ProductState>((ref) {
  return ProductNotifier(getIt.get<ProductRepo>())..getProducts();
});
// 