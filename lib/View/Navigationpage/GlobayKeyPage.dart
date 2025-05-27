
import 'package:AivoCartsWebsite/Support/Footer.dart';
import 'package:AivoCartsWebsite/Utils/AppColors.dart';
import 'package:AivoCartsWebsite/Utils/RouteData.dart';
import 'package:AivoCartsWebsite/View/Benefitspage/Benefitspage.dart';
import 'package:AivoCartsWebsite/View/ContactPages/ContactPage.dart';
import 'package:AivoCartsWebsite/View/Featurespages/Featurespage.dart';
import 'package:AivoCartsWebsite/View/Homepages/Homepage.dart';
import 'package:AivoCartsWebsite/View/HowItWorkpages/HowItWorkpage.dart';
import 'package:AivoCartsWebsite/View/Navigationpage/DesktopNavbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final homepageKey = GlobalKey();
  final featuresKey = GlobalKey();
  final howItWorkKey = GlobalKey();
  final blog=GlobalKey();
  final benefitsKey = GlobalKey();
  final contactKey = GlobalKey();

  final signupkey=GlobalKey();

  final scrollController = ScrollController();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const  Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).size.width < 600
          ? AppBar(
        //   title:  Image.asset(
        //   'assets/Images/img.png',height: 80,
        //
        // ), // Or use your logo here
        backgroundColor: Colors.blue, // ✅ Added white background
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black), // ✅ Added black icon color for visibility
      )
          : null,
      drawer: MediaQuery.of(context).size.width < 600
          ? Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white, // Use your brand color
              ),
              child: Image.asset(
                'assets/Images/img.png',
                height: 80,
              ),
            ),

            ListTile(
              title:  Text('Home', style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color:  AppColors.black,
              ),),
              onTap: () {
                scrollToSection(homepageKey);
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title:  Text('Features', style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color:  AppColors.black,
              ),),
              onTap: () {
                scrollToSection(featuresKey);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title:  Text('How It Works', style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color:  AppColors.black,
              ),),
              onTap: () {
                scrollToSection(howItWorkKey);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title:  Text('Benefits', style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color:  AppColors.black,
              ),),
              onTap: () {
                scrollToSection(benefitsKey);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title:  Text('Blog', style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color:  AppColors.black,
              ),),
              onTap: () {
                Navigator.pop(context);
                Get.toNamed(AppRoutes.blog);
              },
            ),

            ListTile(
              title:  Text('Contact', style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color:  AppColors.black,
              ),),
              onTap: () {
                scrollToSection(contactKey);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title:  Text('Sign Up', style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color:  AppColors.black,
              ),),
              onTap: () {
                Navigator.pop(context);
                Get.toNamed(AppRoutes.signup);
              },
            ),
          ],
        ),
      )
          : null,
      body: Column(
        children: [
          // ✅ Added divider line below AppBar (same as SignUp page)
          if (MediaQuery.of(context).size.width < 600)
            Container(
              height: 1,
              color: Color(0xFF05203D),
            ),
          // Only show DesktopNavbar when screen width is >= 600
          if (MediaQuery.of(context).size.width >= 600)
            DesktopNavbar(
              onHomeTap: () => scrollToSection(homepageKey),
              onFeaturesTap: () => scrollToSection(featuresKey),
              onHowItWorksTap: () => scrollToSection(howItWorkKey),
              onBenefitsTap: () => scrollToSection(benefitsKey),
              onBlogTap: () => Get.toNamed(AppRoutes.blog),
              onContactTap: () => scrollToSection(contactKey),
              onSignUpTap: () => Get.toNamed(AppRoutes.signup),
            ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(
                    key: homepageKey,
                    child: Homepage(
                      onSeeHowItWorks: () => scrollToSection(howItWorkKey),
                      onExploreFeatures: () => scrollToSection(featuresKey),
                    ),
                  ),
                  Container(
                    key: featuresKey,
                    child: FeaturesPage(
                      onRequestDemoTap: () => scrollToSection(contactKey),
                    ),
                  ),
                  Container(
                    key: howItWorkKey,
                    child: HowItWorkPage(
                        onRequestDemoTap: () => scrollToSection(contactKey)),
                  ),
                  Container(key: benefitsKey, child: BenefitsPage()),

                  Container(key: contactKey, child: ContactPage()),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
