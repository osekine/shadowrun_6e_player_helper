//@GeneratedMicroModule;Shadowrun6ePlayerHelperDataPackageModule;package:shadowrun_6e_player_helper_data/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:shadowrun_6e_player_helper_data/features/equipment/i_item_repository.dart'
    as _i1072;
import 'package:shadowrun_6e_player_helper_data/features/equipment/item_repository.dart'
    as _i428;
import 'package:shadowrun_6e_player_helper_data/service/data_service.dart'
    as _i387;
import 'package:shadowrun_6e_player_helper_data/service/i_data_service.dart'
    as _i352;

class Shadowrun6ePlayerHelperDataPackageModule
    extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i352.IDataService>(() => _i387.DataService()..init());
    gh.factory<_i1072.IItemRepository>(
        () => _i428.ItemRepository(dataService: gh<_i352.IDataService>()));
  }
}
