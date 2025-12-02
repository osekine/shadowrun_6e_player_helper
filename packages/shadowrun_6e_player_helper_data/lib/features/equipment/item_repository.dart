import 'package:injectable/injectable.dart';
import 'package:shadowrun_6e_player_helper_data/service/i_data_service.dart';
import 'package:shadowrun_6e_player_helper_domain/features/equipment/category.dart';

import 'package:shadowrun_6e_player_helper_domain/features/equipment/item.dart';
import 'package:sqflite/sqflite.dart';

import 'i_repository.dart';

@Injectable(as: IItemRepository)
class ItemRepository implements IItemRepository {
  late final Database _database;
  final IDataService _dataService;
  @override
  void addItem(Item item) {}

  @override
  Future<List<Item>> getAllItems() async {
    final json = await _database.query('');

    // TODO(NLU) prepare json
    final preparedJson = [];
    final items = <Item>[];
    for (var item in preparedJson) {
      items.add(Item.fromJson(item));
    }

    return items;
  }

  @override
  Future<List<Item>> getItemsByCategory(Category category) async {
    final json = await _database.query('');

    // TODO(NLU) prepare json
    final preparedJson = [];
    final items = <Item>[];
    for (var item in preparedJson) {
      items.add(Item.fromJson(item));
    }

    return items;
  }

  ItemRepository({required IDataService dataService})
    : _dataService = dataService;

  @postConstruct
  Future<void> init() async {
    _database = await _dataService.getDatabase(databaseId);
  }

  @override
  String get databaseId => 'item';
}
