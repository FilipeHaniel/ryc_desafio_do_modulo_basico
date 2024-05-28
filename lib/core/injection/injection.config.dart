// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource/task_datasource.dart' as _i3;
import '../../data/datasource/task_datasource_impl.dart' as _i4;
import '../../data/repository/task_repository_impl.dart' as _i6;
import '../../domain/repository/task_repository.dart' as _i5;
import '../../domain/usecase/task_usecase.dart' as _i7;
import '../../domain/usecase/task_usecase_impl.dart' as _i8;
import '../../presentation/application/task_cubit.dart' as _i9;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.TaskDatasource>(() => _i4.TaskDatasourceImpl());
  gh.factory<_i5.TaskRepository>(
      () => _i6.TaskRepositoryImpl(taskDatasource: gh<_i3.TaskDatasource>()));
  gh.factory<_i7.TaskUsecase>(
      () => _i8.TaskUsecaseImpl(taskRepository: gh<_i5.TaskRepository>()));
  gh.factory<_i9.TaskCubit>(
      () => _i9.TaskCubit(taskUsecase: gh<_i7.TaskUsecase>()));
  return getIt;
}
