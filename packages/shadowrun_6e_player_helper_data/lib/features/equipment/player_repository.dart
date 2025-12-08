import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shadowrun_6e_player_helper_data/features/equipment/i_item_repository.dart';
import 'package:shadowrun_6e_player_helper_data/features/equipment/i_player_repository.dart';
import 'package:shadowrun_6e_player_helper_data/service/i_data_service.dart';
import 'package:shadowrun_6e_player_helper_domain/domain.dart';
import 'package:sqflite/sqflite.dart';

@Injectable(as: IPlayerRepository)
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
  Future<void> addItem() {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<void> removeItem() {
    // TODO: implement removeItem
    throw UnimplementedError();
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

    final weapons = await _getAllFromTable(_weaponTable);
    final armor = await _getAllFromTable(_armorTable);

    for (final row in weapons) {
      final newWeapon = await _itemRepository.getItemFrom(
        itemName: '${row['weapon_id']}',
        table: 'weapons',
      );
      if (newWeapon != null) {
        _items[Category.weapon]!['${row['id']}'] = newWeapon;
      }
    }
    for (final row in armor) {
      final newWeapon = await _itemRepository.getItemFrom(
        itemName: '${row['armor_id']}',
        table: 'armors',
      );
      if (newWeapon != null) {
        _items[Category.armor]!['${row['id']}'] = newWeapon;
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
