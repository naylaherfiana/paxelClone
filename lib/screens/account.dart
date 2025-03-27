import 'package:flutter/material.dart';
import 'package:paxel/widgets/profile/activity.dart';
import 'package:paxel/widgets/profile/edit_profile.dart';
import 'package:paxel/widgets/profile/profile.dart';
import 'package:paxel/widgets/profile_menu/account.dart';
import 'package:paxel/widgets/profile_menu/general.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9FB),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 20,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(
                                  'images/profile.jpg',
                                ),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "My Activity",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(width: 50),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Activity(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),

                        // Profile
                        Profile(),

                        // Edit Profile
                        EditProfile(),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 7),

                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [AccountWidgets(), GeneralWidgets()],
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
