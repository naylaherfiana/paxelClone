import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const AccountItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        children: [
          // Icon
          Icon(icon, color: const Color(0xFF655B99), size: 20),
          const SizedBox(width: 15),
          // Label
          Text(
            label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          // Arrow Icon
          const Icon(Icons.chevron_right, color: Color(0xFF655B99)),
        ],
      ),
    );
  }
}
