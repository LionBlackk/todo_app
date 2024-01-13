import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/utils/utils.dart';

class TaskDatasource {
  static final TaskDatasource _instance = TaskDatasource._();
  factory TaskDatasource() => _instance;

  TaskDatasource._() {
    _initDB();
  }
  static Database? _database;
  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DBKeys.dbTable);
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${DBKeys.dbTable} (
        ${TaskKeys.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${TaskKeys.title} TEXT,
        ${TaskKeys.category} TEXT,
        ${TaskKeys.date} TEXT,
        ${TaskKeys.time} TEXT,
        ${TaskKeys.note} TEXT,
        ${TaskKeys.isCompleted} INTEGER,
      )
      ''');
  }

  Future<List<Task>> getAllTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query(DBKeys.dbTable, orderBy: "id DESC");
    return List.generate(maps.length, (index) => Task.fromMap(maps[index]));
  }

  Future<int> addTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await db.insert(
        DBKeys.dbTable,
        Task.toMap(task),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await db.update(DBKeys.dbTable, Task.toMap(task),
          where: 'id = ?', whereArgs: [task.id]);
    });
  }

  Future<int> deleteTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await db
          .delete(DBKeys.dbTable, where: 'id = ?', whereArgs: [task.id]);
    });
  }
}
