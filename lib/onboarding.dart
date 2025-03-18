import 'package:flutter/material.dart';
import 'package:blog_club/gen/assets.gen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Assets.img.background.onboarding.image()]),
    );
  }
}
