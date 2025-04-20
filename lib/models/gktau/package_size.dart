import 'package:drift/drift.dart';

@DataClassName('PackageSize')
class PackageSize extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  RealColumn get dimension => real()();
  RealColumn get weight => real().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get sizeType => text()(); // "dimension" or "weight"
}
