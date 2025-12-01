import 'package:shadowrun_6e_player_helper_view_model/features/item/i_category_view_model.dart';

class CategoryViewModel implements ICategoryViewModel {
  @override
  final String name;

  const CategoryViewModel({required this.name});
}
