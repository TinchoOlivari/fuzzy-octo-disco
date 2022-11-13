import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neural_trainer_onboarding/dots_indicator/src/effects/slide_effect.dart';
import 'package:neural_trainer_onboarding/dots_indicator/src/smooth_page_indicator.dart';
import 'package:neural_trainer_onboarding/utils/theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  late List<Widget> pages;
  int currentIndex = 0;

  Image image1 = Image.asset('assets/images/1.jpg',
      fit: BoxFit.cover, gaplessPlayback: true);
  Image image2 = Image.asset('assets/images/2.jpg',
      fit: BoxFit.cover, gaplessPlayback: true);
  Image image3 = Image.asset('assets/images/3.jpg',
      fit: BoxFit.cover, gaplessPlayback: true);
  Image image4 = Image.asset('assets/images/4.jpg',
      fit: BoxFit.cover, gaplessPlayback: true);

  @override
  void initState() {
    pages = [
      FirstPageContent(image: image1),
      PageContent(
        title: 'CONECTA',
        paragraph:
            'Conecta tus neuro sensores a la aplicación Neural Trainer y comienza a aumentar tu rendimiento cognitivo.',
        image: image2,
      ),
      PageContent(
        title: 'ENTRENA',
        paragraph:
            'Selecciona una actividad creada por el equipo de Neural Trainer o crea tu propio entrenamiento específico.',
        image: image3,
      ),
      PageContent(
        title: 'ANALIZA',
        paragraph:
            'Monitorea el desempeño de tus atletas, registra sus resultados y compártelos en tiempo real.',
        image: image4,
      )
    ];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    precacheImage(image3.image, context);
    precacheImage(image4.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: pages,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 48),
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: SlideEffect(
                        activeDotColor: AppTheme.black,
                        activeDotBorderColor: AppTheme.primaryColor,
                        activeDotBorderWidth: 1,
                        dotColor: AppTheme.grey,
                        dotHeight: 8,
                        dotWidth: 8,
                        radius: 2,
                        spacing: 14,
                      ),
                      onDotClicked: (index) {},
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: AppTheme.black,
                        surfaceTintColor: AppTheme.white,
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        elevation: 0,
                        minimumSize: Size(500, 50)),
                    onPressed: () {},
                    child: const Text('INICIAR SESIÓN'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PageContent extends StatelessWidget {
  final String title;
  final String paragraph;
  final Image image;

  const PageContent({
    required this.title,
    required this.paragraph,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image.image,
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Color.fromARGB(167, 0, 0, 0),
              Colors.transparent
            ],
            stops: [0.3, 0.4, 0.5],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 220),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '#MOVEYOURMIND',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppTheme.white,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                    Text(
                      paragraph,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppTheme.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FirstPageContent extends StatelessWidget {
  final Image image;

  const FirstPageContent({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image.image,
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SvgPicture.asset(
                'assets/logos/logo.svg',
                semanticsLabel: 'Acme Logo',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 180),
              child: Column(
                children: [
                  Text(
                    'COMENZÁ A VIVIR TU',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppTheme.white,
                    ),
                  ),
                  Text(
                    'NT EXPERIENCE',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
