import 'package:flutter/material.dart';
import 'package:paxel/widgets/slidercard/slider_card_widgets.dart';

class AntarkankebaikanWidgets extends StatelessWidget {
  const AntarkankebaikanWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Icon(
                Icons.favorite_border_outlined,
                color: Color(0xFF5D52A0),
                size: 20,
              ),
              SizedBox(width: 5),
              Text(
                '#antarkankebaikan',
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
                imagePath: 'images/antarkankebaikan1.jpg',
                title:
                    'Paxel with Johari Zein Foundation #AntarkanKebaikan through the Blessing Food Car',
              ),
              SliderCardWidgets(
                imagePath: 'images/antarkankebaikan2.jpg',
                title:
                    'Full of Enthusiasm, Follow Paxel\'s Journey to Deliver Kindness',
              ),
              SliderCardWidgets(
                imagePath: 'images/antarkankebaikan3.jpg',
                title:
                    'Paxel\'s Spirit of Delivering Kindness in a Month Full of Blessings',
              ),
              SliderCardWidgets(
                imagePath: 'images/antarkankebaikan4.jpg',
                title:
                    'Follow Paxel\'s Journey of Delivering Kindness in the Month of Love',
              ),
              SliderCardWidgets(
                imagePath: 'images/antarkankebaikan5.jpg',
                title:
                    'Starting the Year 2024 with the Spirit of #AntarkanKebaikan',
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
