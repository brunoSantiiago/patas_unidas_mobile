import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3B82F6),
          primary: const Color(0xFF3B82F6),
        ),

        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}
