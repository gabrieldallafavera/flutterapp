import 'package:appflutter/database/dao/contado_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'flutterbank.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContatoDao.sqlTabela);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
