import 'package:flutter/foundation.dart' show debugPrint;
import 'package:injectable/injectable.dart';
import 'package:shadowrun_6e_player_helper_data/service/i_data_service.dart';
import 'package:shadowrun_6e_player_helper_domain/features/equipment/category.dart';

import 'package:shadowrun_6e_player_helper_domain/features/equipment/item.dart';
import 'package:sqflite/sqflite.dart';

import 'i_item_repository.dart';

@Injectable(as: IItemRepository)
class ItemRepository implements IItemRepository {
  late final Database _database;
  final IDataService _dataService;

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
    late final List<Map<String, dynamic>> json;
    try {
      json = await _database.query(category.name);
    } on Exception catch (e) {
      debugPrint('Error in get items for category ${category.name} :: $e');
      return [];
    }

    // TODO(NLU): need mapping
    final preparedJson = json;
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
    _database = await _dataService.getDatabase(databaseId, readOnly: true);
  }

  @override
  String get databaseId => 'items';
}
