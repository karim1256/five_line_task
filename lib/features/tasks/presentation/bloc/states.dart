sealed class TasksState {}

final class TaskInitialState extends TasksState {}

final class TasksStateToggle extends TasksState {}

final class TasksStateTogalFailure extends TasksState {}

final class TasksStateAdedSuccess extends TasksState {}

final class TasksStateAdedFailure extends TasksState {
  final String message;
  TasksStateAdedFailure({required this.message});
}

final class TasksStateDeleteSuccess extends TasksState {}

final class TasksStateDeleteFailure extends TasksState {
  final String message;
  TasksStateDeleteFailure({required this.message});
}

// Add these new states for update
final class TasksStateUpdateSuccess extends TasksState {}

final class TasksStateUpdateFailure extends TasksState {
  final String message;
  TasksStateUpdateFailure({required this.message});
}