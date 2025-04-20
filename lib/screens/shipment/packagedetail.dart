import 'package:flutter/material.dart';
import 'package:paxel/screens/shipment/service.dart';
import 'package:paxel/screens/shipment/orderdetail.dart';

class PackageDetail extends StatefulWidget {
  const PackageDetail({super.key});

  @override
  State<PackageDetail> createState() => _PackageDetailState();
}

class _PackageDetailState extends State<PackageDetail> {
  String price = 'Rp. 14.000';
  String requirement =
      '• Max. package weight is 5 Kg\n• Max. package size is 30x22x12 cm';

  void updatePackageDetails(String size) {
    setState(() {
      if (size == 'Small') {
        price = 'Rp. 11.000';
        requirement =
            '• Max. package weight is 5 Kg\n• Max. package size is 20x20x8 cm';
      } else if (size == 'Large') {
        price = 'Rp. 17.000';
        requirement =
            '• Max. package weight is 5 Kg\n• Max. package size is 35x30x25 cm';
      } else {
        price = 'Rp. 14.000';
        requirement =
            '• Max. package weight is 5 Kg\n• Max. package size is 30x22x12 cm';
      }
    });
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
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Service(),
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
                          'Package Detail',
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    // Select Package Size
                    const Text(
                      'Select package size*',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => updatePackageDetails('Small'),
                            child: PackageSizeOption(
                              label: 'Small',
                              isSelected: price == 'Rp. 11.000',
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => updatePackageDetails('Medium'),
                            child: PackageSizeOption(
                              label: 'Medium',
                              isSelected: price == 'Rp. 14.000',
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => updatePackageDetails('Large'),
                            child: PackageSizeOption(
                              label: 'Large',
                              isSelected: price == 'Rp. 17.000',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Package Details
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F0FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            price,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5D52A0),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Requirement',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            requirement,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF8E8E93),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Select Item Type
                    const Text(
                      'Select Item Type',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF3F0FF),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      value: 'Frozen Food',
                      items: const [
                        DropdownMenuItem(
                          value: 'Frozen Food',
                          child: Text('Frozen Food'),
                        ),
                        DropdownMenuItem(
                          value: 'Non-perishable Food',
                          child: Text('Non-perishable Food'),
                        ),
                        DropdownMenuItem(
                          value: 'Perishable / Cooked',
                          child: Text('Perishable / Cooked'),
                        ),
                        DropdownMenuItem(
                          value: 'Non Halal Frozen Food',
                          child: Text('Non Halal Frozen Food'),
                        ),
                      ],
                      onChanged: (value) {
                        // Handle dropdown value change
                      },
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5D52A0),
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
                      child: Row(
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
                            price,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrderDetail()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5D52A0),
              minimumSize: const Size(double.infinity, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            child: const Text(
              'Done',
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

class PackageSizeOption extends StatelessWidget {
  final String label;
  final bool isSelected;

  const PackageSizeOption({
    Key? key,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF5D52A0) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? const Color(0xFF5D52A0) : const Color(0xFFEAE9EE),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
