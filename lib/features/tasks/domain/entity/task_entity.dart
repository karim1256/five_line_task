class TaskEntity {
  final String taskId;
  final String title;
  final String description; // Fixed typo: describtion -> description
  
  TaskEntity({
    required this.taskId,
    required this.title,
    required this.description,
  });
}