import 'package:SmartTrolleyWebsite/Controller/BenifitsController.dart';
import 'package:SmartTrolleyWebsite/Support/CommonElevatedButton.dart';
import 'package:SmartTrolleyWebsite/Support/CommonTextStyle.dart';
import 'package:SmartTrolleyWebsite/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:get/get.dart';

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
          style: AppTextStyles.customStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Our IO trolley system delivers transformative advantages for both retailers and shoppers.",
          textAlign: TextAlign.center,
          style: AppTextStyles.customStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonElevatedButton(
          text: "For Retailers",
          onPressed: () {},
        ),
        const SizedBox(width: 10),
        CommonElevatedButton(
          text: "For Shoppers",
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildMainContent() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      constraints: const BoxConstraints(maxWidth: 1350),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildLeftContent()),
          Expanded(child: _buildRightImage()),
        ],
      ),
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
            style: AppTextStyles.customStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "IO Trolley technology empowers retailers with actionable data and operational efficiencies that drive revenue growth and customer loyalty.",
            style: AppTextStyles.customStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 30),
          _buildFeatureList(),
          const SizedBox(height: 30),
          const Divider(height: 1),
          const SizedBox(height: 30),
          CommonElevatedButton(
            text: "View Success Stories",
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildRightImage() {
    return Container(
      padding: const EdgeInsets.only(top: 65),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/Images/Advance (1).png',
          fit: BoxFit.cover,
          height: 400,
        ),
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
                style: AppTextStyles.customStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: AppTextStyles.customStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
