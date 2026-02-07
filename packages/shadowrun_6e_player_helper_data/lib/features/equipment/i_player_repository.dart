import 'package:shadowrun_6e_player_helper_domain/domain.dart';

abstract interface class IPlayerRepository {
  String get databaseId;
  Future<void> addItem(Item item);
  Future<void> removeItem(Item item, int index);
  List<Item> itemsOf({required Category category});
  List<Category> get activeCategories;
  Future<void> load();
}
