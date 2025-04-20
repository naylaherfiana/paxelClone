import 'package:drift/drift.dart';

@DataClassName('Service')
class Service extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get description => text().nullable()();
}
