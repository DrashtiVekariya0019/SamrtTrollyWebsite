import 'dart:convert';
import 'package:SmartTrolleyWebsite/Services/ApiFunction.dart';
import 'package:SmartTrolleyWebsite/Support/SnckbarHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignupController extends GetxController {
  // Form fields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();


  final ApiFunction _apiFunction = Get.put(ApiFunction());


  void submitForm() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();

    try {
      int phoneNumber = int.parse(phone);
      final response = await _apiFunction.createClientRequest(nameController.text.toString(), email, phoneNumber);

      if (response != null && response['status'] == 201) {
        print("responseee${response['status']}");
        SnackbarHelper.showErrorWithTitle("Success", response['message'] ?? "Request submitted!");
        clearForm();
      } else {
        SnackbarHelper.showErrorWithTitle("Error", response['message'] ?? "Something went wrong");
      }
    } catch (e) {
      SnackbarHelper.showErrorWithTitle("Exception", "Invalid input or server error: ${e.toString()}");
    }
  }

  void clearForm() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
