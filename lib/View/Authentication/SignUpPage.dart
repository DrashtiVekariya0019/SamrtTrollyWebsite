import 'package:SmartTrolleyWebsite/Controller/SignUpController.dart';
import 'package:SmartTrolleyWebsite/Support/CommonElevatedButton.dart';
import 'package:SmartTrolleyWebsite/Support/CommonTextStyle.dart';
import 'package:SmartTrolleyWebsite/Support/Footer.dart';
import 'package:SmartTrolleyWebsite/Utils/AppColors.dart';

import 'package:SmartTrolleyWebsite/View/Navigationpage/Appbar.dart'; // Import Appbar component
import 'package:SmartTrolleyWebsite/View/Navigationpage/DesktopNavbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// SignUpPage content without Scaffold
class SignUpPageContent extends StatefulWidget {
  @override
  _SignUpPageContentState createState() => _SignUpPageContentState();
}

class _SignUpPageContentState extends State<SignUpPageContent> {
  final SignupController controller = Get.put(SignupController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine if mobile or desktop view
        bool isMobile = constraints.maxWidth < 800;

        return Column(
          children: [
            // Conditional Navigation Bar
            if (!isMobile)
              DesktopNavbar(
                // Only Home navigation is enabled, all others do nothing
                  onHomeTap: () => Get.toNamed('/home'),
                  onFeaturesTap: () => Get.toNamed('/home'), // Do nothing when clicked
                  onHowItWorksTap: ()=> Get.toNamed('/home'),
                  onBenefitsTap: () => Get.toNamed('/home'),
                  onContactTap: () => Get.toNamed('/home'),
                  onSignUpTap: () => {}
              ),
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Sign Up',
                        style: AppTextStyles.customStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _buildValidatedTextField(
                                "Name",
                                controller.nameController,
                              ),
                              SizedBox(height: 20),
                              _buildEmailTextField(
                                "Email",
                                controller.emailController,
                              ),
                              SizedBox(height: 20),
                              _buildPhoneTextField(
                                "Mobile Number",
                                controller.phoneController,
                              ),
                              SizedBox(height: 30),
                              CommonElevatedButton(
                                text: "Sign Up",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    controller.submitForm();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Footer(), // Footer will stay at bottom
          ],
        );
      },
    );
  }

  Widget _buildValidatedTextField(
      String label,
      TextEditingController controller,
      ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) => value == null || value.isEmpty ? 'Please enter $label' : null,
    );
  }

  Widget _buildEmailTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        } else if (!RegExp(
          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
        ).hasMatch(value)) {
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
        border: const OutlineInputBorder(),
      ),
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
    // Wrap the content with the Appbar component
    return Appbar(
      body: Scaffold(
        body: SignUpPageContent(),
      ),
    );
  }
}