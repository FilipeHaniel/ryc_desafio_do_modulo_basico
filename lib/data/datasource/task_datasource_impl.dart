import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ryc_desafio_do_modulo_basico/core/exception/task_fetch_exception.dart';
import 'package:ryc_desafio_do_modulo_basico/data/datasource/task_datasource.dart';
import 'package:ryc_desafio_do_modulo_basico/data/model/task_model.dart';

@Injectable(as: TaskDatasource)
class TaskDatasourceImpl implements TaskDatasource {
  final _url =
      'https://tyc-desafio-modulo-basico-default-rtdb.firebaseio.com/tasks.json';

  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      final response = await Dio().get(_url);

      final Map<String, dynamic> parsedJson =
          response.data as Map<String, dynamic>;

      final List<TaskModel> tasks = parsedJson.entries.map((entry) {
        final Map<String, dynamic> taskData =
            entry.value as Map<String, dynamic>;
        return TaskModel.fromJson(taskData);
      }).toList();

      // final result = httpClient.data['tasksList']
      //     .map<TaskModel>((tasks) => TaskModel.fromJson(tasks))
      //     .toList();

      // httpClient.data.map<TaskModel>((tasks) {
      //   listTasks.add(TaskModel.fromJson(tasks));
      // });

      return tasks;
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

      await Dio().post(_url, data: task);
    } on Exception catch (error, stacktrace) {
      log('Erro ao cadastrar task', error: error, stackTrace: stacktrace);
      throw Exception();
    }
  }
}
