import 'package:flutter/material.dart';
import 'core/services/prefs.dart';
import 'core/services/service_locator.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  setupServiceLocator();
  runApp(const MyApp());
}
