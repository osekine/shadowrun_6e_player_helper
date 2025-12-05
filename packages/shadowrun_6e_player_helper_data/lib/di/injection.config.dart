// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/equipment/i_item_repository.dart' as _i357;
import '../features/equipment/item_repository.dart' as _i699;
import '../service/data_service.dart' as _i9;
import '../service/i_data_service.dart' as _i1044;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i1044.IDataService>(() => _i9.DataService()..init());
    gh.factoryAsync<_i357.IItemRepository>(() {
      final i = _i699.ItemRepository(dataService: gh<_i1044.IDataService>());
      return i.init().then((_) => i);
    });
    return this;
  }
}
