import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ryc_desafio_do_modulo_basico/core/injection/injection.config.dart';

final getIt = GetIt.asNewInstance();

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
GetIt configureDependencies() {
  init(getIt);

  return getIt;
}
