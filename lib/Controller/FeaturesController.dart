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
      "Synchronizes with store inventory systems to provide accurate stock levels and product\n availability.",
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
      "Advanced security features \nprevent unauthorized removal of items and\n reduce shrinkage by up to\n 85%.",
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
      "Built-in wayfinding helps shoppers locate products efficiently throughout the store \nwith optimal route \nguidance.",
    ),
  ];

  final featuress = <FeatureItems>[
    FeatureItems(
      title: "All-in-oneSolution",
      imagePath: 'assets/Images/whyTrolly1.jpg',
      description: "All-in-one From hardware to software, we offer a complete solution that fully\n meets your specific \nrequirements.",
    ),
    FeatureItems(
      title: "Technology-driven Innovation",
      imagePath: 'assets/Images/WhyTrolly2.jpg',
      description: "Leveraging artificial intelligence and machine learning to optimize shopping experiences.",
    ),
    FeatureItems(
      title: "Advanced Data Analytics",
      imagePath: 'assets/Images/whytrolly3.jpg',
      description: "Advanced analytics and reporting capabilities for better decision-making and insights.",
    ),
    FeatureItems(
      title: "Scalable Deployment",
      imagePath: 'assets/Images/whytrolly4.jpg',
      description: "Iotrolley is designed to be easily and rapidly deployed across multiple stores, making it the perfect fit for retail chains.",
    ),
    FeatureItems(
      title: "Global Customer Support",
      imagePath: 'assets/Images/whytrolly5.jpg',
      description: "With offices and partners around the world, Iotrolley is well-equipped to provide comprehensive support and solutions to clients worldwide.",
    ),
    FeatureItems(
      title: "  Customizable\n UI Design",
      imagePath: 'assets/Images/whytrolly6.jpg',
      description: "Flexible UI design options to\n match the branding\n and aesthetics \nof any retailer.",
    ),
  ];

}

