import 'package:drift/drift.dart';

@DataClassName('ServicePrice')
class ServicePrice extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get serviceId => integer()();
  IntColumn get packageSizeId => integer()();
  RealColumn get price => real()();
}
