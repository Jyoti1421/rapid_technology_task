import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:todo_realtime_mvvm/utils/app_colors.dart';
import 'package:todo_realtime_mvvm/utils/app_styles.dart';
import 'package:todo_realtime_mvvm/utils/app_text_styles.dart';
import 'package:todo_realtime_mvvm/utils/app_dimensions.dart';
import 'package:todo_realtime_mvvm/viewmodels/task_view_model.dart';
import 'edit_task_dialog.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final viewModel = Provider.of<TaskViewModel>(context, listen: false);
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
      viewModel.loadMoreTasks(); // Fetch more tasks
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TaskViewModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
      controller: _scrollController,
      itemCount: viewModel.tasks.length + (viewModel.isLoadingMore ? 1 : 0),
      padding: AppDimensions.listPadding(screenWidth, screenHeight),
      itemBuilder: (context, index) {
        if (index == viewModel.tasks.length) {
          return Center(child: CircularProgressIndicator()); // Show loader at the bottom
        }
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
