import 'package:flutter/material.dart';
import 'package:todo_realtime_mvvm/utils/app_colors.dart';
import 'package:todo_realtime_mvvm/utils/app_text_styles.dart';
import 'package:todo_realtime_mvvm/utils/string_constant.dart';

class AppStyles {

   static final inputDecoration = InputDecoration(
    hintText: AppStrings.enterTaskHint,
    border: InputBorder.none,
    hintStyle: AppTextStyles.hintText,
  );
    static final inputContainerDecoration = BoxDecoration(
    color: AppColors.inputBackground,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 5,
        offset: Offset(0, 2),
      ),
    ],
  );
  static final taskCardDecoration = BoxDecoration(
    color: AppColors.cardBackground,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
  );

  static BoxDecoration checkboxDecoration(bool completed) {
    return BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: completed ? AppColors.success : AppColors.textSecondary,
        width: 2,
      ),
      color: completed ? AppColors.success : Colors.white,
    );
  }
  static final addButtonDecoration = BoxDecoration(
    color: AppColors.primary,
    shape: BoxShape.circle,
  );
}
