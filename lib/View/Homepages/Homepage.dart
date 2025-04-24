import 'package:SmartTrolleyWebsite/Support/CommonElevatedButton.dart';
import 'package:SmartTrolleyWebsite/Support/CommonTextStyle.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 40,
          vertical: 40,
        ),
        child: Column(
          children: [
            // Main Content Section
            isMobile ? buildMobileLayout(context) : buildDesktopLayout(context),
            const SizedBox(height: 60),
            // Trusted By Section
            Text(
              "TRUSTED BY LEADING RETAILERS",
              style: AppTextStyles.customStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 30),
            buildRetailerLogos(isMobile),
          ],
        ),
      ),
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: buildTextContentSection(context),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 5,
          child: buildImageSection(),
        ),
      ],
    );
  }

  Widget buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        buildImageSection(),
        const SizedBox(height: 30),
        buildTextContentSection(context),
      ],
    );
  }

  Widget buildTextContentSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Revolutionize Shopping With IO Trolley',
          style: AppTextStyles.customStyle(
            fontSize: isMobile ? 32 : 40,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Transform your retail experience with AI-powered trolleys that eliminate checkout lines, track purchases, and personalize shopping journeys.',
          style: AppTextStyles.customStyle(
            fontSize: isMobile ? 14 : 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        buildButtonRow(isMobile),
        const SizedBox(height: 30),
        buildStatsGrid(),
      ],
    );
  }

  Widget buildButtonRow(bool isMobile) {
    return isMobile
        ? Column(
      children: [
        CommonElevatedButton(
          text: "See How It Works",
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        CommonElevatedButton(
          text: "Explore Features",
          onPressed: () {},
        ),
      ],
    )
        : Row(
      children: [
        CommonElevatedButton(
          text: "See How It Works",
          onPressed: () {},
        ),
        const SizedBox(width: 10),
        CommonElevatedButton(
          text: "Explore Features",
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildImageSection() {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/Images/newtechnology.png',
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue[800],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "New Technology\nSmart Retail Solution",
              style: AppTextStyles.customStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildStatsGrid() {
    return Wrap(
      spacing: 40,
      runSpacing: 20,
      alignment: WrapAlignment.start,
      children: [
        const InfoTile(title: "70%", subtitle: "Faster Checkout"),
        const InfoTile(title: "35%", subtitle: "Sales Increase"),
        const InfoTile(title: "90%", subtitle: "Customer Satisfaction"),
      ],
    );
  }

  Widget buildRetailerLogos(bool isMobile) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: isMobile ? 20 : 40,
      runSpacing: isMobile ? 10 : 20,
      children: const [
        RetailerText(name: "RETAILCO"),
        RetailerText(name: "SMARTSHOP"),
        RetailerText(name: "FUTUREMART"),
        RetailerText(name: "TECHSTORE"),
        RetailerText(name: "QUICKBUY"),
      ],
    );
  }
}

// Add these widget definitions at the end of your file
class InfoTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const InfoTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.customStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Text(
          subtitle,
          style: AppTextStyles.customStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.normal
          ),
        ),
      ],
    );
  }
}

class RetailerText extends StatelessWidget {
  final String name;
  const RetailerText({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: AppTextStyles.customStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
        fontSize: 20,
      ),
    );
  }
}