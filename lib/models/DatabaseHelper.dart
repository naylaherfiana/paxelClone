import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static DatabaseHelper get instance => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'expedition.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE package_sizes (
        package_size_id INTEGER PRIMARY KEY AUTOINCREMENT,
        package_size_name TEXT,
        package_size_dimensions TEXT,
        package_size_weight TEXT,
        package_size_description TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE item_types (
        item_type_id INTEGER PRIMARY KEY AUTOINCREMENT,
        item_type_name TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE services (
        service_id INTEGER PRIMARY KEY AUTOINCREMENT,
        service_name TEXT,
        service_description TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE service_prices (
        service_price_id INTEGER PRIMARY KEY AUTOINCREMENT,
        service_id INTEGER,
        package_size_id INTEGER,
        price REAL,
        FOREIGN KEY (service_id) REFERENCES services(service_id),
        FOREIGN KEY (package_size_id) REFERENCES package_sizes(package_size_id)
      )
    ''');

    await db.execute('''
      CREATE TABLE orders (
        order_id INTEGER PRIMARY KEY AUTOINCREMENT,
        sender_name TEXT,
        sender_phone TEXT,
        sender_address TEXT,
        recipient_name TEXT,
        recipient_phone TEXT,
        recipient_address TEXT,
        package_size_id INTEGER,
        item_type_id INTEGER,
        service_id INTEGER,
        service_price_id INTEGER,
        total_payment REAL,
        payment_method TEXT,
        status TEXT,
        FOREIGN KEY (package_size_id) REFERENCES package_sizes(package_size_id),
        FOREIGN KEY (item_type_id) REFERENCES item_types(item_type_id),
        FOREIGN KEY (service_id) REFERENCES services(service_id),
        FOREIGN KEY (service_price_id) REFERENCES service_prices(service_price_id)
      )
    ''');

    // Insert initial package_sizes
    await db.insert('package_sizes', {
      'package_size_name': 'Small',
      'package_size_dimensions': '20x15x10 cm',
      'package_size_weight': null,
      'package_size_description': 'dimension',
    });
    await db.insert('package_sizes', {
      'package_size_name': 'Medium',
      'package_size_dimensions': '30x22x12 cm',
      'package_size_weight': null,
      'package_size_description': 'dimension',
    });
    await db.insert('package_sizes', {
      'package_size_name': 'Large',
      'package_size_dimensions': '50x40x30 cm',
      'package_size_weight': null,
      'package_size_description': 'dimension',
    });
    await db.insert('package_sizes', {
      'package_size_name': '10 Kg',
      'package_size_dimensions': null,
      'package_size_weight': '10',
      'package_size_description': 'weight',
    });
    await db.insert('package_sizes', {
      'package_size_name': '25 Kg',
      'package_size_dimensions': null,
      'package_size_weight': '25',
      'package_size_description': 'weight',
    });

    // Insert item_types
    List<String> itemTypes = [
      'Accesories',
      'Automobile & Motorcycle',
      'Beauty & Personal Care',
      'Books & Documents',
      'Decorative Plants',
      'Electronics & Gadgets',
      'Fashion & Apparel',
      'Frozen Food',
      'Household & Homewares',
      'Medicine',
      'Non Halal Frozen Food',
      'Non Halal Perishable Food',
      'Ornamental Fish',
      'Perishable / Cooked Food',
      'Precious Metal',
      'Sport & Entertainment',
      'Toys & Hobbies',
    ];
    for (var name in itemTypes) {
      await db.insert('item_types', {'item_type_name': name});
    }

    // Insert services
    List<String> serviceNames = [
      'Sameday',
      'Nextday',
      'Regular',
      'PaxelBig',
      'Instant',
    ];
    for (var name in serviceNames) {
      await db.insert('services', {
        'service_name': name,
        'service_description': '',
      });
    }

    // Insert service_prices
    // Sameday: Small 11k, Medium 14k, Large 17k
    await db.insert('service_prices', {
      'service_id': 1,
      'package_size_id': 1,
      'price': 11000,
    });
    await db.insert('service_prices', {
      'service_id': 1,
      'package_size_id': 2,
      'price': 14000,
    });
    await db.insert('service_prices', {
      'service_id': 1,
      'package_size_id': 3,
      'price': 17000,
    });

    // Nextday: Small 11k, Medium 14k, Large 17k
    await db.insert('service_prices', {
      'service_id': 2,
      'package_size_id': 1,
      'price': 11000,
    });
    await db.insert('service_prices', {
      'service_id': 2,
      'package_size_id': 2,
      'price': 14000,
    });
    await db.insert('service_prices', {
      'service_id': 2,
      'package_size_id': 3,
      'price': 17000,
    });

    // PaxelBig: 10kg 45k, 25kg 75k
    await db.insert('service_prices', {
      'service_id': 4,
      'package_size_id': 4,
      'price': 45000,
    });
    await db.insert('service_prices', {
      'service_id': 4,
      'package_size_id': 5,
      'price': 75000,
    });
  }

  // Method to fetch all rows from a table
  Future<List<Map<String, dynamic>>> queryAllRows(String tableName) async {
    final db = await database; // Use the existing database getter
    return await db.query(tableName);
  }

  Future<List<Map<String, dynamic>>> queryPackageSizes() async {
    final db = await database;
    return await db.query(
      'package_sizes',
      where: 'package_size_name IN (?, ?, ?)',
      whereArgs: ['Small', 'Medium', 'Large'], // Restrict to specific sizes
    );
  }

  Future<List<Map<String, dynamic>>> queryPrice(
    String packageSize,
    String service,
  ) async {
    final db = await database;
    return await db.rawQuery(
      '''
      SELECT price FROM service_prices
      INNER JOIN package_sizes ON service_prices.package_size_id = package_sizes.package_size_id
      INNER JOIN services ON service_prices.service_id = services.service_id
      WHERE package_sizes.package_size_name = ? AND services.service_name = ?
    ''',
      [packageSize, service],
    );
  }

  // Method to fetch all rows from the 'orders' table
  Future<List<Map<String, dynamic>>> queryAllOrders() async {
    final db = await database; // Get the database instance
    return await db.query('orders'); // Query all rows from the 'orders' table
  }
}
