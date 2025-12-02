import 'package:sqflite/sqflite.dart';

abstract interface class IDataService {
  // CRUD
  Future<void> createDatabase();
  Future<Database> getDatabase(String name);
  Future<void> updateDatabase(String name);
  Future<void> deleteDatabase(String name);
}