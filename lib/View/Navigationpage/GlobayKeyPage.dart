import 'package:SmartTrolleyWebsite/Support/Footer.dart';
import 'package:SmartTrolleyWebsite/View/Benefitspage/Benefitspage.dart';
import 'package:SmartTrolleyWebsite/View/ContactPages/ContactPage.dart';
import 'package:SmartTrolleyWebsite/View/Featurespages/Featurespage.dart';
import 'package:SmartTrolleyWebsite/View/Homepages/Homepage.dart';
import 'package:SmartTrolleyWebsite/View/HowItWorkpages/HowItWorkpage.dart';
import 'package:SmartTrolleyWebsite/View/Navigationpage/DesktopNavbar.dart';
import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final homepageKey = GlobalKey();
  final featuresKey = GlobalKey();
  final howItWorkKey = GlobalKey();
  final benefitsKey = GlobalKey();
  final contactKey = GlobalKey();

  final scrollController = ScrollController();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          DesktopNavbar(
            onHomeTap: () => scrollToSection(homepageKey),
            onFeaturesTap: () => scrollToSection(featuresKey),
            onHowItWorksTap: () => scrollToSection(howItWorkKey),
            onBenefitsTap: () => scrollToSection(benefitsKey),
            onContactTap: () => scrollToSection(contactKey),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(key: homepageKey, child: Homepage()),
                  Container(key: featuresKey, child:  FeaturesPage()),
                  Container(key: howItWorkKey, child:  HowItWorkPage()),
                  Container(key: benefitsKey, child:BenefitsPage()),
                  Container(key: contactKey, child:  ContactPage()),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
