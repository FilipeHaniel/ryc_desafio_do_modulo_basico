import 'package:injectable/injectable.dart';
import 'package:ryc_desafio_do_modulo_basico/domain/entity/task_entiy.dart';
import 'package:ryc_desafio_do_modulo_basico/domain/repository/task_repository.dart';
import 'package:ryc_desafio_do_modulo_basico/domain/usecase/task_usecase.dart';

@Injectable(as: TaskUsecase)
class TaskUsecaseImpl implements TaskUsecase {
  final TaskRepository _taskRepository;

  TaskUsecaseImpl({required TaskRepository taskRepository})
      : _taskRepository = taskRepository;

  @override
  Future<List<TaskEntity>> getTasks() {
    final result = _taskRepository.getTasks();

    return result;
  }
}
