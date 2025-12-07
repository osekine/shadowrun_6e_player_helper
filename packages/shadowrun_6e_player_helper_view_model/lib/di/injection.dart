import 'package:injectable/injectable.dart';
import 'package:shadowrun_6e_player_helper_data/di/injection.module.dart';

@InjectableInit.microPackage(
  externalPackageModulesBefore: [
    ExternalModule(Shadowrun6ePlayerHelperDataPackageModule),
  ],
)
void initMicroPackage() {}
