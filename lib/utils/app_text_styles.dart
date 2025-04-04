import 'package:flutter/material.dart';
import 'package:todo_realtime_mvvm/utils/app_colors.dart';


class AppTextStyles {
  static const TextStyle taskTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
  static const TextStyle appTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.iconColor,
  );
  static const TextStyle hintText = TextStyle(
    color: AppColors.hintText,
    fontSize: 16,
  );
  static const TextStyle inputText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle dialogTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle completedTask = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    decoration: TextDecoration.lineThrough,
  );
  
}


