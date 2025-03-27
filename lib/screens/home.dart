import 'package:flutter/material.dart';
import 'package:paxel/widgets/balance_widgets.dart';
import 'package:paxel/widgets/services_widgets.dart';
import 'package:paxel/widgets/slidercard/antarkankebaikan_widgets.dart';
import 'package:paxel/widgets/slidercard/highlight_widgets.dart';
import 'package:paxel/widgets/slidercard/news_widgets.dart';
import 'package:paxel/widgets/slidercard/promo_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10),
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 25,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFECEAF8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.card_giftcard,
                            color: Color(0xFF5D52A0),
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Promo',
                            style: TextStyle(
                              color: Color(0xFF5D52A0),
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(
              child: Column(
                children: [
                  // Balance Section
                  BalanceWidgets(),
                  SizedBox(height: 20),

                  // Services Section
                  ServicesWidgets(),

                  // Highlight Section
                  HighlightWidgets(),

                  // Promo Section
                  PromoWidgets(),

                  // News Section
                  NewsWidgets(),

                  // Antarkan Kebaikan Section
                  AntarkankebaikanWidgets(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
