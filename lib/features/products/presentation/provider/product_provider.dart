import 'package:flutter/foundation.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/data/models/product_model.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/data/repos/product_repo.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/ui_state/product_state.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepo productRepo;

  ProductState _state = const ProductState();
  ProductState get state => _state;

  ProductProvider(this.productRepo);

  Future<void> getProducts() async {
    _state = _state.copyWith(productsState: ProductsState.loading);
    notifyListeners();

    final result = await productRepo.getAllProducts();

    result.fold(
      (failure) {
        _state = _state.copyWith(
          errMessage: failure.errMessage,
          productsState: ProductsState.failure,
        );
        notifyListeners();
      },
      (products) {
        _state = _state.copyWith(
          products: products,
          productsState: ProductsState.success,
        );
        notifyListeners();
      },
    );
  }

  void toggleFavorite(String productId) async {
    final updatedProducts = List<ProductModel>.from(_state.products ?? []);
    final index = updatedProducts.indexWhere((p) => p.id == productId);

    if (index == -1) return;
    final oldValue = updatedProducts[index].isFavorite;
    updatedProducts[index].isFavorite = !oldValue;
    _state = _state.copyWith(products: updatedProducts);
    notifyListeners();

    final result = await productRepo.toggleFavorite(productId);

    result.fold((failure) {
      updatedProducts[index].isFavorite = oldValue;
      _state = _state.copyWith(products: updatedProducts);
      notifyListeners();
    }, (_) {});
  }
}
