import 'package:SmartTrolleyWebsite/View/Navigationpage/Components/DrawerItems.dart';
import 'package:flutter/material.dart';


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
              color: Colors.blue[800],
              width: double.infinity,
              child: Text(
                'IoTrolley',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),

            // Drawer Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _drawerItem('Home', () {
                    Navigator.pop(context); // Close drawer when tapped
                    // Add navigation logic here
                  }),
                  _drawerItem('Features', () {
                    Navigator.pop(context);
                    // Add navigation logic here
                  }),
                  _drawerItem('How It Works', () {
                    Navigator.pop(context);
                    // Add navigation logic here
                  }),
                  _drawerItem('Benefits', () {
                    Navigator.pop(context);
                    // Add navigation logic here
                  }),
                  _drawerItem('Contact', () {
                    Navigator.pop(context);
                    // Add navigation logic here
                  }),

                  // Sign Up button with distinct styling
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Add navigation logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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

  // Helper method to create drawer items
  Widget _drawerItem(String title, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: onTap,
          contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        ),
        Divider(height: 1, thickness: 0.5, indent: 24, endIndent: 24),
      ],
    );
  }
}
