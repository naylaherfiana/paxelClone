import 'package:flutter/material.dart';
import 'package:paxel/widgets/slidercard/slider_card_widgets.dart';

class PromoWidgets extends StatelessWidget {
  const PromoWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Icon(Icons.discount, color: Color(0xFF5D52A0), size: 20),
              SizedBox(width: 5),
              Text(
                'Promo',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SliderCardWidgets(
                imagePath: 'images/promo1.webp',
                title: 'Send Ramadan Needs with Astrapay, Discounts up to 30%',
              ),
              SliderCardWidgets(
                imagePath: 'images/promo2.webp',
                title: 'Save More on Ramadhan: 5% Cashback with SPayLater',
              ),
              SliderCardWidgets(
                imagePath: 'images/promo3.webp',
                title:
                    'Send Packages More Profitably Using Astrapay Discount Up to 30%',
              ),
              SliderCardWidgets(
                imagePath: 'images/promo4.webp',
                title:
                    'Get 50% Shipping Discount when Sending Packages to New Paxel Areas',
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
