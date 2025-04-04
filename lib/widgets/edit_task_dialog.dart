import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_realtime_mvvm/utils/app_text_styles.dart';
import 'package:todo_realtime_mvvm/utils/string_constant.dart';
import 'package:todo_realtime_mvvm/viewmodels/task_view_model.dart';


class EditTaskDialog extends StatelessWidget {
  final String taskId;
  final String oldTitle;

  EditTaskDialog({required this.taskId, required this.oldTitle});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: oldTitle);

    return AlertDialog(
      title: Text(AppStrings.editTaskTitle, style: AppTextStyles.dialogTitle),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: AppStrings.taskTitleLabel,
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            FocusScope.of(context).unfocus(); // Hide keyboard
            Navigator.pop(context);
          },
          child: Text(AppStrings.cancelButton),
        ),
        ElevatedButton(
          onPressed: () {
            FocusScope.of(context).unfocus(); // Hide keyboard
            final newTitle = controller.text.trim();
            if (newTitle.isNotEmpty && newTitle != oldTitle) {
              Provider.of<TaskViewModel>(context, listen: false)
                  .editTask(taskId, newTitle);
            }
            Navigator.pop(context);
          },
          child: Text(AppStrings.saveButton),
        ),
      ],
    );
  }
}
