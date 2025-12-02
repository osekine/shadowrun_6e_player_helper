import 'package:shadowrun_6e_player_helper_domain/domain.dart';

abstract interface class IRepository {
  String get databaseId;
  Future<List<Item>> getItemsByCategory(Category category);
  Future<List<Item>> getAllItems();
  void addItem(Item item);
}

abstract interface class IItemRepository extends IRepository {
  @override
  String get databaseId => 'items';
}

abstract class IUserRepository extends IRepository {
  @override
  String get databaseId => 'user';
}
