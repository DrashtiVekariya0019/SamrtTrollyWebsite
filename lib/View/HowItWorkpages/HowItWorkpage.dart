import 'package:SmartTrolleyWebsite/Controller/HowItWorkController.dart';
import 'package:SmartTrolleyWebsite/Support/CommonElevatedButton.dart';
import 'package:SmartTrolleyWebsite/Support/CommonTextStyle.dart';
import 'package:SmartTrolleyWebsite/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
              style: GoogleFonts.montserrat(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Our innovative IO trolley system streamlines the shopping experience from start to finish. Here's how it works.",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.6,
                color: Color(0xFF5A5A5A),
              ),
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
                        Flexible(
                            flex: 1, child: HoverImage(url: step["img"]!)),
                      ]
                          : [
                        Flexible(
                            flex: 1, child: HoverImage(url: step["img"]!)),
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
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          step["desc"],
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.6,
            color: Color(0xFF5A5A5A),
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
                      Text(
                        "Scan & Login Details",
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
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
                            const Text("• ", style: TextStyle(fontSize: 18)),
                            Expanded(
                              child: Text(
                                point,
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.6,
                                  color: Color(0xFF5A5A5A),
                                ),
                              ),
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
                    child: Text(
                      "Close",
                      style: GoogleFonts.montserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color:AppColors.white
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          child: Text(
            "See Details →",
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.blue,
            ),
          ),
        ),
      ],
    );
  }
}

class HoverImage extends StatefulWidget {
  final String url;
  const HoverImage({Key? key, required this.url}) : super(key: key);

  @override
  State<HoverImage> createState() => _HoverImageState();
}

class _HoverImageState extends State<HoverImage> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: _hovering
                ? [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 6),
              ),
            ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              widget.url,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

