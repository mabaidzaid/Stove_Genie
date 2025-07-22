import 'dart:convert';
import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stove_genie/models/recipe/recipe_model.dart';

class RecipeDbHelper {
  RecipeDbHelper._internal();
  static final RecipeDbHelper _instance = RecipeDbHelper._internal();
  factory RecipeDbHelper() => _instance;

  static const _dbName = 'recipes.db';
  static const _dbVersion = 1;

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<void> close() async {
    if (_db != null) {
      await _db!.close();
      _db = null;
    }
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onDowngrade: onDatabaseDowngradeDelete,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE recipes(
        id TEXT PRIMARY KEY,
        userId TEXT,
        title TEXT,
        image TEXT,
        time INTEGER,
        calories INTEGER,
        rating REAL,
        backgroundColor TEXT,
        description TEXT,
        category TEXT,
        reviews TEXT,
        steps TEXT,
        ingredients TEXT
      );
    ''');

    await db.execute('CREATE INDEX idx_userId ON recipes(userId);');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion == 1 && newVersion == 2) {
      // e.g. await db.execute('ALTER TABLE recipes ADD COLUMN isPublic INTEGER DEFAULT 0');
    }
  }

  /* ------------ CRUD wrappers ------------ */
  Future<int> insertRecipe(RecipeModel recipe) async {
    try {
      final db = await database;
      final data = recipe.toJson()
        ..['reviews'] = jsonEncode(recipe.reviews)
        ..['steps'] = jsonEncode(recipe.steps)
        ..['ingredients'] = jsonEncode(recipe.ingredients);

      return db.insert(
        'recipes',
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e, s) {
      log('insertRecipe failed', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> batchInsert(List<RecipeModel> list) async {
    final db = await database;
    final batch = db.batch();
    for (final r in list) {
      batch.insert(
        'recipes',
        r.toJson()
          ..['reviews'] = jsonEncode(r.reviews)
          ..['steps'] = jsonEncode(r.steps)
          ..['ingredients'] = jsonEncode(r.ingredients),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<List<RecipeModel>> getRecipes() async {
    final db = await database;
    final rows = await db.query('recipes');

    return rows.map((row) {
      final m = Map<String, dynamic>.from(row)
        ..update(
          'steps',
          (v) => (jsonDecode(v as String) as List<dynamic>).cast<String>(),
        )
        ..update(
          'ingredients',
          (v) => (jsonDecode(v as String) as List<dynamic>).cast<String>(),
        )
        ..update(
          'reviews',
          (v) => (jsonDecode(v as String) as List<dynamic>)
              .cast<Map<String, dynamic>>(),
        )
        // convert the ints to Strings, so recipe_model.fromJson sees a String
        ..update('time', (v) => v?.toString() ?? '')
        ..update('calories', (v) => v?.toString() ?? '');

      return RecipeModel.fromJson(m);
    }).toList();
  }

  Future<void> deleteRecipe(String id) async {
    final db = await database;
    await db.delete('recipes', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> isRecipeSaved(String id) async {
    final db = await database;
    final res = await db.rawQuery(
      'SELECT 1 FROM recipes WHERE id = ? LIMIT 1',
      [id],
    );
    return res.isNotEmpty;
  }
}
