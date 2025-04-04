// lib/views/home_view.dart
import 'package:flutter/material.dart';
import 'package:todo_realtime_mvvm/utils/app_colors.dart';
import 'package:todo_realtime_mvvm/utils/app_text_styles.dart';
import 'package:todo_realtime_mvvm/utils/string_constant.dart';
import 'package:todo_realtime_mvvm/widgets/task_input.dart';
import 'package:todo_realtime_mvvm/widgets/task_list.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(AppStrings.todoList,style: AppTextStyles.appTitle)),
      body: Column(
        children: [
          TaskInput(),
          Expanded(child: TaskList()),
        ],
      ),
    );
  }
}