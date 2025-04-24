import 'package:flutter/material.dart';
import 'package:samrttrollywebsite/Support/CommonTextStyle.dart';
import 'package:samrttrollywebsite/Utils/AppColors.dart';

class DesktopNavbar extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onFeaturesTap;
  final VoidCallback onHowItWorksTap;
  final VoidCallback onBenefitsTap;
  final VoidCallback onContactTap;

  const DesktopNavbar({
    super.key,
    required this.onHomeTap,
    required this.onFeaturesTap,
    required this.onHowItWorksTap,
    required this.onBenefitsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[800],
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),

      child: Stack(
        children: [
          Positioned(
            left: 30,
            child: Text(
              'IOTrolley',
              style: AppTextStyles.customStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _navItem("Home", onTap: onHomeTap),
                _navItem("Features", onTap: onFeaturesTap),
                _navItem("How It Works", onTap: onHowItWorksTap),
                _navItem("Benefits", onTap: onBenefitsTap),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: onContactTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text(
                    'Contact',
                    style: AppTextStyles.customStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title, {required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
