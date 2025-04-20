import 'package:flutter/material.dart';
import 'package:paxel/models/databasehelper.dart'; // Import DatabaseHelper

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  List<Map<String, dynamic>> orders = []; // List to store orders

  @override
  void initState() {
    super.initState();
    _loadOrders(); // Load orders when the page initializes
  }

  Future<void> _loadOrders() async {
    final dbHelper = DatabaseHelper.instance;
    final data = await dbHelper.queryAllOrders(); // Fetch all orders
    setState(() {
      orders = data; // Update the orders list
    });
  }

  Future<void> _deleteOrder(int orderId) async {
    final dbHelper = DatabaseHelper.instance;
    await dbHelper.database.then((db) {
      db.delete('orders', where: 'order_id = ?', whereArgs: [orderId]);
    });
    _loadOrders(); // Reload orders after deletion
  }

  Future<String> _getNameById(
    String tableName,
    String columnName,
    String idColumnName,
    int id,
  ) async {
    final dbHelper = DatabaseHelper.instance;
    final result = await dbHelper.database.then((db) {
      return db.query(
        tableName,
        columns: [columnName],
        where: '$idColumnName = ?',
        whereArgs: [id],
      );
    });
    return result.isNotEmpty ? result.first[columnName] as String : 'Unknown';
  }

  void _showOrderDetails(Map<String, dynamic> order) async {
    // Fetch names for package size, item type, and service
    final packageSizeName = await _getNameById(
      'package_sizes',
      'package_size_name',
      'package_size_id',
      order['package_size_id'],
    );
    final itemTypeName = await _getNameById(
      'item_types',
      'item_type_name',
      'item_type_id',
      order['item_type_id'],
    );
    final serviceName = await _getNameById(
      'services',
      'service_name',
      'service_id',
      order['service_id'],
    );

    // Show the dialog with the resolved names
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Order Details'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sender Information:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Name: ${order['sender_name']}'),
                Text('Phone: ${order['sender_phone']}'),
                Text('Address: ${order['sender_address']}'),
                const SizedBox(height: 10),
                const Text(
                  'Recipient Information:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Name: ${order['recipient_name']}'),
                Text('Phone: ${order['recipient_phone']}'),
                Text('Address: ${order['recipient_address']}'),
                const SizedBox(height: 10),
                const Text(
                  'Order Details:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Package Size: $packageSizeName'),
                Text('Item Type: $itemTypeName'),
                Text('Service: $serviceName'),
                Text('Total Payment: Rp. ${order['total_payment']}'),
                Text('Payment Method: ${order['payment_method']}'),
                Text('Status: ${order['status']}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                _deleteOrder(order['order_id']); // Delete the order
                Navigator.pop(context); // Close the dialog
              },
              child: const Text(
                'Cancel Book',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header Section
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Ongoing Transactions',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.amber,
                              size: 20,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'COMPLETED',
                              style: TextStyle(
                                color: Color(0xFF5D52A0),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Divider
                  const Divider(
                    height: 1,
                    color: Color(0xFFEAE9EE),
                    thickness: 1,
                  ),
                ],
              ),
            ),

            // Body Section
            orders.isEmpty
                ? SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 280,
                        width: 280,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9F9FB),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            'images/shipmentbig.png',
                            height: 175,
                            width: 175,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Lets Create Shipment!',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Our Hero will be happy to help you.\nLet\'s make a shipment.',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
                : SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final order = orders[index];
                    return GestureDetector(
                      onTap:
                          () => _showOrderDetails(order), // Show popup on tap
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xFFEAE9EE)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sender: ${order['sender_name']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Recipient: ${order['recipient_name']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Total Payment: Rp. ${order['total_payment']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }, childCount: orders.length),
                ),
          ],
        ),
      ),
    );
  }
}
