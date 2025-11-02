import 'package:easy_localization/easy_localization.dart';

import 'package:five_line_task/common/helpers.dart/get_it.dart';
import 'package:five_line_task/common/widgets/appbar.dart';
import 'package:five_line_task/core/constants/app_strings.dart';

import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:five_line_task/features/tasks/domain/repo/tasks_repo.dart';
import 'package:five_line_task/features/tasks/presentation/bloc/states.dart';
import 'package:five_line_task/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:five_line_task/features/tasks/presentation/screens/list_tasks_body.dart';
import 'package:five_line_task/features/tasks/presentation/widgets/drawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/add_task_sheet.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(getIt<TasksRepo>()),
      child: 
      Scaffold(
        drawer: buildDrawer(context),
        appBar: MyTaskAppBar(implyLeading: true,),
        body: const TasksBody(),
floatingActionButton: BlocBuilder<TasksCubit, TasksState>(
  builder: (context, state) {
    return FloatingActionButton.extended(
      onPressed: () => showAddTaskSheet(
        context, 
        context.read<TasksCubit>()
      ),
      backgroundColor: AppColors.primary,
      icon: const Icon(Icons.add, color: AppColors.lightBackground),
      label: Text(
        AppStrings.addTask.tr(),
        style: const TextStyle(
          color: AppColors.lightBackground,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  },
),
      ),
    );
  }
}
