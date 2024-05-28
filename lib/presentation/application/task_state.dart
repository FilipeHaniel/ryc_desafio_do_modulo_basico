part of 'task_cubit.dart';

@freezed
abstract class TaskState with _$TaskState {
  factory TaskState.initial() = _initial;
  factory TaskState.loading() = _loading;
  factory TaskState.success({required List<TaskEntity> tasks}) = _success;
  factory TaskState.error({required TaskFetchException error}) = _error;
}
