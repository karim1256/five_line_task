import 'package:easy_localization/easy_localization.dart'; // Added import
import 'package:five_line_task/common/helpers.dart/is_dark_mode.dart';
import 'package:five_line_task/common/widgets/app_button.dart';
import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskTile extends StatelessWidget {
  final String id;
  final String title;
  final String? description;
  final bool isDone;
  final VoidCallback onToggle;
  final VoidCallback? onTap;
  final VoidCallback onDelete; 

  const TaskTile({
    super.key,
    required this.id,
    required this.title,
    this.description,
    required this.isDone,
    required this.onToggle,
    this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      margin: EdgeInsets.symmetric(vertical: 4.h),
      child: ListTile(
        onTap: onTap,
        onLongPress: () => _showDeleteDialog(context), 
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        leading: Checkbox(
          value: isDone,
          onChanged: (_) => onToggle(),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
          activeColor: AppColors.primary,
          visualDensity: VisualDensity.compact,
        ),
        title: Text(
          title,
          style: (context.isDarkMode
              ? AppTextTheme.headingMediumBold
              : AppTextTheme.headingLightBold
          ).copyWith(fontSize: 16.sp),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: description != null && description!.isNotEmpty
            ? Text(
                description!,
                style: (context.isDarkMode
                    ? AppTextTheme.bodySmallGrey
                    : AppTextTheme.bodySmallLight
                ).copyWith(fontSize: 14.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red, size: 22.w),
              onPressed: () => _showDeleteDialog(context),
              padding: EdgeInsets.all(8.w),
              constraints: BoxConstraints(minWidth: 40.w, minHeight: 40.w),
            ),
            Icon(Icons.edit, color: AppColors.primary, size: 22.w),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delete Task'.tr(), // Added .tr()
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Are you sure you want to delete "$title"?'.tr(), // Added .tr()
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'Cancel'.tr(), // Added .tr()
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    AppButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onDelete();
                      },
                      title: Text(
                        'Delete'.tr(), // Added .tr()
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Colors.red,
                      height: 40.h,
                      borderRadius: 8.r,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}