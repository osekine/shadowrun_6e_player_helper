import 'package:flutter/foundation.dart';
import 'package:shadowrun_6e_player_helper_view_model/common/loading_state.dart';

import 'i_category_view_model.dart';
import 'i_item_view_model.dart';

abstract interface class IEquipmentViewModel {
  ValueListenable<Set<ICategoryViewModel>> get categories;
  ValueListenable<List<IItemViewModel>> items({
    required ICategoryViewModel category,
  });
  ValueListenable<LoadingState> get loadingState;
  void addItem(IItemViewModel newItem);
  void removeItem(IItemViewModel removeItem, int index);
  // void updateItem();
}
