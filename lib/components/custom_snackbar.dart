import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:musify/meta/utils/app_theme.dart';

class CustomSnackBar {
  static void showSuccessSnackBar({
    required String title,
    required String message,
  }) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.confirmedAppointment,
        titleText: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        messageText: Text(
          message,
          style: const TextStyle(fontSize: 16),
        ),
        colorText: Colors.white,
        borderRadius: 8,
        margin: const EdgeInsets.all(16));
  }

  static void showErrorSnackBar({
    required String title,
    required String message,
  }) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.errorColor,
        titleText: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        messageText: Text(
          message,
          style: const TextStyle(fontSize: 16),
        ),
        colorText: Colors.white,
        borderRadius: 8,
        margin: const EdgeInsets.all(16));
  }
}
