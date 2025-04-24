import 'package:SmartTrolleyWebsite/Controller/FeaturesController.dart';
import 'package:SmartTrolleyWebsite/Support/CommonElevatedButton.dart';
import 'package:SmartTrolleyWebsite/Support/CommonTextStyle.dart';
import 'package:SmartTrolleyWebsite/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FeaturesPage extends StatelessWidget {
  FeaturesPage({super.key});
  final FeaturesController controller = Get.put(FeaturesController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
             Text(
              "Features",
              style: AppTextStyles.customStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Our IO trolley system combines cutting-edge technology with intuitive design to transform the retail experience.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children:
                  controller.features
                      .map(
                        (feature) => SizedBox(
                          width: 420,
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.blue.shade50,
                                    child: Icon(
                                      feature.icon,
                                      color: AppColors.blue,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    feature.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    feature.description,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 12),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text("Learn More"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(24.0),
              constraints: const BoxConstraints(maxWidth: 1350),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side - All text content
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Advanced Analytics Dashboard",
                            style: AppTextStyles.customStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Our comprehensive analytics platform provides retailers with actionable insights into customer behavior, inventory management, and sales performance.",
                            style: AppTextStyles.customStyle(
                              fontSize: 16,
                              color: AppColors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 30),
                          _buildFeatureList(),
                          const SizedBox(height: 30),
                          Divider(height: 1, color: AppColors.black),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: 200,
                            child:  CommonElevatedButton(
                              text: "See Analytics Demo",
                              onPressed: () {
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Right side - Image
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/Images/Advance (1).png',
                        fit: BoxFit.cover,
                        height: 400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
              style: AppTextStyles.customStyle(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
