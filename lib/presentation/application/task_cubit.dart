import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ryc_desafio_do_modulo_basico/core/exception/task_fetch_exception.dart';
import 'package:ryc_desafio_do_modulo_basico/domain/entity/task_entiy.dart';
import 'package:ryc_desafio_do_modulo_basico/domain/usecase/task_usecase.dart';

part 'task_state.dart';
part 'task_cubit.freezed.dart';

@Injectable()
class TaskCubit extends Cubit<TaskState> {
  final TaskUsecase _taskUsecase;

  TaskCubit({required TaskUsecase taskUsecase})
      : _taskUsecase = taskUsecase,
        super(TaskState.initial());

  Future<void> fetchAlltasks() async {
    try {
      emit(TaskState.loading());

      final tasks = await _taskUsecase.getTasks();

      emit(TaskState.success(tasks: tasks));
    } on TaskFetchException catch (error, stacktrace) {
      log('Erro ao carregar tasks', error: error, stackTrace: stacktrace);

      emit(TaskState.error(error: error));
    }
  }
}
