import 'package:five_line_task/features/tasks/domain/repo/tasks_repo.dart';
import 'package:five_line_task/features/tasks/domain/usecases/toggle_done.dart';
import 'package:five_line_task/features/tasks/domain/usecases/delete_task.dart'; // Add this import
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
}