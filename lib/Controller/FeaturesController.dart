import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeatureItem {
  final String title;
  final String description;
  final IconData icon;

  FeatureItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class FeaturesController extends GetxController {
  final features = <FeatureItem>[
    FeatureItem(
      title: "Self-Scanning Technology",
      icon: Icons.qr_code_scanner_rounded,
      description:
      "Built-in scanners automatically detect and register items as they're placed in the trolley, eliminating checkout lines.",
    ),
    FeatureItem(
      title: "Real-Time Inventory",
      icon: Icons.bar_chart_rounded,
      description:
      "Synchronizes with store inventory systems to provide accurate stock levels and product availability.",
    ),
    FeatureItem(
      title: "Integrated Payment",
      icon: Icons.payment_rounded,
      description:
      "Secure payment processing directly from the trolley with multiple payment options and digital receipts.",
    ),
    FeatureItem(
      title: "Anti-Theft Protection",
      icon: Icons.security_rounded,
      description:
      "Advanced security features prevent unauthorized removal of items and reduce shrinkage by up to 85%.",
    ),
    FeatureItem(
      title: "Personalized Recommendations",
      icon: Icons.person_pin_rounded,
      description:
      "AI-powered system suggests products based on shopping history and preferences, increasing basket size.",
    ),
    FeatureItem(
      title: "Indoor Navigation",
      icon: Icons.map_rounded,
      description:
      "Built-in wayfinding helps shoppers locate products efficiently throughout the store with optimal route guidance.",
    ),
  ];
}
