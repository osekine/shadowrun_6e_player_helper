import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shadowrun_6e_player_helper_data/data.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/category_view_model.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_category_view_model.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_equipment_view_model.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_item_view_model.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/item_view_model.dart';

@Injectable(as: IEquipmentViewModel)
class EquipmentViewModel implements IEquipmentViewModel {
  final IPlayerRepository _repository;
  final Map<ICategoryViewModel, ValueNotifier<List<IItemViewModel>>> _allItems =
      <ICategoryViewModel, ValueNotifier<List<IItemViewModel>>>{};
  final ValueNotifier<Set<ICategoryViewModel>> _categories = ValueNotifier({});

  EquipmentViewModel({required IPlayerRepository repository})
    : _repository = repository;

  @postConstruct
  void init() {
    final categories = _repository.activeCategories;
    for (final cat in categories) {
      final categoryVm = CategoryViewModel(category: cat);
      _categories.value.add(categoryVm);
      _allItems.putIfAbsent(categoryVm, () => ValueNotifier([]));
      _allItems[categoryVm]!.value = _repository
          .itemsOf(category: cat)
          .map((i) => ItemViewModel(item: i))
          .toList();
    }
  }

  @override
  void addItem(IItemViewModel newItem) {
    _categories.value = {..._categories.value, newItem.category};
    _allItems.putIfAbsent(newItem.category, () => ValueNotifier([]));
    _allItems[newItem.category]!.value = [
      ..._allItems[newItem.category]!.value,
      newItem,
    ];
  }

  @override
  void removeItem() {}

  @override
  ValueListenable<Set<ICategoryViewModel>> get categories => _categories;

  @override
  ValueListenable<List<IItemViewModel>> items({
    required ICategoryViewModel category,
  }) => _allItems[category]!;
}
