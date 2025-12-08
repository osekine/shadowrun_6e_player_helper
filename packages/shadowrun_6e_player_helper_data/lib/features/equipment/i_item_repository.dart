import 'package:shadowrun_6e_player_helper_domain/domain.dart';

abstract interface class IItemRepository {
  String get databaseId;
  Future<List<Item>> getItemsByCategory(Category category);
  Future<List<Item>> getAllItems();
  Future<Item?> getItemFrom({required String itemName, required String table});
}
