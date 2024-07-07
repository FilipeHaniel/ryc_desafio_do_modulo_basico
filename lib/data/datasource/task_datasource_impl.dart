import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ryc_desafio_do_modulo_basico/core/exception/task_fetch_exception.dart';
import 'package:ryc_desafio_do_modulo_basico/data/datasource/task_datasource.dart';
import 'package:ryc_desafio_do_modulo_basico/data/model/task_model.dart';

@Injectable(as: TaskDatasource)
class TaskDatasourceImpl implements TaskDatasource {
  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      final httpClient = await Dio().get('http://localhost:3001/api/tasks');

      final result = httpClient.data['tasksList']
          .map<TaskModel>((tasks) => TaskModel.fromJson(tasks))
          .toList();

      return result;
    } on TaskFetchException catch (error, stacktrace) {
      log('Erro ao carregar tasks', error: error, stackTrace: stacktrace);

      throw TaskFetchException(error.errorMessage);
    } on DioException catch (error) {
      log('Erro ao carregar tasks', error: error);

      throw TaskFetchException('${error.response!.statusCode}');
    }
  }

  @override
  Future<void> postTask(TaskModel taskModel) async {
    try {
      final task = taskModel.toJson();

      await Dio().post(
        'https://tyc-desafio-modulo-basico-default-rtdb.firebaseio.com/tasks.json',
        data: task,
      );
    } on Exception catch (error, stacktrace) {
      log('Erro ao cadastrar task', error: error, stackTrace: stacktrace);
      throw Exception();
    }
  }
}
