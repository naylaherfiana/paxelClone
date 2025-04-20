import 'package:flutter/material.dart';
import 'package:paxel/screens/bismillah.dart';
import 'package:paxel/screens/shipment/delivery.dart'; // Import the Delivery screen

class ServicesWidgets extends StatelessWidget {
  const ServicesWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          _buildTile(
            context,
            'Shipment',
            'images/shipment.png',
            const Delivery(),
          ),
          _buildTile(
            context,
            'Instant',
            'images/instant.png',
            const OrderShipment(),
          ),
          _buildTile(context, 'PaxelBox', 'images/paxelbox.png', null),
          _buildTile(context, 'PaxelBig', 'images/paxelbig.png', null),
          _buildTile(context, 'Frozen', 'images/frozen.png', null),
          _buildTile(context, 'PaxelAmplop', 'images/paxelamplop.png', null),
          _buildTile(context, 'PaxelRecycle', 'images/paxelrecycle.png', null),
          _buildTile(context, 'More', 'images/more.png', null),
        ],
      ),
    );
  }

  Widget _buildTile(
    BuildContext context,
    String title,
    String imagePath,
    Widget? destination,
  ) {
    return GestureDetector(
      onTap: () {
        if (destination != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
