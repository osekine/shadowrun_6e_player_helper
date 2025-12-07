import 'package:shadowrun_6e_player_helper_domain/domain.dart';
import 'package:shadowrun_6e_player_helper_view_model/features/item/i_category_view_model.dart';

class CategoryViewModel implements ICategoryViewModel {
  final Category _category;
  @override
  String get name => _category.name;

  const CategoryViewModel({required Category category}) : _category = category;

  @override
  bool operator ==(Object other) {
    return other is ICategoryViewModel && name == other.name;
  }

  @override
  int get hashCode => _category.hashCode;
}
