import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:shadowrun_6e_player_helper_data/service/i_data_service.dart';
import 'package:sqflite/sqflite.dart';

@Injectable(as: IDataService)
class DataService implements IDataService {
  late final String databasePath;

  @postConstruct
  void init() async {
    databasePath = await getDatabasesPath();
  }

  @override
  Future<void> createDatabase() async {}

  @override
  Future<void> deleteDatabase(String name) async {}

  @override
  Future<Database> getDatabase(String name, {bool readOnly = false}) async {
    final path = '$databasePath/$name';
    final exists = await databaseExists(path);

    if (!exists) {
      _addDatabaseFromAsset(name);
    } else {
      debugPrint("Opening existing database");
    }

    // open the database
    return await openDatabase(path, readOnly: readOnly);
  }

  @override
  Future<void> updateDatabase(String name) async {}

  Future<void> _addDatabaseFromAsset(String name) async {
    final path = '$databasePath/$name';
    debugPrint("Creating new copy from asset");

    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(url.join("assets", name));
    List<int> bytes = data.buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );

    // Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);
  }
}
