import 'package:flutter/material.dart';

class AppDimensions {
  static EdgeInsets listPadding(double screenWidth, double screenHeight) {
    return EdgeInsets.symmetric(
      horizontal: screenWidth * 0.03,
      vertical: screenHeight * 0.01,
    );
  }

  static EdgeInsets taskMargin(double screenHeight) {
    return EdgeInsets.symmetric(vertical: screenHeight * 0.008);
  }

  static EdgeInsets listTilePadding(double screenWidth, double screenHeight) {
    return EdgeInsets.symmetric(
      horizontal: screenWidth * 0.04,
      vertical: screenHeight * 0.015,
    );
  }

  static double checkboxSize(double screenWidth) {
    return screenWidth * 0.06;
  }

  static double buttonSpacing(double screenWidth) {
    return screenWidth * 0.02;
  }

  static double iconSize(double screenWidth) {
    return screenWidth * 0.06;
  }
   static EdgeInsets inputPadding(double screenWidth, double screenHeight) {
    return EdgeInsets.symmetric(
      horizontal: screenWidth * 0.03,
      vertical: screenHeight * 0.01,
    );
  }

  static EdgeInsets inputContainerPadding(double screenWidth, double screenHeight) {
    return EdgeInsets.symmetric(
      horizontal: screenWidth * 0.03,
      vertical: screenHeight * 0.008,
    );
  }

  static double addButtonPadding(double screenWidth) {
    return screenWidth * 0.03;
  }
}
