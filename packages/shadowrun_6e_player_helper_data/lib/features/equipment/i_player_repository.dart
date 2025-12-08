import 'package:shadowrun_6e_player_helper_domain/domain.dart';

abstract interface class IPlayerRepository {
  String get databaseId;
  Future<void> addItem();
  Future<void> removeItem();
  List<Item> itemsOf({required Category category});
  List<Category> get activeCategories;
}
