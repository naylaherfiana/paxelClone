import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Added for date formatting
import 'package:paxel/screens/home.dart';
import 'package:paxel/widgets/navigation.dart';
import 'package:paxel/models/databasehelper.dart'; // Import DatabaseHelper
import 'package:paxel/screens/mytransaction.dart'; // Ensure this import is present

class OrderShipment extends StatefulWidget {
  const OrderShipment({super.key});

  @override
  _OrderShipmentState createState() => _OrderShipmentState();
}

class _OrderShipmentState extends State<OrderShipment> {
  String? selectedItemType;
  String? selectedPackageSize;
  String? selectedService;
  List<String> itemTypes = [];
  List<String> packageSizes = [];
  List<String> services = [];
  double totalPayment = 0.0;

  final TextEditingController senderNameController = TextEditingController();
  final TextEditingController senderPhoneController = TextEditingController();
  final TextEditingController senderAddressController = TextEditingController();
  final TextEditingController recipientNameController = TextEditingController();
  final TextEditingController recipientPhoneController =
      TextEditingController();
  final TextEditingController recipientAddressController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadDropdownData();
  }

  Future<void> _loadDropdownData() async {
    final dbHelper = DatabaseHelper.instance;

    // Fetch item types, package sizes, and services from the database
    final itemTypeData = await dbHelper.queryAllRows('item_types');
    final packageSizeData = await dbHelper.queryPackageSizes();
    final serviceData = await dbHelper.queryAllRows('services');

    setState(() {
      itemTypes =
          itemTypeData.map((row) => row['item_type_name'] as String).toList();
      packageSizes =
          packageSizeData
              .map((row) => row['package_size_name'] as String)
              .toList();
      services =
          serviceData.map((row) => row['service_name'] as String).toList();
    });
  }

  Future<void> _updateTotalPayment() async {
    if (selectedPackageSize != null && selectedService != null) {
      final dbHelper = DatabaseHelper.instance;

      // Query the price for the selected package size and service
      final result = await dbHelper.queryPrice(
        selectedPackageSize!,
        selectedService!,
      );

      if (result.isNotEmpty) {
        setState(() {
          totalPayment = result.first['price'] as double;
        });
      } else {
        setState(() {
          totalPayment = -1; // Indicate that the price is unavailable
        });
      }
    }
  }

  void _bookNow() async {
    if (selectedItemType != null &&
        selectedPackageSize != null &&
        selectedService != null &&
        senderNameController.text.isNotEmpty &&
        senderPhoneController.text.isNotEmpty &&
        senderAddressController.text.isNotEmpty &&
        recipientNameController.text.isNotEmpty &&
        recipientPhoneController.text.isNotEmpty &&
        recipientAddressController.text.isNotEmpty) {
      final dbHelper = DatabaseHelper.instance;

      // Insert data into the 'orders' table
      await dbHelper.database.then((db) {
        db.insert('orders', {
          'sender_name': senderNameController.text,
          'sender_phone': senderPhoneController.text,
          'sender_address': senderAddressController.text,
          'recipient_name': recipientNameController.text,
          'recipient_phone': recipientPhoneController.text,
          'recipient_address': recipientAddressController.text,
          'package_size_id':
              packageSizes.indexOf(selectedPackageSize!) +
              1, // Map package size to ID
          'item_type_id':
              itemTypes.indexOf(selectedItemType!) + 1, // Map item type to ID
          'service_id':
              services.indexOf(selectedService!) + 1, // Map service to ID
          'service_price_id':
              null, // Optional: Add logic to map service price ID if needed
          'total_payment': totalPayment,
          'payment_method': 'Cash', // Replace with actual payment method
          'status': 'Ongoing', // Replace with actual status
        });
      });

      // Navigate to TransactionPage with the selected data
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TransactionPage()),
      );

      // Navigate to Navi page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Navi()),
      );
    } else {
      // Show an error if required fields are not selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all fields!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    // Pickup time: tomorrow 08:00 - 10:00
    DateTime pickupStart = DateTime(now.year, now.month, now.day + 1, 8, 0);
    DateTime pickupEnd = DateTime(now.year, now.month, now.day + 1, 10, 0);

    // Delivery time: same day as pickup, 14:00 - 16:00
    DateTime deliveryStart = DateTime(now.year, now.month, now.day + 1, 14, 0);
    DateTime deliveryEnd = DateTime(now.year, now.month, now.day + 1, 16, 0);

    // Format display
    String pickupDateFormatted = DateFormat(
      'EEEE, MMM d',
    ).format(pickupStart); // e.g., Monday, Apr 21
    String pickupTimeFormatted =
        "${DateFormat.Hm().format(pickupStart)} - ${DateFormat.Hm().format(pickupEnd)}"; // e.g., 08:00 - 10:00
    String deliveryTimeFormatted =
        "${DateFormat.Hm().format(deliveryStart)} - ${DateFormat.Hm().format(deliveryEnd)}"; // e.g., 14:00 - 16:00

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
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFF5D52A0),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Order Detail',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Color(0xFFEAE9EE),
                    thickness: 1,
                  ),
                ],
              ),
            ),

            // Body Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Pickup Section
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFEAE9EE)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Color(0xFF5D52A0),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Pickup',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextField(
                                      controller: senderNameController,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter pickup name',
                                        border: InputBorder.none,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextField(
                                      controller: senderPhoneController,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter pickup phone number',
                                        border: InputBorder.none,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    TextField(
                                      controller: senderAddressController,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter pickup address',
                                        border: InputBorder.none,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(height: 20, color: Color(0xFFEAE9EE)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Pickup time',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                '$pickupDateFormatted  $pickupTimeFormatted',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Destination Section
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFEAE9EE)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.red),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Destination',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextField(
                                      controller: recipientNameController,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter destination name',
                                        border: InputBorder.none,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextField(
                                      controller: recipientPhoneController,
                                      decoration: const InputDecoration(
                                        hintText:
                                            'Enter destination phone number',
                                        border: InputBorder.none,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    TextField(
                                      controller: recipientAddressController,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter destination address',
                                        border: InputBorder.none,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(height: 20, color: Color(0xFFEAE9EE)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Delivery Time',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                '$pickupDateFormatted  $deliveryTimeFormatted',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Item Type Section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFEAE9EE)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Item Type:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          DropdownButton<String>(
                            value: selectedItemType,
                            hint: const Text('Select Item Type'),
                            items:
                                itemTypes.map((type) {
                                  return DropdownMenuItem<String>(
                                    value: type,
                                    child: Text(type),
                                  );
                                }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedItemType = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Package Size Section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFEAE9EE)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Package Size:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          DropdownButton<String>(
                            value: selectedPackageSize,
                            hint: const Text('Select Package Size'),
                            items:
                                packageSizes.map((size) {
                                  return DropdownMenuItem<String>(
                                    value: size,
                                    child: Text(size),
                                  );
                                }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedPackageSize = value;
                              });
                              _updateTotalPayment(); // Update total payment
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Service Section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFEAE9EE)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Service:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          DropdownButton<String>(
                            value: selectedService,
                            hint: const Text('Select Service'),
                            items:
                                services.map((service) {
                                  return DropdownMenuItem<String>(
                                    value: service,
                                    child: Text(service),
                                  );
                                }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedService = value;
                              });
                              _updateTotalPayment(); // Update total payment
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Total Payment Section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFEAE9EE)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total Payment:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                totalPayment == -1
                                    ? 'Price not available'
                                    : 'Rp. ${totalPayment.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            height: 20,
                            color: Color(0xFFEAE9EE),
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Detail Payment:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Cash',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton(
            onPressed: _bookNow, // Call the _bookNow method
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5D52A0),
              minimumSize: const Size(double.infinity, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            child: const Text(
              'Book Now',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
