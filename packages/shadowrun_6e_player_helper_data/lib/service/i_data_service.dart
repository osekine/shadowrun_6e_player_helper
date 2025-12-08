import 'package:sqflite/sqflite.dart';

abstract interface class IDataService {
  // CRUD
  Future<Database> createDatabase({required String name, List<String> schemes});
  Future<Database> getDatabase(String name, {bool readOnly});
  Future<void> updateDatabase(String name);
  Future<void> deleteDatabase(String name);
}
