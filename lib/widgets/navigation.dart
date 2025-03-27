import 'package:flutter/material.dart';
import 'package:paxel/screens/account.dart';
import 'package:paxel/screens/home.dart';
import 'package:paxel/screens/inbox.dart';
import 'package:paxel/screens/mytransaction.dart';

const Color backgroundColor = Colors.white;
const Color selectedBackgroundColor = Color(
  0xFFF3F0FF,
); // Warna latar belakang yang dipilih

class Navi extends StatefulWidget {
  const Navi({super.key});

  @override
  State<Navi> createState() => _Navi();
}

class _Navi extends State<Navi> {
  int index = 0;

  final List<Widget> pages = [
    HomePage(),
    TransactionPage(),
    InboxPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 68,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 18),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                offset: Offset(0, 5),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, "Home", 0),
              _buildNavItem(Icons.inventory, "My Transaction", 1),
              _buildNavItem(Icons.mail, "Inbox", 2),
              _buildNavItem(Icons.person, "Account", 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int itemIndex) {
    bool isSelected = index == itemIndex;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            index = itemIndex;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFF3F2F7) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: const Color(0xFF655B99)),
              const SizedBox(width: 2),
              Text(
                label,
                style: const TextStyle(color: Color(0xFF655B99), fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
