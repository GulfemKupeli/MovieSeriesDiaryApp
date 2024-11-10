import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();
  final String _userTableName = "users";
  final String _userMailColumnName = "mail";
  final String _userPasswordColumnName = "password";

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "master_db.db");
    final database = await openDatabase(databasePath, onCreate: (db, version) {
      db.execute('''
      CREATE TABLE $_userTableName (
        $_userMailColumnName STRING PRIMARY KEY,
        $_userPasswordColumnName TEXT NOT NULL  
         )
      ''');
    });
    return database;
  }
}
