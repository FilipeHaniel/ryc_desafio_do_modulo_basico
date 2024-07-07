import 'package:ryc_desafio_do_modulo_basico/domain/entity/task_entiy.dart';

abstract class TaskUsecase {
  Future<List<TaskEntity>> getTasks();

  Future<void> postTask(TaskEntity taskEntity);
}
