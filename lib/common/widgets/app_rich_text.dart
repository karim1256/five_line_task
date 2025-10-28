    import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


              Widget appRichText({required String? text1, String? text2}) {
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: text1,
                        style: TextStyle(color: AppColors.lightTitle),
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