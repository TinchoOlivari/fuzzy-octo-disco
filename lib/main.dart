import 'package:flutter/material.dart';
import 'package:neural_trainer_onboarding/screens/onboarding/onboarding.dart';
import 'package:neural_trainer_onboarding/utils/scroll_behaviour.dart';
import 'package:neural_trainer_onboarding/utils/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neural trainer',
      theme: AppTheme.theme,
      scrollBehavior: const CustomScrollBehavior(),
      home: const OnboardingScreen(),
    );
  }
}
