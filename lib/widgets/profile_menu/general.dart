import 'package:flutter/material.dart';
import 'package:paxel/widgets/profile_menu/item_widgets.dart';

class GeneralWidgets extends StatelessWidget {
  const GeneralWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          const Text(
            "General",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          const SizedBox(height: 10),

          // Settings
          const AccountItem(icon: Icons.settings, label: "Settings"),
          const Divider(height: 1, color: Color(0xFFEAE9EE), indent: 55),

          // Help & Support
          const AccountItem(icon: Icons.help_outline, label: "Help & Support"),
          const Divider(height: 1, color: Color(0xFFEAE9EE), indent: 55),

          // Terms and Conditions
          const AccountItem(
            icon: Icons.description,
            label: "Terms and Conditions",
          ),
          const Divider(height: 1, color: Color(0xFFEAE9EE), indent: 55),

          // Privacy Policy
          const AccountItem(icon: Icons.privacy_tip, label: "Privacy Policy"),
          const Divider(height: 1, color: Color(0xFFEAE9EE), indent: 55),

          // Claim
          const AccountItem(icon: Icons.receipt_long, label: "Claim"),
          const Divider(height: 1, color: Color(0xFFEAE9EE), indent: 55),

          // Contact Us
          const AccountItem(icon: Icons.phone, label: "Contact Us"),
        ],
      ),
    );
  }
}
