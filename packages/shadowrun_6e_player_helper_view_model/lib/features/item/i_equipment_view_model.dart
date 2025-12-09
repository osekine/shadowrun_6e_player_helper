import 'package:flutter/foundation.dart';

import 'i_category_view_model.dart';
import 'i_item_view_model.dart';

abstract interface class IEquipmentViewModel {
  ValueListenable<Set<ICategoryViewModel>> get categories;
  ValueListenable<List<IItemViewModel>> items({
    required ICategoryViewModel category,
  });
  void addItem(IItemViewModel newItem);
  void removeItem();
  // void updateItem();
}
