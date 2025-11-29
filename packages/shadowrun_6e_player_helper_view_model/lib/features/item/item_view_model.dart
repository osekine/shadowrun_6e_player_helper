import 'package:shadowrun_6e_player_helper_view_model/features/item/i_item_view_model.dart';

class ItemViewModel implements IItemViewModel {
  @override
  final String name;

  @override
  final Map<String, String> properties;

  const ItemViewModel({required this.name}) : properties = _testProperties;
}

const _testProperties = {
  "Type": "Pistol",
  "ATK": "2/10/3/-/-",
  "DMG": "4S",
  "Mode": "SS/SA",
};
