import 'package:flutter/material.dart';
import 'package:paxel/screens/shipment/pickup.dart';
import 'package:paxel/screens/shipment/packagedetail.dart'; // Import the Pickup screen

class Service extends StatefulWidget {
  const Service({super.key});

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  String selectedService = ''; // Track the selected service

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
                                builder: (context) => const Pickup(),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFF5D52A0),
                            size: 20,
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
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  // Title Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Select Service ✨',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'What service do you prefer?',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Service Options
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ServiceOption(
                          title: 'Sameday',
                          subtitle: '6 - 8 Hours',
                          price: 'Rp. 11.000',
                          isAvailable: true,
                          isSelected: selectedService == 'Sameday',
                          onTap: () {
                            setState(() {
                              selectedService = 'Sameday';
                            });
                          },
                        ),
                        ServiceOption(
                          title: 'Nextday',
                          subtitle: '1 Day',
                          price: 'Rp. 11.000',
                          isAvailable: true,
                          isSelected: selectedService == 'Nextday',
                          onTap: () {
                            setState(() {
                              selectedService = 'Nextday';
                            });
                          },
                        ),
                        ServiceOption(
                          title: 'Regular',
                          subtitle: 'Unavailable for this route',
                          price: '',
                          isAvailable: false,
                        ),
                        ServiceOption(
                          title: 'PaxelBig',
                          subtitle: '1 - 3 Days',
                          price: 'Rp. 45.000',
                          isAvailable: true,
                        ),
                        ServiceOption(
                          title: 'Instant',
                          subtitle: 'Unavailable for this route',
                          price: '',
                          isAvailable: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
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
                MaterialPageRoute(builder: (context) => const PackageDetail()),
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
              'Next',
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

class ServiceOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final bool isAvailable;
  final bool isSelected;
  final VoidCallback? onTap;

  const ServiceOption({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.isAvailable,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isAvailable ? onTap : null,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF3F0FF) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:
                isSelected ? const Color(0xFF5D52A0) : const Color(0xFFEAE9EE),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color:
                            isAvailable
                                ? Colors.black
                                : const Color(0xFF8E8E93),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color:
                            isAvailable
                                ? const Color(0xFF8E8E93)
                                : const Color(0xFFFF3B30),
                      ),
                    ),
                  ],
                ),
                if (isAvailable)
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5D52A0),
                    ),
                  ),
              ],
            ),
            if (isSelected) ...[
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Small', style: TextStyle(fontSize: 14)),
                  Text(
                    'Rp. 11.000',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Medium', style: TextStyle(fontSize: 14)),
                  Text(
                    'Rp. 14.000',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Large', style: TextStyle(fontSize: 14)),
                  Text(
                    'Rp. 17.000',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
