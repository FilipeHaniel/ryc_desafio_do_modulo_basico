import 'package:injectable/injectable.dart';
import 'package:ryc_desafio_do_modulo_basico/data/datasource/task_datasource.dart';
import 'package:ryc_desafio_do_modulo_basico/domain/entity/task_entiy.dart';
import 'package:ryc_desafio_do_modulo_basico/domain/repository/task_repository.dart';

@Injectable(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final TaskDatasource _taskDatasource;

  TaskRepositoryImpl({required TaskDatasource taskDatasource})
      : _taskDatasource = taskDatasource;

  @override
  Future<List<TaskEntity>> getTasks() async {
    final result = await _taskDatasource.getTasks();

    return result;
  }
}
