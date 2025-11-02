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


void showAddTaskSheet(BuildContext context, TasksCubit tasksCubit) {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return BlocProvider.value(
        value: tasksCubit,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20.w,
            right: 20.w,
            top: 25.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                AppStrings.addNewTask.tr(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
            
               MyTaskTextFields(
                controller: titleController,
                hintText:  '${AppStrings.title.tr()} *',
              ),
              SizedBox(height: 12.h),
              MyTaskTextFields(
                controller: descriptionController,
                hintText: AppStrings.description.tr(),
              ),
              SizedBox(height: 20.h),
              BlocConsumer<TasksCubit, TasksState>(
                listener: (context, state) {
                  if (state is TasksStateAdedSuccess) {
                    Navigator.pop(context);
                  } else if (state is TasksStateAdedFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    onPressed: () {
                      tasksCubit.addTasks(
                        title: titleController.text,
                        description: descriptionController.text,
                      );
                    },
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, color: Colors.white, size: 20.w),
                        SizedBox(width: 8.w),
                        Text(
                          AppStrings.addTask.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: AppColors.primary,
                    isFullWidth: true,
                    height: 50.h,
                    borderRadius: 10.r,
                  );
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      );
    },
  );
}