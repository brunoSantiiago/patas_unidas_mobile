import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patas_unidas_mobile/presentation/routes/app_routes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  void nextPage() {
    if (currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      context.go(AppRoutes.login);
    }
  }

  Widget buildPage({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 120),

          const SizedBox(height: 40),

          Text(
            title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          Text(
            description,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        children: [
          buildPage(
            title: "Bem-vindo ao Patas Unidas",
            description: "Conectamos pessoas que querem ajudar animais",
            icon: Icons.pets,
          ),

          buildPage(
            title: "Adote ou Ajude",
            description: "Encontre pets para adoção ou contribua com ONGs",
            icon: Icons.favorite,
          ),

          buildPage(
            title: "Faça parte da comunidade",
            description: "Juntos podemos salvar mais vidas",
            icon: Icons.groups,
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30),
        child: ElevatedButton(
          onPressed: nextPage,
          child: Text(currentPage == 2 ? "Começar" : "Próximo"),
        ),
      ),
    );
  }
}
