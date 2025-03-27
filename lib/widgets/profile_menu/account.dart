import 'package:flutter/material.dart';
import 'package:paxel/widgets/profile_menu/item_widgets.dart';

class AccountWidgets extends StatelessWidget {
  const AccountWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          const Text(
            "Account",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          const SizedBox(height: 10),

          // Referral
          const AccountItem(icon: Icons.group, label: "Referral"),
          const Divider(height: 1, color: Color(0xFFEAE9EE), indent: 55),

          // Address Book
          const AccountItem(icon: Icons.home, label: "Address Book"),
          const Divider(height: 1, color: Color(0xFFEAE9EE), indent: 55),

          // Promo
          const AccountItem(icon: Icons.card_giftcard, label: "Promo"),
          const Divider(height: 1, color: Color(0xFFEAE9EE), indent: 55),
        ],
      ),
    );
  }
}
