class TaskEntity {
  final String taskTitle;
  final String? taskDescription;
  final DateTime taskDate;

  const TaskEntity({
    required this.taskTitle,
    this.taskDescription,
    required this.taskDate,
  });
}
