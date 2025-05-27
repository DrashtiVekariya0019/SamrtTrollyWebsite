
import 'package:AivoCartsWebsite/Support/CommonElevatedButton.dart';
import 'package:AivoCartsWebsite/Support/CommonHoverImage.dart';
import 'package:AivoCartsWebsite/Support/CommonTextStyle.dart';
import 'package:AivoCartsWebsite/Utils/AppColors.dart';
import 'package:animate_do/animate_do.dart';
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
            isMobile ? buildMobileLayout(context) : buildDesktopLayout(context),
            const SizedBox(height: 60),
            FadeInUp(child: buildTrolleyImageSlider()), // ✅ Animation added
          ],
        ),
      ),
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FadeInDown( // ✅ Animated heading
          duration: Duration(milliseconds: 800),
          child: Center(
            child: Text(
              'Welcome to the Future of Smart Shopping',
              style: GoogleFonts.montserrat(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: FadeInLeft( // ✅ Animated text section
                duration: Duration(milliseconds: 800),
                child: buildTextContentSection(context),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 5,
              child: FadeInRight( // ✅ Animated image section
                duration: Duration(milliseconds: 800),
                child: buildImageSection(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        FadeInUp(child: buildImageSection()), // ✅ Animation
        const SizedBox(height: 30),
        FadeInUp(delay: Duration(milliseconds: 200), child: buildTextContentSection(context)),
      ],
    );
  }

  Widget buildTextContentSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Revolutionizing Retail with Intelligent Cart Technology',
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'At AivoCarts, we are transforming the way people shop. Powered by cutting-edge artificial intelligence, computer vision, and seamless integration technology, our smart carts turn every shopping trip into a personalized, checkout-free experience. Say goodbye to long lines and hello to effortless, enjoyable retail.',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.6,
            color: const Color(0xFF5A5A5A),
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
        BounceInLeft(
          child: CommonElevatedButton(
            text: "See How It Works",
            onPressed: onSeeHowItWorks,
          ),
        ),
        const SizedBox(height: 10),
        BounceInRight(
          child: CommonElevatedButton(
            text: "Explore Features",
            onPressed: onExploreFeatures,
          ),
        ),
      ],
    )
        : Row(
      children: [
        BounceInLeft(
          child: CommonElevatedButton(
            text: "See How It Works",
            onPressed: onSeeHowItWorks,
          ),
        ),
        const SizedBox(width: 10),
        BounceInRight(
          child: CommonElevatedButton(
            text: "Explore Features",
            onPressed: onExploreFeatures,
          ),
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
            url: 'assets/Images/payandgo.png',
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
        height: 400,
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
              child: Image.asset(
                path,
                width: 800,
                fit: BoxFit.fill,
              ),
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
    return FadeInUp(
      duration: Duration(milliseconds: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blue),
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
      ),
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