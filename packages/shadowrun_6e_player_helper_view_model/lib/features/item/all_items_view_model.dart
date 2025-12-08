import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shadowrun_6e_player_helper_data/data.dart';
import 'package:shadowrun_6e_player_helper_domain/domain.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_category_view_model.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_all_items_view_model.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_item_view_model.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/item_view_model.dart';

import 'category_view_model.dart';

@Injectable(as: IAllItemsViewModel)
class AllItemsViewModel implements IAllItemsViewModel {
  final IItemRepository _itemRepository;
  final Map<ICategoryViewModel, List<IItemViewModel>> _allItems =
      <ICategoryViewModel, List<IItemViewModel>>{};

  AllItemsViewModel({required IItemRepository itemRepository})
    : _itemRepository = itemRepository;

  @postConstruct
  Future<void> init() async {
    final weapons = await _itemRepository.getItemsByCategory(Category.weapon);
    final armors = await _itemRepository.getItemsByCategory(Category.armor);
    final a = [...weapons, ...armors];
    for (var b in a) {
      final cat = CategoryViewModel(category: b.category);
      if (_allItems.containsKey(cat)) {
        _allItems[cat]?.add(ItemViewModel(item: b));
      } else {
        _allItems[cat] = [ItemViewModel(item: b)];
      }
    }
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
  List<ICategoryViewModel> get categories => const [
    CategoryViewModel(category: Category.weapon),
    CategoryViewModel(category: Category.armor),
  ];
  //_allItems.keys.toList();

  @override
  List<IItemViewModel> items({required ICategoryViewModel category}) {
    return _allItems[category] ?? [];
  }
}
