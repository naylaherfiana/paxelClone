import 'dart:io';
import 'package:drift/drift.dart';
// These imports are only needed to open the database
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// Import table definitions
import 'item_type.dart';
import 'package_size.dart';
import 'service.dart';
import 'service_price.dart';
import 'order.dart';

part 'database.g.dart';

@DriftDatabase(tables: [ItemType, PackageSize, Service, ServicePrice, Order])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // The LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // Put the database file, called db.sqlite, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
