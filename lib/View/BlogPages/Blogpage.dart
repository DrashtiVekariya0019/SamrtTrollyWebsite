import 'package:AivoCartsWebsite/Support/Footer.dart';
import 'package:AivoCartsWebsite/Utils/AppColors.dart';
import 'package:AivoCartsWebsite/View/Navigationpage/AppBar.dart';
import 'package:AivoCartsWebsite/View/Navigationpage/DesktopNavbar.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogPage1Content extends StatefulWidget {
  const BlogPage1Content({super.key});

  @override
  State<BlogPage1Content> createState() => _BlogPage1ContentState();
}

class _BlogPage1ContentState extends State<BlogPage1Content> {
  final EdgeInsets _contentPadding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0);
  final double _paragraphSpacing = 20.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final bool isMobile = constraints.maxWidth < 800;

      return Scaffold(

        body: Column(
          children: [
            if (!isMobile)
              DesktopNavbar(
                onHomeTap: () => Get.toNamed('/home'),
                onFeaturesTap: () => Get.toNamed('/home'),
                onHowItWorksTap: () => Get.toNamed('/home'),
                onBenefitsTap: () => Get.toNamed('/home'),
                onContactTap: () => Get.toNamed('/home'),
                onBlogTap: () => Get.toNamed('/blog'),
                onSignUpTap: () => Get.toNamed('/signup'),
              ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFEDEDED), Color(0xFFFDFDFD)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: _contentPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInDown(child: _buildTitle("BLOG 1:")),
                        FadeInDown(
                          delay: const Duration(milliseconds: 100),
                          child: _buildSectionHeading(
                              "The Rise of Automation in Shopping : How AivoCarts is Shaping the Future"),
                        ),
                        FadeInUp(
                          delay: const Duration(milliseconds: 200),
                          child: _buildParagraph(
                            "The retail landscape is undergoing a dramatic shift. As technology advances, customer expectations are growing — faster service, greater convenience, and personalized experiences are no longer optional; they’re essential. At the heart of this revolution is automation, and AivoCarts is proud to be driving this change.",
                          ),
                        ),
                        FadeInLeft(child: _buildSectionHeading("What Is Shopping Automation?")),

                        /// ✅ Updated Section: Animation added for image + text
                        FadeIn(
                          duration: const Duration(milliseconds: 800),
                          child: isMobile
                              ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'assets/Images/action5.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              _buildParagraph(
                                "Shopping automation refers to the use of technology like AI, machine vision,\n IoT, and smart payment systems to simplify and streamline \nthe buying process. It removes traditional pain points such as manual checkouts,\n price scanning errors, and stock management inefficiencies.",
                              ),
                              _buildParagraph(
                                "At AivoCarts, we combine computer vision, deep learning, and real-time data processing into smart carts that do the heavy lifting — identifying products instantly, handling payments, and even suggesting items based on customer preferences.",
                              ),
                            ],
                          )
                              : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// ✅ Animate image
                              Expanded(
                                flex: 1,
                                child: FadeInLeft(
                                  duration: const Duration(milliseconds: 600),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 16.0, top: 16.0, bottom: 16.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        'assets/Images/action5.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 10),

                              /// ✅ Animate text
                              Expanded(
                                flex: 2,
                                child: FadeInRight(
                                  duration: const Duration(milliseconds: 600),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildParagraph(
                                        "Shopping automation refers to the use of technology like AI, machine vision, IoT, and smart payment systems to simplify and streamline the buying process. It removes traditional pain points such as manual checkouts, price scanning errors, and stock management inefficiencies.",
                                      ),
                                      _buildParagraph(
                                        "At AivoCarts, we combine computer vision, deep learning, and real-time data processing into smart carts that do the heavy lifting — identifying products instantly, handling payments, and even suggesting items based on customer preferences.",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ),

                        FadeInRight(child: _buildSectionHeading("Why Automation Matters for Retailers")),

                        _buildBulletPoint("Faster Checkout: Smart carts eliminate the need for cashiers or self-service kiosks."),
                        _buildBulletPoint("Higher Customer Satisfaction: Shoppers can enjoy a frictionless experience without queues."),
                        _buildBulletPoint("Real-Time Inventory Management: Automated systems keep stock levels updated, reducing waste and out-of-stock issues."),
                        _buildBulletPoint("Lower Operational Costs: Retailers can reassign staff from manual tasks to customer service roles."),
                        _buildBulletPoint("Rich Data Insights: Understand shopping behaviors to fine-tune product placements, promotions, and store layouts."),

                        const SizedBox(height: 30),

                        FadeInLeft(child: _buildSectionHeading("How AivoCarts Leads the Charge")),
                        FadeInUp(
                          delay: const Duration(milliseconds: 100),
                          child: _buildParagraph(
                              "Our smart carts are engineered for plug-and-play scalability — easily deployable in stores of all sizes. Using advanced AI algorithms, they continuously learn and adapt to different retail environments. Integration with mobile apps further enhances personalization, offering loyalty rewards, targeted promotions, and digital receipts, all in real time.\n\nWith AivoCarts, shopping becomes not just automated — it becomes intuitive.\n\nThe future of retail is intelligent, seamless, and customer-first. At AivoCarts, we're making that future a reality — one smart cart at a time."),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInDown(child: _buildTitle("BLOG 2:")),
                            FadeInDown(
                              delay: const Duration(milliseconds: 100),
                              child: _buildSectionHeading(
                                  "Smart Shopping Starts with Smart Branding: A New Era with AivoCarts"),
                            ),
                            FadeInUp(
                              delay: const Duration(milliseconds: 200),
                              child: _buildParagraph(
                                "As shopping technology evolves, branding plays a more critical role than ever before. It's no longer just about colors and logos — it's about creating meaningful, tech-driven experiences that customers trust and love. At AivoCarts, we understand that branding is central to making smart shopping truly smart.",
                              ),
                            ),
                            FadeInLeft(child: _buildSectionHeading("Why Branding Matters in the Age of Smart Retail")),

                            /// ✅ Updated Section: Animation added for image + text
                            FadeIn(
                              duration: const Duration(milliseconds: 800),
                              child: isMobile
                                  ? Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        'assets/Images/action5.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  _buildBulletPoint("1. Trust and Security: When customers interact with automated systems, trust is everything. A well-executed brand communicates security, ease of use, and reliability from the very first interaction."),
                                  _buildBulletPoint("2. Recognition and Loyalty: Smart carts aren't just tools — they are part of your brand experience. When your smart shopping ecosystem feels seamless and familiar, customers are more likely to return."),
                                  _buildBulletPoint("3. Emotional Connection: Branding helps humanize technology. Whether through intuitive design, friendly interfaces, or personalized shopping journeys, strong branding makes automation feel natural rather than intimidating."),
                                ],
                              )
                                  : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// ✅ Animate image
                                  Expanded(
                                    flex: 1,
                                    child: FadeInLeft(
                                      duration: const Duration(milliseconds: 600),
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 16.0, top: 16.0, bottom: 16.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Image.asset(
                                            'assets/Images/shopandscan.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  /// ✅ Animate bullet points
                                  Expanded(
                                    flex: 2,
                                    child: FadeInRight(
                                      duration: const Duration(milliseconds: 600),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Added Padding to move the text down
                                          Padding(
                                            padding: const EdgeInsets.only(top: 16.0), // Adjust the value as needed
                                            child: _buildBulletPoint("1. Trust and Security: When customers interact with automated systems, trust is everything. A well-executed brand communicates security, ease of use, and reliability from the very first interaction."),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0), // Adjust the value as needed
                                            child: _buildBulletPoint("2. Recognition and Loyalty: Smart carts aren't just tools — they are part of your brand experience. When your smart shopping ecosystem feels seamless and familiar, customers are more likely to return."),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0), // Adjust the value as needed
                                            child: _buildBulletPoint("3. Emotional Connection: Branding helps humanize technology. Whether through intuitive design, friendly interfaces, or personalized shopping journeys, strong branding makes automation feel natural rather than intimidating."),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),

                            FadeInRight(child: _buildSectionHeading("How AivoCarts Supports Branded Experiences")),

                            _buildBulletPoint("Customizable Interfaces: Retailers can align cart interfaces with their store’s branding — from colors and logos to tone of voice and special promotions."),
                            _buildBulletPoint("Personalized Shopping Journeys: Smart carts offer branded loyalty programs, special offers, and dynamic content that enhances brand value at every touchpoint."),
                            _buildBulletPoint("Unified Ecosystem: Whether online or in-store, AivoCarts helps create a consistent, omnichannel brand experience."),


                            const SizedBox(height: 30),

                            FadeInLeft(child: _buildSectionHeading("The Bottom Line")),
                            FadeInUp(
                              delay: const Duration(milliseconds: 100),
                              child: _buildParagraph(
                                  "Smart technology without smart branding is just hardware With AivoCarts, retailers can weave their brand identity into every step of the shopper’s journey — transforming every visit into a branded, memorable, and effortless experience."),
                            ),
                            FadeInUp(
                              delay: const Duration(milliseconds: 100),
                              child: _buildParagraph(
                                  "In the future of retail, brands that combine technology with emotional connection will win. AivoCarts is your partner in building that future — smarter, stronger, and more customer-centric."),
                            ),

                            Footer()
                                .animate(delay: 1100.ms)
                                .fadeIn(duration: 600.ms)
                                .slideY(begin: 0.3, end: 0),
                          ],
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildTitle(String text) {
    return Center(
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ),
    );
  }


  Widget _buildSectionHeading(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 12.0),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: _paragraphSpacing),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.7,
          color: const Color(0xFF5A5A5A),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• ",
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.6,
                color: const Color(0xFF5A5A5A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Blogpages1 extends StatelessWidget {
  const Blogpages1({super.key});

  @override
  Widget build(BuildContext context) {
    return Appbar(
      body: const BlogPage1Content(),
    );
  }
}
