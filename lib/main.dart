import 'package:flutter/material.dart';
import 'package:patas_unidas_mobile/presentation/routes/app_routes.dart';

void main() {
  runApp(const PatasUnidasApp());
}

class PatasUnidasApp extends StatelessWidget {
  const PatasUnidasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
