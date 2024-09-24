import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'db_user.dart';

part 'database_helpers.g.dart';

@UseMoor(
  tables: [DBUsers],
  daos: [UsersDao],
)
class AppDatabase extends _$AppDatabase {
  static final sharedInstance = AppDatabase();

  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "db.sqlite", logStatements: false));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [DBUsers])
class UsersDao extends DatabaseAccessor<AppDatabase> with _$UsersDaoMixin {
  final AppDatabase db;
  UsersDao(this.db) : super(db);

  addUser(DBUser user) =>
      into(db.dBUsers).insert(user, mode: InsertMode.replace);

  Future<List<DBUser>> getAllUser() => select(db.dBUsers).get();

  Future<DBUser> getTaskById(String id) =>
      (select(db.dBUsers)..where((user) => user.email.equals(id))).getSingle();
}
