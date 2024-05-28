class TaskEntity {
  final String taskTitle;
  final int daysRemaining;
  final bool isExpired;

  const TaskEntity({
    required this.taskTitle,
    required this.daysRemaining,
    required this.isExpired,
  });
}
