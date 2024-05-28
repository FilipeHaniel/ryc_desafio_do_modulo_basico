import 'package:ryc_desafio_do_modulo_basico/domain/entity/task_entiy.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> getTasks();
}
