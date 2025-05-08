import 'package:SmartTrolleyWebsite/Controller/HowItWorkController.dart';
import 'package:SmartTrolleyWebsite/Support/CommonElevatedButton.dart';
import 'package:SmartTrolleyWebsite/Support/CommonTextStyle.dart';
import 'package:SmartTrolleyWebsite/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HowItWorkPage extends StatelessWidget {
  final VoidCallback onRequestDemoTap;

  HowItWorkPage({super.key, required this.onRequestDemoTap});

  final HowItWorkController controller = Get.put(HowItWorkController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              "How It Works",
              style: AppTextStyles.customStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Our innovative IO trolley system streamlines the shopping experience from start to finish. Here's how it works.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),

            /// Steps List
            ...List.generate(controller.steps.length, (index) {
              final step = controller.steps[index];
              final isEven = index % 2 == 0;

              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: isEven
                          ? [
                              Flexible(
                                  flex: 1,
                                  child: stepText(context, index, step)),
                              const SizedBox(width: 20),
                              Flexible(flex: 1, child: stepImage(step["img"]!)),
                            ]
                          : [
                              Flexible(flex: 1, child: stepImage(step["img"]!)),
                              const SizedBox(width: 20),
                              Flexible(
                                  flex: 1,
                                  child: stepText(context, index, step)),
                            ],
                    );
                  },
                ),
              );
            }),

            const SizedBox(height: 40),
            Text(
              "Ready to revolutionize your shopping experience?",
              style: AppTextStyles.customStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonElevatedButton(
                  text: "Request a Demo",
                  onPressed: onRequestDemoTap,
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget stepText(BuildContext context, int index, Map step) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.blue,
          child: Text(
            "${index + 1}",
            style: AppTextStyles.customStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          step["title"],
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          step["desc"],
          style: AppTextStyles.customStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Scan & Login Details",
                          style: AppTextStyles.customStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          )),
                      const SizedBox(height: 12),
                      ...[
                        "The login process is designed to be quick and seamless, taking less than 5 seconds to complete.",
                        "Shoppers can:",
                        "Scan the QR code on their store app",
                        "Tap their loyalty card on the NFC reader",
                        "Enter their phone number on the touchscreen",
                        "Continue as a guest for a non-personalized experience After login, the system:",
                        "Loads personal shopping lists and favorites",
                        "Applies eligible coupons and discounts automatically",
                        "Displays personalized promotions based on shopping history",
                        "Shows recommended items based on previous purchases",
                        "Connects to the store's floor plan for navigation assistance",
                      ].map((point) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("• ",
                                    style: TextStyle(fontSize: 18)),
                                Expanded(
                                  child: Text(point,
                                      style: AppTextStyles.customStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.black)),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                    ),
                    child: Text("Close",
                        style: AppTextStyles.customStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  )
                ],
              ),
            );
          },
          child: Text(
            "See Details →",
            style: AppTextStyles.customStyle(
              color: AppColors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget stepImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        url,
        height: 300,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
