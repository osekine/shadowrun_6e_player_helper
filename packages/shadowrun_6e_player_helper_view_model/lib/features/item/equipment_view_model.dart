import 'package:injectable/injectable.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_category_view_model.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_equipment_view_model.dart';
import 'package:shadowrun_6e_player_helper_view_model/shadowrun_6e_player_helper_view_model.dart';

@Injectable(as: IEquipmentViewModel)
class EquipmentViewModel implements IEquipmentViewModel {
  final Map<ICategoryViewModel, Set<IItemViewModel>> _allItems =
      const <ICategoryViewModel, Set<IItemViewModel>>{};

  const EquipmentViewModel();

  @postConstruct
  void init() {
    // TODO(NLU) load categories and items from a data source

    addItem(defaultWeapon);
    addItem(defaultWeapon);
    addItem(defaultWeapon);
    addItem(defaultArmor);
  }

  @override
  void addItem(IItemViewModel item) {
    final categoryList = _allItems[item.category];

    if (categoryList != null) {
      categoryList.add(item);
      return;
    }

    _allItems[item.category] = {item};
  }

  @override
  List<ICategoryViewModel> get categories => _allItems.keys.toList();

  @override
  List<IItemViewModel> items({required ICategoryViewModel category}) {
    return _allItems[category]?.toList() ?? [];
  }
}
