import 'package:ryc_desafio_do_modulo_basico/data/model/task_model.dart';

abstract class TaskDatasource {
  Future<List<TaskModel>> getTasks();

  Future<void> postTask(TaskModel taskModel);
}
