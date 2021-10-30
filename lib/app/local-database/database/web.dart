import 'package:moor/moor_web.dart';

import '../database.dart';

Database constructDb({bool logStatements = true}) {
  print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Brakpoint 1");
  return Database(WebDatabase('todo_db', logStatements: logStatements));

  // WebDatabase.withStorage(
  //     await MoorWebStorage.indexedDbIfSupported('todo_db'),
  //     logStatements: logStatements));
}
