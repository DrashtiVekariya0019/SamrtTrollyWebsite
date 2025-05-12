import 'package:SmartTrolleyWebsite/Support/CommonTextStyle.dart';
import 'package:SmartTrolleyWebsite/Utils/AppColors.dart';
import 'package:SmartTrolleyWebsite/View/Navigationpage/MobileDrawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Appbar extends StatelessWidget {
  final Widget body;

  const Appbar({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          // 🔹 Mobile View — Keep AppBar but fix styling
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(56), // Standard AppBar height
              child: AppBar(
                backgroundColor: Colors.blue[800], // Match desktop navbar color
                elevation: 0,
                title: Text(
                  'IoTrolley',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                centerTitle: false,
                iconTheme: IconThemeData(color: AppColors.white),
              ),
            ),
            drawer: Drawer(
              child: MobileDrawer(),
            ),
            body: SafeArea(child: body), // Use SafeArea to prevent content from going under status bar
          );
        } else {
          // 🔹 Desktop View
          return body;
        }
      },
    );
  }
}
