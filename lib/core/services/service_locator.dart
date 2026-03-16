import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/data/repos/product_repo.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/data/repos/product_repo_impl.dart';

import 'api_service.dart';
import 'dio_consumer.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(DioConsumer(dio: getIt<Dio>()));

  getIt.registerFactory<ProductRepo>(
    () => ProductRepoImpl(apiService: getIt<ApiService>()),
  );
}
