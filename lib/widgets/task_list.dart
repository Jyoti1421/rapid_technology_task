import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:todo_realtime_mvvm/utils/app_colors.dart';
import 'package:todo_realtime_mvvm/utils/app_styles.dart';
import 'package:todo_realtime_mvvm/utils/app_text_styles.dart';
import 'package:todo_realtime_mvvm/utils/app_dimensions.dart';
import 'package:todo_realtime_mvvm/viewmodels/task_view_model.dart';
import 'edit_task_dialog.dart'; // Import the new dialog widget

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TaskViewModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
      itemCount: viewModel.tasks.length,
      padding: AppDimensions.listPadding(screenWidth, screenHeight),
      itemBuilder: (context, index) {
        final task = viewModel.tasks[index];

        return Container(
          margin: AppDimensions.taskMargin(screenHeight),
          decoration: AppStyles.taskCardDecoration,
          child: ListTile(
            contentPadding: AppDimensions.listTilePadding(screenWidth, screenHeight),
            leading: _buildTaskCheckbox(task, screenWidth, viewModel),
            title: Text(
              task.title,
              style: task.completed ? AppTextStyles.completedTask : AppTextStyles.taskTitle,
            ),
            trailing: _buildActionButtons(context, task, screenWidth, viewModel),
          ),
        );
      },
    );
  }

  Widget _buildTaskCheckbox(task, double screenWidth, TaskViewModel viewModel) {
    return GestureDetector(
      onTap: () => viewModel.toggleComplete(task),
      child: Container(
        width: AppDimensions.checkboxSize(screenWidth),
        height: AppDimensions.checkboxSize(screenWidth),
        decoration: AppStyles.checkboxDecoration(task.completed),
        child: task.completed ? Icon(Icons.check, color: Colors.white, size: screenWidth * 0.04) : null,
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, task, double screenWidth, TaskViewModel viewModel) {
    return Wrap(
      spacing: AppDimensions.buttonSpacing(screenWidth),
      children: [
        IconButton(
          icon: Icon(Icons.edit, color: AppColors.primary, size: AppDimensions.iconSize(screenWidth)),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => EditTaskDialog(taskId: task.id, oldTitle: task.title),
          ),
        ),
        IconButton(
          icon: Icon(Icons.share, color: AppColors.success, size: AppDimensions.iconSize(screenWidth)),
          onPressed: () => Share.share('Task: ${task.title}'),
        ),
        IconButton(
          icon: Icon(Icons.delete, color: AppColors.danger, size: AppDimensions.iconSize(screenWidth)),
          onPressed: () => viewModel.deleteTask(task.id),
        ),
      ],
    );
  }
}
