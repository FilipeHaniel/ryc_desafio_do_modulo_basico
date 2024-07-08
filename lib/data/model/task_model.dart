import 'package:ryc_desafio_do_modulo_basico/domain/entity/task_entiy.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.taskTitle,
    super.taskDescription,
    required super.taskDate,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {

    if (json['taskDate'] == null) {
      throw ArgumentError('taskDate is required and must not be null');
    }

    return TaskModel(
      taskTitle: json['taskTitle'] as String,
      taskDescription: json['taskDescription'] as String?,
      taskDate: DateTime.parse(json['taskDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'taskTitle': taskTitle,
      'taskDescription': taskDescription,
      'taskDate': taskDate.toIso8601String(),
    };
  }
}
