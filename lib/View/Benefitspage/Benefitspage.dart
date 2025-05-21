import 'package:SmartTrolleyWebsite/Controller/BenifitsController.dart';
import 'package:SmartTrolleyWebsite/Support/CommonElevatedButton.dart';
import 'package:SmartTrolleyWebsite/Support/CommonHoverImage.dart';
import 'package:SmartTrolleyWebsite/Support/CommonTextStyle.dart';
import 'package:SmartTrolleyWebsite/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BenefitsPage extends StatelessWidget {
  BenefitsPage({super.key});

  final BenefitsController controller = Get.put(BenefitsController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            _buildHeader(),
            const SizedBox(height: 20),
            _buildButtons(),
            _buildMainContent(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          "Benefits",
          style: GoogleFonts.montserrat(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Our IO trolley system delivers transformative advantages for both retailers and shoppers.",
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.6,
            color: Color(0xFF5A5A5A),
          ),
        ),
      ],
    );
  }
  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            "For Retailers",
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.6,
              color: AppColors.blue,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            "For Shoppers",
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.6,
              color: AppColors.blue,
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildMainContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;

        return Container(
          padding: const EdgeInsets.all(24.0),
          constraints: const BoxConstraints(maxWidth: 1350),
          child: isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRightImage(),
              const SizedBox(height: 20),
              _buildLeftContent(),
            ],
          )
              : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildLeftContent()),
              Expanded(child: _buildRightImage()),
            ],
          ),
        );
      },
    );
  }


  Widget _buildLeftContent() {
    return Container(
      padding: const EdgeInsets.only(right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Transform Your Retail Operation",
            style: GoogleFonts.montserrat(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "IO Trolley technology empowers retailers with actionable data and operational efficiencies that drive revenue growth and customer loyalty.",
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.6,
              color: Color(0xFF5A5A5A),
            ),
          ),
          const SizedBox(height: 30),
          _buildFeatureList(),
          const SizedBox(height: 30),
          const Divider(height: 1),
          const SizedBox(height: 30),
          // CommonElevatedButton(
          //   text: "View Success Stories",
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }
  Widget _buildRightImage() {
    return Container(
      padding: const EdgeInsets.only(top: 65),
      child: HoverImage(
        url: 'assets/Images/action4.jpg',
      ),
    );
  }




  Widget _buildFeatureList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFeatureTile(Icons.trending_up, 'Increased Revenue', 'Average basket size increases 15–25% due to personalized recommendations and frictionless shopping.'),
        const SizedBox(height: 24),
        _buildFeatureTile(Icons.security, 'Reduced Shrinkage', 'Advanced anti-theft features reduce inventory loss by up to 85%, directly improving your bottom line.'),
        const SizedBox(height: 24),
        _buildFeatureTile(Icons.auto_graph, 'Operational Efficiency', 'Reduce staffing costs by 30% with automated checkout and redeployment to customer service roles.'),
        const SizedBox(height: 24),
        _buildFeatureTile(Icons.insights, 'Customer Insights', 'Gain unprecedented visibility into shopping patterns, product affinity, and real-time store analytics.'),
      ],
    );
  }

  Widget _buildFeatureTile(IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blue, size: 32),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.6,
                  color: Color(0xFF5A5A5A),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
