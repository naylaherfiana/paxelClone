import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          // Join Since
          ActivityColumn(label: "Join Since", value: "--"),
          SizedBox(width: 15),
          // Freebies
          ActivityColumn(label: "Freebies", value: "--"),
          SizedBox(width: 15),
          // Shipments
          ActivityColumn(label: "Shipments", value: "--"),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}

class ActivityColumn extends StatelessWidget {
  final String label;
  final String value;

  const ActivityColumn({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
