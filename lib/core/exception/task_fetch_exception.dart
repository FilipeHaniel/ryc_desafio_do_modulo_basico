class TaskFetchException implements Exception {
  final String errorMessage;

  TaskFetchException(this.errorMessage);
}
