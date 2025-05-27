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

class FeatureItems {
  final String title;
  final String description;
  final String imagePath; // Change from IconData to String

  FeatureItems({
    required this.title,
    required this.description,
    required this.imagePath,
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
      title: "Customer Mobile Integration",
      icon: Icons.security_rounded,
      description:
      "Syncs seamlessly with shoppers' smartphones for loyalty rewards, promotions, and payment.",
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
      "Built-in wayfinding helps shoppers locate products efficiently throughout the    store with optimal route guidance.",
    ),
  ];

  final featuress = <FeatureItems>[
    FeatureItems(
      title: "All-in-oneSolution",
      imagePath: 'assets/Images/whyTrolly1.jpg',
      description: "All-in-one From hardware to software, we offer a complete solution that fully meets your specific requirements.",
    ),
    FeatureItems(
      title: "Technology-driven Innovation",
      imagePath: 'assets/Images/WhyTrolly2.jpg',
      description: "Leveraging artificial intelligence and machine learning to optimize shopping experiences.",
    ),
    FeatureItems(
      title: "Boost Revenue and     Loyalty",
      imagePath: 'assets/Images/whytrolly3.jpg',
      description: "Engage customers with personalized offers and faster checkouts.",
    ),
    FeatureItems(
      title: " Enhanced Customer Experience",
      imagePath: 'assets/Images/whytrolly4.jpg',
      description: "Deliver a frictionless, intuitive shopping journey.",
    ),
    FeatureItems(
      title: "Operational Efficiency",
      imagePath: 'assets/Images/whytrolly5.jpg',
      description: "Reduce cashier needs, optimize stock management, and cut costs.",
    ),
    FeatureItems(
      title: "Future-Ready Retail",
      imagePath: 'assets/Images/whytrolly6.jpg',
      description: "Position your store at the forefront of retail        innovation.",
    ),
  ];

}
