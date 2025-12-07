import 'package:shadowrun_6e_player_helper_view_model/features/item/i_category_view_model.dart';

abstract interface class IItemViewModel {
  String get name;
  Map<String, String?> get properties;
  ICategoryViewModel get category;
}
