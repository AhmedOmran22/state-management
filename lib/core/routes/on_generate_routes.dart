import 'package:flutter/material.dart';
import 'package:state_managemnet_di_newtorking_task/core/routes/app_routes.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/views/cubit_home_view.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/views/provider_home_view.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/views/riverpod_home_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.cubitHome:
      return MaterialPageRoute(builder: (_) => const CubitHomeView());
    case AppRoutes.providerHome:
      return MaterialPageRoute(builder: (_) => const ProviderHomeView());
    case AppRoutes.riverpodHome:
      return MaterialPageRoute(builder: (_) => const RiverpodHomeView());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text("No route defined for ${settings.name}")),
        ),
      );
  }
}
