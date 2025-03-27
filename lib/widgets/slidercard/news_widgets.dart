import 'package:flutter/material.dart';
import 'package:paxel/widgets/slidercard/slider_card_widgets.dart';

class NewsWidgets extends StatelessWidget {
  const NewsWidgets({super.key});

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
                Icons.newspaper_outlined,
                color: Color(0xFF5D52A0),
                size: 20,
              ),
              SizedBox(width: 5),
              Text(
                'News',
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
                imagePath: 'images/news1.webp',
                title:
                    'Preparing to Welcome Ramadan: Tips and Tricks to Make It More Meaningful',
              ),
              SliderCardWidgets(
                imagePath: 'images/news2.webp',
                title: 'Ngabuburit is The Right Moment to do This Activity!',
              ),
              SliderCardWidgets(
                imagePath: 'images/news3.webp',
                title:
                    'Bukber Outfit Inspiration: Look Fashionable & Relaxed When Iftar',
              ),
              SliderCardWidgets(
                imagePath: 'images/news4.webp',
                title:
                    '35 Words for Welcoming the Month of Ramadan for Business Partners',
              ),
              SliderCardWidgets(
                imagePath: 'images/news5.webp',
                title:
                    '8 Simple and Memorable Valentine\'s Gift Ideas for Women',
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
