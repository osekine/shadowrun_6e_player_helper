import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shadowrun_6e_player_helper_data/data.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_category_view_model.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_equipment_view_model.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_item_view_model.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/item_view_model.dart';

import 'category_view_model.dart';

@Injectable(as: IEquipmentViewModel)
class EquipmentViewModel implements IEquipmentViewModel {
  final IItemRepository _itemRepository;
  final Map<ICategoryViewModel, List<IItemViewModel>> _allItems =
      <ICategoryViewModel, List<IItemViewModel>>{};

  EquipmentViewModel({required IItemRepository itemRepository})
    : _itemRepository = itemRepository;

  @postConstruct
  Future<void> init() async {
    final a = await _itemRepository.getAllItems();
    for (var b in a) {
      final cat = CategoryViewModel(category: b.category);
      if (_allItems.containsKey(cat)) {
        _allItems[cat]?.add(ItemViewModel(item: b));
      } else {
        _allItems[cat] = [ItemViewModel(item: b)];
      }
    }
    print(_allItems.keys);
  }

  @override
  void addItem(IItemViewModel item) {
    final categoryList = _allItems[item.category];

    if (categoryList != null) {
      categoryList.add(item);
      return;
    }

    _allItems[item.category] = [item];
  }

  @override
  List<ICategoryViewModel> get categories => _allItems.keys.toList();

  @override
  List<IItemViewModel> items({required ICategoryViewModel category}) {
    return _allItems[category] ?? [];
  }
}
