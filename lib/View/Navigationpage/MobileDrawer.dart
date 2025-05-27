
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header with logo
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              color: Colors.blue,
              width: double.infinity,
              child: Image.asset(
                'assets/Images/img.png',
                height: 80,
              ),
            ),

            // Drawer Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _drawerItem('Home', () {
                    _safeNavigation(context, '/home');
                  }),
                  _drawerItem('Features', () {
                    _safeNavigation(context, '/home');
                  }),
                  _drawerItem('How It Works', () {
                    _safeNavigation(context, '/home');
                  }),
                  _drawerItem('Benefits', () {
                    _safeNavigation(context, '/home');
                  }),
                  _drawerItem('Blog', () {
                    _safeNavigation(context, '/blog');
                  }),
                  _drawerItem('Contact', () {
                    _safeNavigation(context, '/home');
                  }),

                  // Sign Up button with distinct styling
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        _safeNavigation(context, '/signup');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
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

  // Safe navigation method with proper error handling
  void _safeNavigation(BuildContext context, String route) {
    try {
      // Close drawer first
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }

      // Wait for drawer to close completely
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Check if route exists before navigating
        if (Get.routing.route?.settings.name != route) {
          // Use pushReplacementNamed instead of offAllNamed for better stability
          Get.offAndToNamed(route);
        }
      });
    } catch (e) {
      print('Navigation error: $e');
      // Fallback navigation
      Navigator.of(context).pushReplacementNamed(route);
    }
  }

  // Helper method to create drawer items
  Widget _drawerItem(String title, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          onTap: onTap,
          contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          hoverColor: Colors.grey[100],
        ),
        Divider(
          height: 1,
          thickness: 0.5,
          indent: 24,
          endIndent: 24,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}