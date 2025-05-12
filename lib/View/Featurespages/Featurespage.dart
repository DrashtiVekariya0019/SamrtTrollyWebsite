import 'package:SmartTrolleyWebsite/Controller/FeaturesController.dart';
import 'package:SmartTrolleyWebsite/Support/CommonElevatedButton.dart';
import 'package:SmartTrolleyWebsite/Support/CommonHoverImage.dart';
import 'package:SmartTrolleyWebsite/Support/CommonTextStyle.dart';
import 'package:SmartTrolleyWebsite/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturesPage extends StatelessWidget {
  final VoidCallback onRequestDemoTap;

  FeaturesPage({super.key, required this.onRequestDemoTap});
  final FeaturesController controller = Get.put(FeaturesController());



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            "Features",
            style: GoogleFonts.montserrat(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Our IO trolley system combines cutting-edge technology with intuitive design to transform the retail experience.",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.6,
                color: Color(0xFF5A5A5A),
              ),
            ),
          ),
          const SizedBox(height: 60),

          // First row of features (3 features per row)
          _buildFeatureRow(0, context),
          const SizedBox(height: 40),

          // Second row of features
          _buildFeatureRow(3, context),
          const SizedBox(height: 60),

          // Analytics Dashboard Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            constraints: const BoxConstraints(maxWidth: 1350),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Advanced Analytics Dashboard",
                          style: GoogleFonts.montserrat(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Our comprehensive analytics platform provides retailers with actionable insights into customer behavior, inventory management, and sales performance.",
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.6,
                            color: Color(0xFF5A5A5A),
                          ),
                        ),
                        const SizedBox(height: 30),
                        _buildFeatureList(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: HoverImage(
                      url:  'assets/Images/AdvancedAnalyticsDashboard.jpg',

                      height: 400,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Why Trolly Section
          const SizedBox(height: 60),
          Text(
            "Why IoTrolley",
            style: GoogleFonts.montserrat(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 10),

          _buildWhyTrollyRow(0, context),
          const SizedBox(height: 40),


          _buildWhyTrollyRow(3, context),


          const SizedBox(height: 60),
          Center(
            child: SizedBox(
              width: 200,
              child: CommonElevatedButton(
                text: "Request a Demo",
                onPressed: onRequestDemoTap,
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(int startIndex, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth > 1200 ? 350.0 : 300.0;

    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 30,
        runSpacing: 30,
        children: [
          for (int i = startIndex; i < startIndex + 3 && i < controller.features.length; i++)
            _buildFeatureCard(controller.features[i], itemWidth),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(FeatureItem feature, double width) {
    final RxBool isHovered = false.obs;

    return Obx(() => MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: width,
        padding: const EdgeInsets.all(24),
        transform: Matrix4.identity()..scale(isHovered.value ? 1.05 : 1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isHovered.value
                  ? Colors.blue.withOpacity(0.4)
                  : Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  feature.icon,
                  color: AppColors.blue,
                  size: 40,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                feature.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                feature.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.6,
                  color: const Color(0xFF5A5A5A),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }




  Widget _buildFeatureList() {
    return Column(
      children: [
        _buildFeatureItem(
          checked: true,
          text: 'Real-time shopping patterns and heatmaps',
        ),
        _buildFeatureItem(
          checked: true,
          text: 'Product affinity analysis for optimal placement',
        ),
        _buildFeatureItem(
          checked: true,
          text: 'Predictive inventory management',
        ),
        _buildFeatureItem(
          checked: true,
          text: 'Custom reporting with exportable data',
        ),
      ],
    );
  }

  Widget _buildFeatureItem({required bool checked, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.3,
            child: Checkbox(
              value: checked,
              onChanged: null,
              activeColor: Colors.green,
              fillColor: MaterialStateProperty.all(Colors.green),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhyTrollyRow(int startIndex, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth > 1200 ? 350.0 : 300.0;

    final controller = Get.put(FeaturesController()); // Add this if not declared

    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 30,
        runSpacing: 30,
        children: [
          for (int i = startIndex; i < startIndex + 3 && i < controller.featuress.length; i++)
            _buildWhyTrollyCard(controller.featuress[i], itemWidth),
        ],
      ),
    );
  }

  Widget _buildWhyTrollyCard(FeatureItems benefit, double width) {
    final RxBool isHovered = false.obs;

    return Obx(() => MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: width,
        padding: const EdgeInsets.all(24),
        transform: Matrix4.identity()..scale(isHovered.value ? 1.05 : 1), // Scale effect on hover
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isHovered.value
                  ? Colors.blue.withOpacity(0.4)
                  : Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.blue.withOpacity(0.1),// Soft background color inside card
            borderRadius: BorderRadius.circular(16), // Match the card's border radius
          ),
          padding: const EdgeInsets.all(16),  // Add padding inside the background for spacing
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blue.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: ClipOval(
                  child: Image.asset(
                    benefit.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                benefit.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 18, // Slightly bigger font for title
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                benefit.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 14, // Increased font size for better readability
                  fontWeight: FontWeight.w500,
                  height: 1.6,
                  color: const Color(0xFF5A5A5A),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }








}
