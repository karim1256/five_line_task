import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:five_line_task/app_route.dart';
import 'package:five_line_task/common/helpers.dart/get_it.dart';
import 'package:five_line_task/common/widgets/appbar.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/assets_path/app_images.dart';
import 'package:five_line_task/core/constants/assets_path/app_vectors.dart';
import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:five_line_task/features/tasks/domain/repo/tasks_repo.dart';
import 'package:five_line_task/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:five_line_task/features/tasks/presentation/screens/list_tasks_body.dart';
import 'package:five_line_task/features/welcome/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:five_line_task/features/welcome/presentation/widgets/mood_vector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/add_task_sheet.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(getIt<TasksRepo>()),
      child: Scaffold(
        drawer: buildDrawer(context),
        appBar: MyTaskAppBar(),
        body: const TasksBody(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showAddTaskSheet(context),
          backgroundColor: AppColors.primary,
          icon: const Icon(Icons.add, color: Colors.white),
          label: Text(
            AppStrings.addTask.tr(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    // 🧠 Fallback logic for name
    String displayName = 'Guest User';
    if (user != null) {
      if (user.displayName != null && user.displayName!.isNotEmpty) {
        displayName = user.displayName!;
      } else if (user.email != null && user.email!.isNotEmpty) {
        displayName = user.email!.split('@')[0]; // part before @
      }
    }

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // 🔹 Modern Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
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
                    radius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage: user?.photoURL != null
                        ? NetworkImage(user!.photoURL!)
                        : null,
                    child: user?.photoURL == null
                        ? const Icon(
                            Icons.person,
                            size: 40,
                            color: AppColors.primary,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  displayName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user?.email ?? 'No Email',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.all(15),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MoodVector(
                        onTap: () {
                          context.read<ThemeCubit>().updateTheme(
                            ThemeMode.light,
                          );
                        },
                        title: AppStrings.lightMood.tr(),
                        vectorName: AppVectors.sun,
                      ),
                      SizedBox(width: 20.w),
                      MoodVector(
                        onTap: () {
                          context.read<ThemeCubit>().updateTheme(
                            ThemeMode.dark,
                          );
                        },

                        title: AppStrings.darkMood.tr(),
                        vectorName: AppVectors.moon,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                const Divider(),
                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MoodVector(
                        onTap: () {
                          context.setLocale(Locale("ar"));
                        },
                        title: AppStrings.arabic.tr(),
                        imageName: AppImages.arabic,
                      ),
                      SizedBox(width: 50.w),
                      MoodVector(
                        onTap: () {
                          context.setLocale(Locale("en"));
                        },
                        title: AppStrings.english.tr(),
                        imageName: AppImages.english,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                _drawerItem(
                  icon: Icons.logout,
                  text: 'Logout',
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
      leading: Icon(icon, color: color ?? AppColors.primary),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: color ?? Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      hoverColor: AppColors.primary.withOpacity(0.05),
      onTap: onTap,
    );
  }
}
