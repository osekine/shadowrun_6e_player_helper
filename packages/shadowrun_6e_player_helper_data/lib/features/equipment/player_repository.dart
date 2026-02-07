import 'dart:async';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:injectable/injectable.dart';
import 'package:shadowrun_6e_player_helper_data/features/equipment/i_item_repository.dart';
import 'package:shadowrun_6e_player_helper_data/features/equipment/i_player_repository.dart';
import 'package:shadowrun_6e_player_helper_data/service/i_data_service.dart';
import 'package:shadowrun_6e_player_helper_domain/domain.dart';
import 'package:sqflite/sqflite.dart';

@Singleton(as: IPlayerRepository)
class PlayerRepository implements IPlayerRepository {
  final IDataService _dataService;
  final IItemRepository _itemRepository;
  final _weaponTable = 'weapon';
  final _armorTable = 'armor';
  final Map<Category, Map<String, Item>> _items = {};
  Database? _playerDb;

  PlayerRepository({
    required IDataService dataService,
    required IItemRepository itemRepository,
  }) : _dataService = dataService,
       _itemRepository = itemRepository;

  @postConstruct
  void init() {
    unawaited(_initDatabase());
  }

  @override
  Future<void> addItem(Item item) async {
    late final String table;
    switch (item.category) {
      case Category.weapon:
        table = _weaponTable;
        break;
      case Category.armor:
        table = _armorTable;
        break;
      case Category.electronics:
        throw UnimplementedError();
      case Category.consumables:
        throw UnimplementedError();
      case Category.augmentations:
        throw UnimplementedError();
      case Category.magic:
        throw UnimplementedError();
      case Category.vehicle:
        throw UnimplementedError();
      case Category.drone:
        throw UnimplementedError();
    }

    final db = _playerDb;
    if (db == null) return;

    await db.insert(table, {
      '${table}_id': item.name,
      'accessories': [for (final accessory in item.attachments) accessory.name],
    });
  }

  @override
  Future<void> removeItem(Item item, int index) async {
    late final String table;
    switch (item.category) {
      case Category.weapon:
        table = _weaponTable;
        break;
      case Category.armor:
        table = _armorTable;
        break;
      case Category.electronics:
        throw UnimplementedError();
      case Category.consumables:
        throw UnimplementedError();
      case Category.augmentations:
        throw UnimplementedError();
      case Category.magic:
        throw UnimplementedError();
      case Category.vehicle:
        throw UnimplementedError();
      case Category.drone:
        throw UnimplementedError();
    }

    final db = _playerDb;
    if (db == null) return;
    await db.query(table);
    await db.delete(table);
  }

  @override
  String get databaseId => 'player';

  Future<void> _initDatabase() async {
    _playerDb = await _dataService.createDatabase(
      name: databaseId,
      schemes: [
        '''
CREATE TABLE $_weaponTable (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  weapon_id TEXT,
  accessories TEXT
)''',
        '''
CREATE TABLE $_armorTable (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  armor_id TEXT,
  accessories TEXT
)''',
      ],
    );
  }

  @override
  Future<void> load() async {
    if (_playerDb == null) await _initDatabase();

    final weapons = await _getAllFromTable(_weaponTable);
    debugPrint('$weapons');
    final armor = await _getAllFromTable(_armorTable);

    // TODO(NLU): need remake
    for (final row in weapons) {
      final newWeapon = await _itemRepository.getItemFrom(
        itemName: '${row['weapon_id']}',
        table: 'weapons',
      );
      if (newWeapon != null) {
        final item = newWeapon.copyWith(id: row['id'] as int);
        _items.putIfAbsent(Category.weapon, () => {});
        _items[Category.weapon]!['${row['id']}'] = item;
      }
    }
    for (final row in armor) {
      final newArmor = await _itemRepository.getItemFrom(
        itemName: '${row['armor_id']}',
        table: 'armors',
      );
      if (newArmor != null) {
        final item = newArmor.copyWith(id: row['id'] as int);
        _items.putIfAbsent(Category.armor, () => {});
        _items[Category.armor]!['${row['id']}'] = item;
      }
    }
  }

  Future<List<Map<String, Object?>>> _getAllFromTable(String name) async {
    final database = _playerDb;
    if (database == null) return [];

    final list = await database.query(name);

    return list.map((e) => Map.fromEntries(e.entries)).toList();
  }

  @override
  List<Item> itemsOf({required Category category}) =>
      _items[category]!.values.toList();

  @override
  List<Category> get activeCategories => _items.keys.toList();
}
