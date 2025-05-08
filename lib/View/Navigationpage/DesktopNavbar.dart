import 'package:SmartTrolleyWebsite/Support/CommonTextStyle.dart';
import 'package:SmartTrolleyWebsite/Utils/AppColors.dart';
import 'package:flutter/material.dart';

class DesktopNavbar extends StatelessWidget {
  // Add this at the top of your class:
  final ValueNotifier<bool> _isHovering = ValueNotifier(false);
  final VoidCallback onHomeTap;
  final VoidCallback onFeaturesTap;
  final VoidCallback onHowItWorksTap;
  final VoidCallback onBenefitsTap;
  final VoidCallback onContactTap;
  final VoidCallback onSignUpTap;

  DesktopNavbar({
    super.key,
    required this.onHomeTap,
    required this.onFeaturesTap,
    required this.onHowItWorksTap,
    required this.onBenefitsTap,
    required this.onContactTap,
    required this.onSignUpTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallDesktop = constraints.maxWidth < 1000;

        return Container(
          color: Colors.blue[800],
          padding: EdgeInsets.symmetric(
              horizontal: isSmallDesktop ? 16 : 32,
              vertical: 20
          ),
          child: Row(
            children: [
              // Left Side: Logo
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'IoTrolley',
                    style: AppTextStyles.customStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              // Center: Menu Items
              Expanded(
                flex: isSmallDesktop ? 3 : 2,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _navItem("Home", onTap: onHomeTap),
                      _navItem("Features", onTap: onFeaturesTap),
                      _navItem("How It Works", onTap: onHowItWorksTap),
                      _navItem("Benefits", onTap: onBenefitsTap),
                      SizedBox(width: isSmallDesktop ? 6 : 12),
                      ElevatedButton(
                        onPressed: onContactTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(
                            horizontal: isSmallDesktop ? 10 : 20,
                            vertical: 5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Text(
                          'Contact',
                          style: AppTextStyles.customStyle(
                            color: Colors.white,
                            fontSize: isSmallDesktop ? 14 : 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Right Side: Sign Up
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _signUpNavItem("Sign Up", onTap: onSignUpTap),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _navItem(String title, {required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
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

  Widget _signUpNavItem(String title, {required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => _isHovering.value = true,
        onExit: (_) => _isHovering.value = false,
        child: ValueListenableBuilder<bool>(
          valueListenable: _isHovering,
          builder: (context, isHovered, child) {
            return GestureDetector(
              onTap: onTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: isHovered ? Colors.white : Colors.transparent,
                  border: Border.all(color: Colors.white, width: 1.3),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: isHovered ? Colors.blue[800] : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
