import 'package:flutter/material.dart';

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
          _buildTile('Shipment', 'images/shipment.png'),
          _buildTile('Instant', 'images/instant.png'),
          _buildTile('PaxelBox', 'images/paxelbox.png'),
          _buildTile('PaxelBig', 'images/paxelbig.png'),
          _buildTile('Frozen', 'images/frozen.png'),
          _buildTile('PaxelAmplop', 'images/paxelamplop.png'),
          _buildTile('PaxelRecycle', 'images/paxelrecycle.png'),
          _buildTile('More', 'images/more.png'),
        ],
      ),
    );
  }

  Widget _buildTile(String title, String imagePath) {
    return Column(
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
    );
  }
}
