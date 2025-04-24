import 'package:SmartTrolleyWebsite/View/Navigationpage/Components/DrawerItems.dart';
import 'package:flutter/material.dart';


class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[200],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Space between items
          DrawerItem(title: 'Home', onTap: () {}),
          DrawerItem(title: 'Features', onTap: () {}),
          DrawerItem(title: 'How It Works', onTap: () {}),
          DrawerItem(title: 'Benefits', onTap: () {}),
          DrawerItem(title: 'Contact', onTap: () {}),
        ],
      ),
    );
  }
}
