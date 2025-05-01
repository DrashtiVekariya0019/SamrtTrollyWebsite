import 'dart:convert';
import 'package:SmartTrolleyWebsite/Support/SnckbarHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ContactController extends GetxController {
  // Form fields
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final companyController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  RxString? selectedSubject = RxString('');
  RxBool agreeToTerms = false.obs;

  // EmailJS credentials (replace with your actual values)
  final String serviceId = 'service_c4p6smh';
  final String templateId = 'template_a09t9ss';
  final String userId = 'VPB3pOUIq2rbKPH6p';

  // Method to handle form submission
  void submitForm() async {
    if (!agreeToTerms.value) {
      Get.snackbar("Error", "Please agree to the terms.");
      return;
    }

    final name = "${firstNameController.text} ${lastNameController.text}";
    final email = emailController.text;
    final subject = selectedSubject?.value ?? '';
    final company = companyController.text;
    final phone = phoneController.text;
    final message = messageController.text;

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    try {
      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_subject': subject,
            'user_company': company,
            'user_phone': phone,
            'user_message': message,
          },
        }),
      );


        if (response.statusCode == 200) {
          SnackbarHelper.showSuccess("Email sent successfully.");
          clearForm();
        } else {
          print('Email error: ${response.body}');
          SnackbarHelper.showError("Failed to send email.");
        }
      } catch (e) {
        print("Exception: $e");
        SnackbarHelper.showError("Something went wrong.");
      }
  }

  void clearForm() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    companyController.clear();
    phoneController.clear();
    messageController.clear();
    selectedSubject?.value = '';
    agreeToTerms.value = false;
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    companyController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
