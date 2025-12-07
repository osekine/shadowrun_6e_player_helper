import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shadowrun_6e_player_helper_view_model/di/injection.module.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  includeMicroPackages: false,
  externalPackageModulesBefore: [
    ExternalModule(Shadowrun6ePlayerHelperViewModelPackageModule),
  ],
)
Future<void> configureDependencies() async => getIt.init();
