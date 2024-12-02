import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EcoTrashDBService {
  static const _databaseName = "eco_trash.db";
  static const _databaseVersion = 1;
  static const userTable = 'user';

  static const columnId = '_id';
  static const columnName = 'name';
  static const columnRole = 'role';
  static const columnEmail = 'email';
  static const columnToken = 'token';

  EcoTrashDBService._privateConstructor();
  static final EcoTrashDBService instance =
      EcoTrashDBService._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $userTable (
        $columnId TEXT PRIMARY KEY,
        $columnName TEXT,
        $columnRole TEXT,
        $columnEmail TEXT,
        $columnToken TEXT
      )
    ''');
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await instance.database;
    return await db.insert(userTable, user,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Map<String, dynamic>?> getUser() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(userTable);
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  Future<int> deleteUser() async {
    Database db = await instance.database;
    return await db.delete(userTable);
  }
}