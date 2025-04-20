import 'package:drift/drift.dart';

class Order extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get senderName => text().withLength(min: 1, max: 50)();
  TextColumn get senderPhone => text()();
  TextColumn get senderAddress => text()();
  TextColumn get recipientName => text()();
  TextColumn get recipientPhone => text()();
  TextColumn get recipientAddress => text()();
  IntColumn get packageSizeId => integer()();
  IntColumn get itemTypeId => integer()();
  IntColumn get serviceId => integer()();
  IntColumn get servicePriceId => integer()();
  IntColumn get totalPayment => integer()();
  TextColumn get paymentMethod => text()();
}
