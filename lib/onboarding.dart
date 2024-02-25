// ignore_for_file: use_key_in_widget_constructors, unused_import

import 'package:crypto/main.dart';
import 'package:crypto/ui/screen/detail_wallet.dart';
import 'package:crypto/ui/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const OnboardingScreen(), // Show OnboardingScreen initially
      theme: ThemeData(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Introduction> list = [
      Introduction(
        imageHeight: 250,
        imageWidth: 250,
        titleTextStyle: const TextStyle(color: Colors.grey, fontSize: 30),
        title: "MORSEL",
        imageUrl: "assets/images/3.png",
        subTitle: 'Develop By Afaq Ahmad',
      ),
      Introduction(
          imageHeight: 250,
        imageWidth: 250,
        title: "Heading 2",
        imageUrl: "assets/images/1.png",
        subTitle: 'Pargraph 2',
      ),
      Introduction(
          imageHeight: 250,
        imageWidth: 250,
        title: "Heading 3",
        imageUrl: "assets/images/2.png",
        subTitle: 'Paragraph 3',
      )
    ];

    return IntroScreenOnboarding(
      backgroudColor: Colors.white,
      foregroundColor: Colors.orange,
      onTapSkipButton: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainApp()),
      ),
      introductionList: list,
      skipTextStyle: const TextStyle(fontSize: 20, color: Colors.orange),
    );
  }
}
