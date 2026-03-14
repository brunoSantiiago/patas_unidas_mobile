import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patas_unidas_mobile/presentation/routes/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentPage < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      context.go(AppRoutes.login);
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
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
      body: Stack(
        children: [
          PageView(
            controller: _controller,
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

          if (currentPage > 0)
            Positioned(
              top: 60,
              left: 20,
              child: TextButton(
                onPressed: previousPage,
                child: const Text(
                  "Voltar",
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ),

          if (currentPage < 2)
            Positioned(
              top: 60,
              right: 20,
              child: TextButton(
                onPressed: () => context.go(AppRoutes.login),
                child: const Text(
                  "Pular",
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.blue,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: nextPage,
                      child: Text(currentPage == 2 ? "Começar" : "Próximo"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
