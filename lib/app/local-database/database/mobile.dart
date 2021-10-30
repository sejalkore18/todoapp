import 'dart:io';

import 'package:clean_architecture_project/app/local-database/database.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';

import 'package:path_provider/path_provider.dart' as paths;
import 'package:path/path.dart' as p;

Database constructDb() {
  final executor = LazyDatabase(() async {
    final dataDir = await paths.getApplicationDocumentsDirectory();
    final dbFile = File(p.join(dataDir.path, 'todo_db.sqlite'));
    return VmDatabase(dbFile, logStatements: true);
  });

  return Database(executor);
}

Database constructDbForMacAndLinux() {
  final file = File('todo_db.sqlite');
  return Database(VmDatabase(file, logStatements: true));
}
  // if (Platform.isWindows) {
  //   final file = File('db.sqlite');
  //   return Database(VMDatabase(file, logStatements: logStatements));
  // }
  // return Database(VmDatabase.memory(logStatements: logStatements));

