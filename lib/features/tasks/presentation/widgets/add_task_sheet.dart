import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/common/helpers.dart/get_it.dart';
import 'package:five_line_task/common/widgets/app_text_form_field.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:five_line_task/features/tasks/domain/repo/tasks_repo.dart';
import 'package:five_line_task/features/tasks/domain/usecases/add_task.dart';
import 'package:flutter/material.dart';

void showAddTaskSheet(BuildContext context) {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  // Future<void> _addTask() async {
  //   final useCase = AddTaskUseCase(getIt<TasksRepo>());
  //   final result = await useCase.call(
  //     title: titleController.text.trim(),
  //     description: descriptionController.text.trim(),
  //   );

  //   result.fold(
  //     (failure) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(AppStrings.failedToAddTask.tr()),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //     },
  //     (_) {
  //       Navigator.pop(context);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //          SnackBar(
  //           content: Text(AppStrings.taskAddedSuccessfully.tr()),
  //           backgroundColor: Colors.green,
  //         ),
  //       );
  //     },
  //   );
  // }

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 25,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
             AppStrings.addNewTask.tr(),
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: '${AppStrings.title.tr()} *',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 12),
            MyTaskTextFields(
            controller: descriptionController,
            hintText :AppStrings.description.tr(),
          

            ),
           
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed:()=>
               AddTaskUseCase(
                getIt<TasksRepo>(),
              ).call(title: titleController.text,description: descriptionController.text),
              icon: const Icon(Icons.add, color: Colors.white),
              label:  Text(
                AppStrings.addTask.tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}
