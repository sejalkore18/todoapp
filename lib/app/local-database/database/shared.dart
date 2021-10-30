// export 'unsupported.dart'
//     if (dart.library.html) 'package:clean_architecture_project/app/local-database/database/web.dart'
//     if (dart.library.io) 'package:clean_architecture_project/app/local-database/database/mobile.dart';

import 'package:clean_architecture_project/app/local-database/database.dart';
import 'package:clean_architecture_project/app/local-database/database/unsupported.dart'
    if (dart.library.html) 'package:clean_architecture_project/app/local-database/database/web.dart'
    if (dart.library.io) 'package:clean_architecture_project/app/local-database/database/mobile.dart';

// import 'package:clean_architecture_project/app/local-database/database/mobile.dart'
//     if (dart.library.html) 'package:clean_architecture_project/app/local-database/database/unsupported.dart';
// import 'package:clean_architecture_project/app/local-database/database/web.dart'
//     if (dart.library.io) 'package:clean_architecture_project/app/local-database/database/unsupported.dart';
import 'package:flutter/foundation.dart';

class SharedDb {
  Database? database;

  SharedDb() {
    // if (Platform.isAndroid || Platform.isIOS)
    if (!kIsWeb)
      database = constructDb();
    // else if (Platform.isMacOS || Platform.isLinux)
    //   database = constructDbForMacAndLinux();
    else
      database = constructDb();
  }
}
