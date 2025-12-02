import 'dart:io';

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
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "shadowrun.db");

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(url.join("assets", "shadowrun.db"));
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

    // open the database
    var db = await openDatabase(path, readOnly: true);
    print(db.query('weapon'));
  }

  @override
  Future<void> createDatabase() async {}

  @override
  Future<void> deleteDatabase(String name) async {}

  @override
  Future<Database> getDatabase(String name) async {
    return await openDatabase('$databasePath/$name');
  }

  @override
  Future<void> updateDatabase(String name) async {}
}
