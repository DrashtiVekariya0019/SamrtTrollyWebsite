
import 'package:AivoCartsWebsite/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopNavbar extends StatelessWidget {
  final ValueNotifier<bool> _isHovering = ValueNotifier(false);
  final VoidCallback onHomeTap;
  final VoidCallback onFeaturesTap;
  final VoidCallback onHowItWorksTap;
  final VoidCallback onBenefitsTap;
  final VoidCallback onBlogTap;
  final VoidCallback onContactTap;
  final VoidCallback onSignUpTap;

  DesktopNavbar({
    super.key,
    required this.onHomeTap,
    required this.onFeaturesTap,
    required this.onHowItWorksTap,
    required this.onBenefitsTap,
    required this.onBlogTap,
    required this.onContactTap,
    required this.onSignUpTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallDesktop = constraints.maxWidth < 1000;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.blue,
              padding: EdgeInsets.symmetric(
                horizontal: isSmallDesktop ? 16 : 32,
                vertical: 20,
              ),
              child: Row(
                children: [
                  // Left Side: Logo
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'assets/Images/img.png',
                        height: 80,
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
                          _navItem("Blog", onTap: onBlogTap),

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
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
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
            ),
            // Divider line below Navbar
            Container(
              height: 1,
              color: Color(0xFF05203D),
            ),
          ],
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
          style: GoogleFonts.montserrat(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color:AppColors.white,
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
                  color: isHovered ? Colors.transparent : Colors.transparent,
                  border: Border.all(color: Colors.white, width: 1.3),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: isHovered ? Colors.white : Colors.white,
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
