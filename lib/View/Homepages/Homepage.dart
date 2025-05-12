import 'package:SmartTrolleyWebsite/Support/CommonElevatedButton.dart';
import 'package:SmartTrolleyWebsite/Support/CommonHoverImage.dart';
import 'package:SmartTrolleyWebsite/Support/CommonTextStyle.dart';
import 'package:SmartTrolleyWebsite/Utils/AppColors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  final VoidCallback onSeeHowItWorks;
  final VoidCallback onExploreFeatures;

  const Homepage({
    super.key,
    required this.onSeeHowItWorks,
    required this.onExploreFeatures,
  });

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
            const SizedBox(height: 60),
            isMobile ? buildMobileLayout(context) : buildDesktopLayout(context),
            const SizedBox(height: 60),
            buildTrolleyImageSlider(),

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
          style: GoogleFonts.montserrat(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Transform your retail experience with AI-powered trolleys that eliminate checkout lines, track purchases, and personalize shopping journeys.',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.6,
            color: Color(0xFF5A5A5A),
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
          onPressed: onSeeHowItWorks,
        ),
        const SizedBox(height: 10),
        CommonElevatedButton(
          text: "Explore Features",
          onPressed: onExploreFeatures,
        ),
      ],
    )
        : Row(
      children: [
        CommonElevatedButton(
          text: "See How It Works",
          onPressed: onSeeHowItWorks,
        ),
        const SizedBox(width: 10),
        CommonElevatedButton(
          text: "Explore Features",
          onPressed: onExploreFeatures,
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
          child: HoverImage(
            url:  'assets/Images/payandgo.png',
            // fit: BoxFit.contain,
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
  Widget buildTrolleyImage(String path, {double width = 400, double height = 260}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: HoverImage(
        url:   path,
        // width: width,
        height: height,
        // fit: BoxFit.cover,
      ),
    );
  }
  Widget buildTrolleyImageSlider() {
    final List<String> imagePaths = [
      'assets/Images/TrollyAction1.jpg',
      'assets/Images/action2.jpg',
      'assets/Images/action3.jpg',
      'assets/Images/action4.jpg',
      'assets/Images/action5.jpg',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 400, // 🔼 Increased height
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.6,
        aspectRatio: 16 / 9,
        autoPlayInterval: Duration(seconds: 3),
      ),
      items: imagePaths.map((path) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              // borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  path,
                  width: 800,  // 🔼 Added width
                  fit: BoxFit.fill, // 🔼 Make image cover full area
                )
            );
          },
        );
      }).toList(),
    );
  }


}

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
          style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.blue),
        ),
        Text(
          subtitle,
          style: GoogleFonts.montserrat(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
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