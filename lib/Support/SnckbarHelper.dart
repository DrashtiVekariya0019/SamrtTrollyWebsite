import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  // Existing Success method (unchanged for backward compatibility)
  static void showSuccess(String message) {
    Get.snackbar(
      "Success",
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 8,
      isDismissible: true,
      duration: const Duration(seconds: 2),
      maxWidth: 300,
    );
  }

  // Existing Error method (unchanged for backward compatibility)
  static void showError(String message) {
    Get.snackbar(
      "Error",
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 8,
      isDismissible: true,
      duration: const Duration(seconds: 2),
      maxWidth: 300,
    );
  }

  // ✅ New method with custom title for success
  static void showSuccessWithTitle(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 8,
      isDismissible: true,
      duration: const Duration(seconds: 2),
      maxWidth: 300,
    );
  }

  // ✅ New method with custom title for error
  static void showErrorWithTitle(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 8,
      isDismissible: true,
      duration: const Duration(seconds: 2),
      maxWidth: 300,
    );
  }
}
