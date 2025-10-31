import 'package:five_line_task/common/widgets/appbar.dart';
import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:five_line_task/features/tasks/presentation/screens/list_tasks_body.dart';
import 'package:flutter/material.dart';
import '../widgets/add_task_sheet.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyTaskAppBar(),
      body: const TasksBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showAddTaskSheet(context),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Add Task',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
