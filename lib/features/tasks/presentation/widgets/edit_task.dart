import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/common/widgets/app_button.dart';
import 'package:five_line_task/common/widgets/app_text_form_field.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:five_line_task/features/tasks/presentation/bloc/states.dart';
import 'package:five_line_task/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void editTask({
  required BuildContext context,
  required String docId,
  required String title,
  required String? description,
  required TasksCubit tasksCubit, // Add TasksCubit as required parameter
}) {
  final TextEditingController titleController = TextEditingController(
    text: title,
  );
  final TextEditingController descriptionController = TextEditingController(
    text: description ?? '',
  );

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    builder: (context) {
      return BlocProvider.value( // Use BlocProvider.value instead of BlocListener
        value: tasksCubit,
        child: BlocListener<TasksCubit, TasksState>(
          listener: (context, state) {
            if (state is TasksStateUpdateSuccess) {
              Navigator.pop(context);
            } else if (state is TasksStateUpdateFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
              left: 16.w,
              right: 16.w,
              top: 20.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.editTask.tr(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                MyTaskTextFields(
                controller: titleController,
                hintText:  '${AppStrings.title.tr()} *',
              ),
                
                SizedBox(height: 10.h),
                MyTaskTextFields(
                controller: descriptionController,
                hintText:  AppStrings.description.tr() ,
              ),
               
                SizedBox(height: 15.h),
                BlocBuilder<TasksCubit, TasksState>(
                  builder: (context, state) {
                    return AppButton(
                      onPressed: () {
                        final newTitle = titleController.text.trim();
                        final newDescription = descriptionController.text.trim();

                        if (newTitle.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(AppStrings.titleCannotBeEmpty.tr())), // Added .tr()
                          );
                          return;
                        }

                        context.read<TasksCubit>().updateTask(
                          docId: docId,
                          title: newTitle,
                          description: newDescription,
                        );
                      },
                      title: Text(
                        AppStrings.saveChanges.tr(), // Added .tr()
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: AppColors.primary,
                      isFullWidth: true,
                      height: 50.h,
                      borderRadius: 8.r,
                    );
                  },
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      );
    },
  );
}