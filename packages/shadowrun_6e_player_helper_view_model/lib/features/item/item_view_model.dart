import 'package:shadowrun_6e_player_helper_domain/domain.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_category_view_model.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_item_view_model.dart';

import 'category_view_model.dart';

class ItemViewModel implements IItemViewModel {
  final Item _item;
  @override
  String get name => _item.name;

  @override
  Map<String, String?> get properties => _item.properties;

  ItemViewModel({required Item item}) : _item = item {
    category = CategoryViewModel(category: item.category);
  }

  @override
  late final ICategoryViewModel category;
}

// const _testProperties = {
//   "Type": "Pistol",
//   "ATK": "2/10/3/-/-",
//   "DMG": "4S",
//   "Mode": "SS/SA",
// };

// const defaultWeapon = ItemViewModel(
//   name: 'Default Weapon',
//   category: CategoryViewModel(name: 'weapon'),
// );
// const defaultArmor = ItemViewModel(
//   name: 'Default Armor',
//   category: CategoryViewModel(name: 'armor'),
// );
