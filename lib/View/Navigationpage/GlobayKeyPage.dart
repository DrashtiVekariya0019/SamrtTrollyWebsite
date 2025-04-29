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
      appBar: MediaQuery.of(context).size.width < 600
          ? AppBar(
              title: const Text('Smart Trolley'), // Or use your logo here
              elevation: 0,
            )
          : null,
      drawer: MediaQuery.of(context).size.width < 600
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue, // Use your brand color
                    ),
                    child: Text(
                      'Smart Trolley',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Home'),
                    onTap: () {
                      scrollToSection(homepageKey);
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    title: const Text('Features'),
                    onTap: () {
                      scrollToSection(featuresKey);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('How It Works'),
                    onTap: () {
                      scrollToSection(howItWorkKey);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Benefits'),
                    onTap: () {
                      scrollToSection(benefitsKey);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Contact'),
                    onTap: () {
                      scrollToSection(contactKey);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      body: Column(
        children: [
          // Only show DesktopNavbar when screen width is >= 600
          if (MediaQuery.of(context).size.width >= 600)
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
                  Container(
                    key: homepageKey,
                    child: Homepage(
                      onSeeHowItWorks: () => scrollToSection(howItWorkKey),
                      onExploreFeatures: () => scrollToSection(featuresKey),
                    ),
                  ),
                  Container(
                    key: featuresKey,
                    child: FeaturesPage(
                      onRequestDemoTap: () => scrollToSection(contactKey),
                    ),
                  ),
                  Container(
                    key: howItWorkKey,
                    child: HowItWorkPage(
                        onRequestDemoTap: () => scrollToSection(contactKey)),
                  ),
                  Container(key: benefitsKey, child: BenefitsPage()),
                  Container(key: contactKey, child: ContactPage()),
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
