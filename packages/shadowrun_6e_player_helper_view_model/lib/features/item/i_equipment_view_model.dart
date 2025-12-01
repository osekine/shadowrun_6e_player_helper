import 'package:shadowrun_6e_player_helper_view_model/features/item/i_category_view_model.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_item_view_model.dart';

abstract interface class IEquipmentViewModel {
  List<ICategoryViewModel> get categories;
  List<IItemViewModel> items({required ICategoryViewModel category});
  void addItem(IItemViewModel item);
}
