import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Row(
        children: [
          // User Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nayla Herfiana",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              ),
              const SizedBox(height: 1),
              const Text("@kerama1an", style: TextStyle(fontSize: 10)),
              const SizedBox(height: 1),
              const Text("6289699442229", style: TextStyle(fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}
