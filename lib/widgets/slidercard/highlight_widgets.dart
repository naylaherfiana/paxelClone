import 'package:flutter/material.dart';
import 'package:paxel/widgets/slidercard/slider_card_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class HighlightWidgets extends StatelessWidget {
  const HighlightWidgets({super.key});

  // Function to open a URL
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    debugPrint('Attempting to launch $url');
    if (await canLaunchUrl(uri)) {
      debugPrint('Launching $url');
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      ); // Membuka di browser eksternal
    } else {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: const [
              Icon(Icons.dvr, color: Color(0xFF5D52A0), size: 20),
              SizedBox(width: 5),
              Text(
                'Highlights',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // Horizontal Scrollable Cards
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  debugPrint('Card tapped!');
                  _launchURL('https://google.com');
                  // _launchURL(
                  //   'https://paxel.co/en/news-and-promos/detail/2025-03-06/jadwal-operasional-paxel-jelang-hari-raya-nyepi-dan-idulfitri-2025?user_app=true',
                  // );
                },
                child: const SliderCardWidgets(
                  imagePath: 'images/highlight1.webp',
                  title:
                      'Paxel Operational Schedule for Nyepi and Eid al-Fitr 2025',
                ),
              ),
              GestureDetector(
                onTap:
                    () => _launchURL(
                      'https://paxel.co/en/news-and-promos/detail/2024-10-01/paxel-perusahaan-kurir-logistik-pertama-dengan-sertifikasi-halal-logistik-di-indonesia?user_app=true ',
                    ),
                child: const SliderCardWidgets(
                  imagePath: 'images/highlight2.webp',
                  title:
                      'Paxel: The First Logistics Courier Company with Halal Logistics Certification in Indonesia',
                ),
              ),
              GestureDetector(
                onTap:
                    () => _launchURL(
                      'https://paxel.co/en/news-and-promos/detail/2021-11-09/cek-paxel-terdekat-ini-daftar-lokasi-paxel-counter-untuk-pengiriman-paket?user_app=true ',
                    ),
                child: const SliderCardWidgets(
                  imagePath: 'images/highlight3.webp',
                  title:
                      'Check the Nearest Paxel, Here are Paxel Counter Location for Package Delivery',
                ),
              ),
              GestureDetector(
                onTap:
                    () => _launchURL(
                      'https://paxel.co/en/news-and-promos/detail/2024-04-18/kunci-kirim-paket-lancar-tanpa-retur-ukuran-paket-sesuai?user_app=true ',
                    ),
                child: const SliderCardWidgets(
                  imagePath: 'images/highlight4.webp',
                  title:
                      'The Key to Smooth Package Delivery without Returns, Correct Package Size!',
                ),
              ),
              GestureDetector(
                onTap:
                    () => _launchURL(
                      'https://paxel.co/en/news-and-promos/detail/2024-11-28/simak-faq-ini-untuk-memahami-proses-pengiriman-paxel?user_app=true ',
                    ),
                child: const SliderCardWidgets(
                  imagePath: 'images/highlight5.webp',
                  title:
                      'Check out this FAQ to Understand the Paxel Shipping Process',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
