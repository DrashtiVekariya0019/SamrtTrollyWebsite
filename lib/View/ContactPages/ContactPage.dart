import 'package:SmartTrolleyWebsite/Controller/ContactController.dart';
import 'package:SmartTrolleyWebsite/Support/CommonElevatedButton.dart';
import 'package:SmartTrolleyWebsite/Support/CommonHoverImage.dart';
import 'package:SmartTrolleyWebsite/Support/CommonTextStyle.dart';
import 'package:SmartTrolleyWebsite/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class ContactPage extends StatefulWidget {
  ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final ContactController controller = Get.put(ContactController());
  final _formKey = GlobalKey<FormState>();

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              "Contact",
              style: GoogleFonts.montserrat(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Ready to transform your retail experience? Get in touch with our team today.",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.6,
                color: Color(0xFF5A5A5A),
              ),
            ),
            const SizedBox(height: 40),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 800) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _formSection(),
                      const SizedBox(height: 20),
                      _contactInfoSection(),
                    ],
                  );
                } else {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _formSection()),
                      const SizedBox(width: 20),
                      Expanded(child: _contactInfoSection()),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // Updated Fields with onChanged and autovalidateMode
  Widget _buildValidatedTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      autovalidateMode: _autoValidateMode,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF5A5A5A),
        ),

        errorStyle: GoogleFonts.montserrat( // ✅ Error style here
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
      autovalidateMode: _autoValidateMode,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF5A5A5A),
        ),
        errorStyle: GoogleFonts.montserrat( // ✅ Error style here
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
      autovalidateMode: _autoValidateMode,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF5A5A5A),
        ),
        errorStyle: GoogleFonts.montserrat( // ✅ Error style here
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

  Widget _formSection() {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.grey.withOpacity(0.2)),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Form(
        key: _formKey,
        autovalidateMode: _autoValidateMode,
        child: Column(
          children: [
            _buildValidatedTextField("First Name", controller.firstNameController),
            const SizedBox(height: 30),
            _buildValidatedTextField("Last Name", controller.lastNameController),
            const SizedBox(height: 30),
            _buildEmailTextField("Business Email", controller.emailController),
            const SizedBox(height: 30),
            Obx(() => DropdownButtonFormField<String>(
              value: controller.selectedSubject?.value == "" ? null : controller.selectedSubject?.value,
              decoration: InputDecoration(
                labelText: 'Subject',
                labelStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5A5A5A),
                ),
                errorStyle: GoogleFonts.montserrat( // ✅ Error style here
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
                border: OutlineInputBorder(),
              ),
              validator: (value) => value == null ? 'Please select a subject' : null,
              items: const [
                DropdownMenuItem(value: 'Request a Demo', child: Text('Request a Demo')),
                DropdownMenuItem(value: 'Request a Quote', child: Text('Request a Quote')),
                DropdownMenuItem(value: 'Technical Support', child: Text('Technical Support')),
                DropdownMenuItem(value: 'Partnership Inquiry', child: Text('Partnership Inquiry')),
                DropdownMenuItem(value: 'Other', child: Text('Other')),
              ],
              onChanged: (value) {
                controller.selectedSubject?.value = value!;
              },
            )),
            const SizedBox(height: 30),
            _buildValidatedTextField("Company", controller.companyController),
            const SizedBox(height: 30),
            _buildPhoneTextField("Phone Number", controller.phoneController),
            const SizedBox(height: 30),
            TextFormField(
              controller: controller.messageController,
              maxLines: 7,
              autovalidateMode: _autoValidateMode,
              decoration: InputDecoration(
                labelText: 'Message',
                labelStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5A5A5A),
                ),
                errorStyle: GoogleFonts.montserrat( // ✅ Error style here
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),

                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                if (_autoValidateMode == AutovalidateMode.onUserInteraction) {
                  _formKey.currentState?.validate();
                }
              },
            ),
            const SizedBox(height: 30),
            Obx(() => Row(
              children: [
                Checkbox(
                  value: controller.agreeToTerms.value,
                  onChanged: (value) {
                    controller.agreeToTerms.value = value ?? false;
                  },
                ),
                Expanded(
                  child: RichText(
                    text:  TextSpan(
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'I agree to receive communications about IOTrolley products, services, and events. You can unsubscribe at any time. View our ',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            height: 1.6,
                            color: AppColors.black,
                          ), ),
                        TextSpan(
                          text: ' Privacy Policy.',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            height: 1.6,
                            decoration: TextDecoration.underline,
                            color: AppColors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            const SizedBox(height: 20),
            CommonElevatedButton(
              text: "SUBMIT",
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactInfoSection() {
    // unchanged...
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.grey.withOpacity(0.2)),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact Information",
            style: GoogleFonts.montserrat(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 30),
          contactTile(
            Icons.phone,
            "Phone\nSales: +1 (800) 123-4567\nSupport: 1 (800) 123-4567",
          ),
          const SizedBox(height: 15),
          contactTile(
            Icons.email,
            "Email\nSales: sales@iotrolly.com\nSupport: support@iotrolly.com",
          ),
          const SizedBox(height: 15),
          contactTile(
            Icons.location_on,
            "Headquarters\nC - 205, Ganesh Glory 11,\nJagatpur Road, Gota, Ahmedabad,\n Gujarat - 382481.",
          ),
          const SizedBox(height: 15),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: HoverImage(
              url:'assets/Images/contact.png',

              height: 400,
            ),
          ),
          const SizedBox(height: 30),



        ],
      ),
    );
  }

  Widget contactTile(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 28, color: Colors.blueAccent),
        const SizedBox(width: 12),
        Expanded(child: Text(text,  style: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          height: 1.6,
          color: AppColors.black,
        ),)),
      ],
    );
  }
}