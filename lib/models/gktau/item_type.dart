import 'package:drift/drift.dart';

@DataClassName('ItemType')
class ItemType extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get description => text().nullable()();
}
