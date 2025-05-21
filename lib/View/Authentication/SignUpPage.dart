import 'package:SmartTrolleyWebsite/Controller/SignUpController.dart';
import 'package:SmartTrolleyWebsite/Support/CommonElevatedButton.dart';

import 'package:SmartTrolleyWebsite/Support/Footer.dart';
import 'package:SmartTrolleyWebsite/Utils/AppColors.dart';

import 'package:SmartTrolleyWebsite/View/Navigationpage/Appbar.dart';
import 'package:SmartTrolleyWebsite/View/Navigationpage/DesktopNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPageContent extends StatefulWidget {
  @override
  _SignUpPageContentState createState() => _SignUpPageContentState();
}

class _SignUpPageContentState extends State<SignUpPageContent> {
  final SignupController controller = Get.put(SignupController());
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;


        return Column(
          children: [
            if (!isMobile)
              DesktopNavbar(
                onHomeTap: () => Get.toNamed('/home'),
                onFeaturesTap: () => Get.toNamed('/home'),
                onHowItWorksTap: () => Get.toNamed('/home'),
                onBenefitsTap: () => Get.toNamed('/home'),
                onContactTap: () => Get.toNamed('/home'),
                onSignUpTap: () => {},
              ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),

                    // 🟦 Animated Heading
                    Text(
                      'Sign Up',
                      style: GoogleFonts.montserrat(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 800.ms)
                        .slideY(begin: -0.5, end: 0),

                    const SizedBox(height: 30),

                    // 🟨 Form Fields with Animation
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: Form(
                          key: _formKey,
                          autovalidateMode: _autoValidateMode,
                          child: Column(
                            children: [
                              _buildValidatedTextField(
                                "Name",
                                controller.nameController,
                              )
                                  .animate()
                                  .fadeIn(duration: 500.ms)
                                  .slideX(begin: -0.2, end: 0),

                              const SizedBox(height: 20),

                              _buildEmailTextField(
                                "Email",
                                controller.emailController,
                              )
                                  .animate(delay: 300.ms)
                                  .fadeIn(duration: 500.ms)
                                  .slideX(begin: -0.2, end: 0),

                              const SizedBox(height: 20),

                              _buildPhoneTextField(
                                "Mobile Number",
                                controller.phoneController,
                              )
                                  .animate(delay: 600.ms)
                                  .fadeIn(duration: 500.ms)
                                  .slideX(begin: -0.2, end: 0),

                              const SizedBox(height: 30),

                              // 🟩 Animated Button
                              CommonElevatedButton(
                                text: "Sign Up",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    controller.submitForm();
                                    setState(() {
                                      _autoValidateMode = AutovalidateMode.disabled;
                                    });
                                  } else {
                                    setState(() {
                                      _autoValidateMode = AutovalidateMode.onUserInteraction;
                                    });
                                  }
                                },
                              )
                                  .animate(delay: 900.ms)
                                  .fadeIn(duration: 600.ms)
                                  .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),

                    // 🟥 Animated Footer
                    Footer()
                        .animate(delay: 1100.ms)
                        .fadeIn(duration: 600.ms)
                        .slideY(begin: 0.3, end: 0),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildValidatedTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF5A5A5A),
        ),
        errorStyle: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.red,
        ),
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) {
        if (_autoValidateMode == AutovalidateMode.onUserInteraction) {
          _formKey.currentState?.validate();
        }
      },
      validator: (value) => value == null || value.isEmpty ? 'Please enter $label' : null,
    );
  }

  Widget _buildEmailTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF5A5A5A),
        ),
        errorStyle: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.red,
        ),
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) {
        if (_autoValidateMode == AutovalidateMode.onUserInteraction) {
          _formKey.currentState?.validate();
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _buildPhoneTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF5A5A5A),
        ),
        errorStyle: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.red,
        ),
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) {
        if (_autoValidateMode == AutovalidateMode.onUserInteraction) {
          _formKey.currentState?.validate();
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
          return 'Phone number must be 10 digits';
        }
        return null;
      },
    );
  }
}

// Main SignUpPage that uses the Appbar component
class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Appbar(
      body: Scaffold(
        body: SignUpPageContent(),
      ),
    );
  }
}
