import 'dart:async';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:injectable/injectable.dart';
import 'package:shadowrun_6e_player_helper_data/service/i_data_service.dart';
import 'package:shadowrun_6e_player_helper_domain/features/equipment/category.dart';

import 'package:shadowrun_6e_player_helper_domain/features/equipment/item.dart';
import 'package:sqflite/sqflite.dart';

import 'i_item_repository.dart';

@Injectable(as: IItemRepository)
class ItemRepository implements IItemRepository {
  Database? _database;
  final IDataService _dataService;

  @override
  Future<List<Item>> getAllItems() async {
    await _initDatabase();

    final database = _database;
    if (database == null) return [];

    // TODO(NLU): delete workarounds
    final table = 'weapons';
    final json = await database.query(table);

    final items = <Item>[];
    final preparedJson = _prepareJson(json, Category.weapon);
    for (var item in preparedJson) {
      items.add(Item.fromJson(item));
    }

    return items;
  }

  @override
  Future<List<Item>> getItemsByCategory(Category category) async {
    await _initDatabase();

    final database = _database;
    if (database == null) return [];

    late final List<Map<String, dynamic>> json;
    try {
      json = await database.query('${category.name}s');
    } on Exception catch (e) {
      debugPrint('Error in get items for category ${category.name} :: $e');
      return [];
    }

    final preparedJson = _prepareJson(json, category);
    final items = <Item>[];
    for (var item in preparedJson) {
      items.add(Item.fromJson(item));
    }

    return items;
  }

  ItemRepository({required IDataService dataService})
    : _dataService = dataService;

  @override
  String get databaseId => 'items';

  Future<void> _initDatabase() async {
    _database ??= await _dataService.getDatabase(databaseId, readOnly: true);
  }

  List<Map<String, Object?>> _prepareJson(
    List<Map<String, Object?>> jsonFromDatabase,
    Category category,
  ) => jsonFromDatabase
      .map((e) {
        return Map.fromEntries(e.entries);
      })
      .map(
        (e) => {
          'id': e['id'],
          'category': category.name.toLowerCase(),
          'name': e['name'],
          'properties': {
            for (var i in e.entries.where(
              (entry) =>
                  entry.key != 'id' &&
                  entry.key != 'name' &&
                  entry.key != 'equipment_category' &&
                  entry.value != null,
            ))
              i.key: '${i.value}',
          },
        },
      )
      .toList();
}
