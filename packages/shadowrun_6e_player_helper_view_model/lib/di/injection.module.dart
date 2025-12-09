//@GeneratedMicroModule;Shadowrun6ePlayerHelperViewModelPackageModule;package:shadowrun_6e_player_helper_view_model/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:shadowrun_6e_player_helper_data/data.dart' as _i608;
import 'package:shadowrun_6e_player_helper_data/di/injection.module.dart'
    as _i260;
import 'package:shadowrun_6e_player_helper_view_model/features/item/all_items_view_model.dart'
    as _i957;
import 'package:shadowrun_6e_player_helper_view_model/features/item/equipment_view_model.dart'
    as _i411;
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_all_items_view_model.dart'
    as _i764;
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_equipment_view_model.dart'
    as _i303;

class Shadowrun6ePlayerHelperViewModelPackageModule
    extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    await _i260.Shadowrun6ePlayerHelperDataPackageModule().init(gh);
    gh.factoryAsync<_i764.IAllItemsViewModel>(() {
      final i =
          _i957.AllItemsViewModel(itemRepository: gh<_i608.IItemRepository>());
      return i.init().then((_) => i);
    });
    gh.factory<_i303.IEquipmentViewModel>(() =>
        _i411.EquipmentViewModel(repository: gh<_i608.IPlayerRepository>())
          ..init());
  }
}
