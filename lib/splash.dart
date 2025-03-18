import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/onboarding.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.img.background.splash.image(fit: BoxFit.cover),
          ),
          Center(child: Assets.img.icons.logo.svg(width: 130)),
        ],
      ),
      // body: Stack(children: [Image.asset('assets/img/background/splash.png')]),
    );
  }
}
