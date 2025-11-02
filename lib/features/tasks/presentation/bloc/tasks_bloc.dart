import 'package:five_line_task/common/helpers.dart/get_it.dart';
import 'package:five_line_task/features/tasks/domain/repo/tasks_repo.dart';
import 'package:five_line_task/features/tasks/domain/usecases/add_task.dart';
import 'package:five_line_task/features/tasks/domain/usecases/toggle_done.dart';
import 'package:five_line_task/features/tasks/domain/usecases/delete_task.dart';
import 'package:five_line_task/features/tasks/domain/usecases/update_task.dart'; // Add this import
import 'package:five_line_task/features/tasks/presentation/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit(this.tasksRepo) : super(TaskInitialState());

  final TasksRepo tasksRepo;

  Future<void> toggleTaskState({
    required String taskId,
    required bool? currentState,
  }) async {
    final result = await ToggleDoneCase(
      tasksRepo,
    ).call(docId: taskId, currentValue: currentState ?? false);

    result.fold(
      (failure) {
        print("------------------fail---------------------");
        emit(TasksStateTogalFailure());
      },
      (userEntity) {
        print("------------------success---------------------");
        emit(TasksStateToggle());
      },
    );
  }

  Future<void> addTasks({
    required String title,
    required String description,
  }) async {
    final result = await AddTaskUseCase(
      getIt<TasksRepo>(),
    ).call(title: title, description: description);

    result.fold(
      (failure) {
        print("------------------fail---------------------");
        emit(TasksStateAdedFailure(message: failure.toString()));
      },
      (userEntity) {
        print("------------------success---------------------");
        emit(TasksStateAdedSuccess());
      },
    );
  }

  Future<void> deleteTask(String taskId) async {
    try {
      final result = await DeleteTaskUseCase(tasksRepo).call(docId: taskId);

      result.fold(
        (failure) {
          print("------------------delete fail---------------------");
          emit(TasksStateDeleteFailure(message: failure.toString()));
        },
        (_) {
          print("------------------delete success---------------------");
          emit(TasksStateDeleteSuccess());
        },
      );
    } catch (e) {
      print("------------------delete error: $e---------------------");
      emit(TasksStateDeleteFailure(message: e.toString()));
    }
  }

  // Add this new method for updating tasks
  Future<void> updateTask({
    required String docId,
    required String title,
    required String description,
  }) async {
    final result = await UpdateTaskUseCase(tasksRepo).call(
      docId: docId,
      title: title,
      description: description,
    );

    result.fold(
      (failure) {
        print("------------------update fail---------------------");
        emit(TasksStateUpdateFailure(message: failure.toString()));
      },
      (_) {
        print("------------------update success---------------------");
        emit(TasksStateUpdateSuccess());
      },
    );
  }
}