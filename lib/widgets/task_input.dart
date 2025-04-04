import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_realtime_mvvm/utils/app_colors.dart';
import 'package:todo_realtime_mvvm/utils/app_dimensions.dart';
import 'package:todo_realtime_mvvm/utils/app_styles.dart';
import 'package:todo_realtime_mvvm/utils/app_text_styles.dart';
import 'package:todo_realtime_mvvm/viewmodels/task_view_model.dart';


class TaskInput extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  TaskInput({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: AppDimensions.inputPadding(screenWidth, screenHeight),
      child: Container(
        padding: AppDimensions.inputContainerPadding(screenWidth, screenHeight),
        decoration: AppStyles.inputContainerDecoration,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: AppStyles.inputDecoration,
                style: AppTextStyles.inputText,
              ),
            ),
            _buildAddButton(context, screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(BuildContext context, double screenWidth) {
    return GestureDetector(
      onTap: () {
        final title = controller.text.trim();
        if (title.isNotEmpty) {
          Provider.of<TaskViewModel>(context, listen: false).addTask(title);
          controller.clear();
        }
      },
      child: Container(
        padding: EdgeInsets.all(AppDimensions.addButtonPadding(screenWidth)),
        decoration: AppStyles.addButtonDecoration,
        child: Icon(Icons.add, color: AppColors.iconColor),
      ),
    );
  }
}
