import 'package:ryc_desafio_do_modulo_basico/domain/entity/task_entiy.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.taskTitle,
    required super.daysRemaining,
    required super.isExpired,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskTitle: json['taskTitle'],
      daysRemaining: json['daysRemaining'],
      isExpired: json['isExpired'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'taskTitle': taskTitle,
      'daysRemaining': daysRemaining,
      'isExpired': isExpired,
    };
  }
}
