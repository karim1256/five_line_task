import 'package:easy_localization/easy_localization.dart'; // Added import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:five_line_task/app_route.dart';
import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:five_line_task/features/welcome/presentation/widgets/ThemeModeRow.dart';
import 'package:five_line_task/features/welcome/presentation/widgets/languageRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildDrawer(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;

  String displayName = 'Guest User'.tr(); // Added .tr()
  if (user != null) {
    if (user.displayName != null && user.displayName!.isNotEmpty) {
      displayName = user.displayName!;
    } else if (user.email != null && user.email!.isNotEmpty) {
      displayName = user.email!.split('@')[0]; 
    }
  }

  return Drawer(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.r),
        bottomRight: Radius.circular(20.r),
      ),
    ),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, Color.fromARGB(255, 11, 173, 2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 40.r,
                  backgroundColor: Colors.white,
                  backgroundImage: user?.photoURL != null
                      ? NetworkImage(user!.photoURL!)
                      : null,
                  child: user?.photoURL == null
                      ? Icon(
                          Icons.person,
                          size: 40.w,
                          color: AppColors.primary,
                        )
                      : null,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                displayName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user?.email ?? 'No Email'.tr(), // Added .tr()
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: ListView(
            padding: EdgeInsets.all(15.w),
            children: [
              Padding(
                padding: EdgeInsets.all(10.w),
                child: ThemeModeRow(),
              ),
              SizedBox(height: 10.h),
              const Divider(),
              SizedBox(height: 10.h),

              Padding(
                padding: EdgeInsets.all(10.w),
                child: LanguageRow()
              ),
              const Divider(),
              _drawerItem(
                icon: Icons.logout,
                text: 'Logout'.tr(), // Added .tr()
                color: Colors.red,
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.signIn,
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _drawerItem({
  required IconData icon,
  required String text,
  required VoidCallback onTap,
  Color? color,
}) {
  return ListTile(
    leading: Icon(icon, color: color ?? AppColors.primary, size: 24.w),
    title: Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        color: color ?? Colors.black87,
        fontWeight: FontWeight.w500,
      ),
    ),
    hoverColor: AppColors.primary.withOpacity(0.05),
    onTap: onTap,
  );
}