
import 'package:flutter/material.dart';
import 'package:samrttrollywebsite/Support/CommonElevatedButton.dart';
import 'package:samrttrollywebsite/Support/CommonTextStyle.dart';


class Homepage extends StatelessWidget {
  Homepage({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          Container(
            // color: const Color(0xFFEFF3FF),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              children: [

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Left Side: Text
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            'Revolutionize\nShopping With\nIO Trolley',
                            style: AppTextStyles.customStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              // height: 1.3,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Transform your retail experience with AI-powered trolleys that\neliminate checkout lines, track purchases, and personalize\nshopping journeys.',
                            style: AppTextStyles.customStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              CommonElevatedButton(
                                text: "See How It Works",
                                onPressed: () {
                                },
                              ),
                              const SizedBox(width: 10),
                              CommonElevatedButton(
                                text: "Explore Features",
                                onPressed: () {
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Wrap(
                            spacing: 40,
                            runSpacing: 20,
                            alignment: WrapAlignment.center,
                            children: const [
                              InfoTile(title: "70%", subtitle: "Faster Checkout"),
                              InfoTile(title: "35%", subtitle: "Sales Increase"),
                              InfoTile(title: "90%", subtitle: "Customer Satisfaction"),
                            ],
                          ),

                        ],
                      ),
                    ),

                    const SizedBox(width: 10),

                    // Right Side: Image
                    Expanded(
                      flex: 5,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/Images/newtechnology.png',
                              fit: BoxFit.cover,
                              height: 400,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.blue[800],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child:  Text(
                                "New Technology\nSmart Retail Solution",
                                style: AppTextStyles.customStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 60),
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
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 40,
                  runSpacing: 20,
                  children: const [
                    RetailerText(name: "RETAILCO"),
                    RetailerText(name: "SMARTSHOP"),
                    RetailerText(name: "FUTUREMART"),
                    RetailerText(name: "TECHSTORE"),
                    RetailerText(name: "QUICKBUY"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class InfoTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const InfoTile({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:  AppTextStyles.customStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        Text(subtitle),
      ],
    );
  }
}
class RetailerText extends StatelessWidget {
  final String name;
  const RetailerText({super.key, required this.name});

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
