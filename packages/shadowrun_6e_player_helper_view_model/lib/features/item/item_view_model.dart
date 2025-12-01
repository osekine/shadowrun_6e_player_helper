import 'package:shadowrun_6e_player_helper_view_model/features/item/i_category_view_model.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_item_view_model.dart';

import 'category_view_model.dart';

class ItemViewModel implements IItemViewModel {
  @override
  final String name;

  @override
  final Map<String, String> properties;

  const ItemViewModel({required this.name, required this.category})
    : properties = _testProperties;

  // TODO(NLU): remove when add correct logic
  @override
  final ICategoryViewModel category;
}

const _testProperties = {
  "Type": "Pistol",
  "ATK": "2/10/3/-/-",
  "DMG": "4S",
  "Mode": "SS/SA",
};

const defaultWeapon = ItemViewModel(
  name: 'Default Weapon',
  category: CategoryViewModel(name: 'weapon'),
);
const defaultArmor = ItemViewModel(
  name: 'Default Armor',
  category: CategoryViewModel(name: 'armor'),
);
