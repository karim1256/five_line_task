
sealed class TasksState {}

final class TaskInitialState extends TasksState {}

final class TasksStateToggle extends TasksState {}

final class TasksStateTogalFailure extends TasksState {}


final class TasksStateDeleteSuccess extends TasksState {}

final class TasksStateDeleteFailure extends TasksState {
  final String message;
  TasksStateDeleteFailure({required this.message});
}