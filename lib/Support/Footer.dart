import 'package:SmartTrolleyWebsite/Support/CommonTextStyle.dart';
import 'package:SmartTrolleyWebsite/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blue.withOpacity(0.1),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top section with 3 columns
          Wrap(
            spacing: 40,
            runSpacing: 20,
            alignment: WrapAlignment.spaceEvenly,
            children: [
              // Column 1: Logo & Info
              SizedBox(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("IoTrolley",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.6,
                        color: AppColors.black,
                      ),), // replace with your white logo
                    const SizedBox(height: 10),
                    Text('Support: support@iotrolly.com\nService: Service@iotrolly.com',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1.6,
                        color: Colors.black,
                      ),),
                  ],
                ),
              ),

              // Column 2: Addresses
              SizedBox(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(' Headquarters,', style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1.6,
                      color: AppColors.black,
                    ),),
                    SizedBox(height: 5),
                    Text(' C - 205, Ganesh Glory 11,\nJagatpur Road, Gota, Ahmedabad,\n Gujarat - 382481.,',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1.6,
                        color: Colors.black,
                      ),),
                    SizedBox(height: 15),

                  ],
                ),
              ),

              // Column 3: Links + Social Icons
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Navigation',  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1.6,
                      color: AppColors.black,
                    ),),
                    const SizedBox(height: 10),
                    navLink('Home'),
                    navLink('Features'),
                    navLink('How It Work'),
                    navLink('Benefits'),
                    navLink('Contact'),
                    navLink('Sign Up'),

                    const SizedBox(height: 20),
                    Text('Follow Us', style: TextStyle(color:AppColors.black)),
                    const SizedBox(height: 10),
                    Row(
                      children:  [
                        Icon(FontAwesomeIcons.youtube, color:AppColors.black, size: 18),
                        SizedBox(width: 10),
                        Icon(FontAwesomeIcons.linkedinIn,color:AppColors.black, size: 18),
                        SizedBox(width: 10),
                        Icon(FontAwesomeIcons.facebook, color:AppColors.black, size: 18),
                        SizedBox(width: 10),
                        Icon(FontAwesomeIcons.instagram, color:AppColors.black, size: 18),
                        SizedBox(width: 10),
                        Icon(FontAwesomeIcons.whatsapp, color:AppColors.black, size: 18),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),
          const Divider(color: Colors.black),
          const SizedBox(height: 10),

          // Bottom text
          Text(
            'Copyright © 2025 Netpair Infotech LLP. All rights reserved.  |  Privacy Policy  |  Terms & Conditions',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 1.6,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget navLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          height: 1.6,
          color: Colors.black,
        ),
      ),
    );
  }
}
