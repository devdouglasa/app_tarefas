import 'package:my_app/data/taskdao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  String path = join(await getDatabasesPath(), 'task.db');
  return await openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TaskDao.tableSql);
    },
  );
}
