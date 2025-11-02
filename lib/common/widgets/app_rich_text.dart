    import 'package:five_line_task/common/helpers.dart/is_dark_mode.dart';
import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

              Widget appRichText({required String? text1,required String? text2,required  BuildContext context}) {
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: text1,
                        style: 
                         context.isDarkMode
                      ? AppTextTheme.bodySmallGrey
                      : AppTextTheme.bodySmallLight,
                        
                        
                        ),
                      
                      WidgetSpan(child: SizedBox(width: 5.w)),
                      TextSpan(
                        text: text2,
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                );
              }    