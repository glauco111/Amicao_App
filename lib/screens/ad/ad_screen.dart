import 'package:amicao/models/ad.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'components/bottom_bar.dart';
import 'components/description_panel.dart';
import 'components/location_panel.dart';
import 'components/main_panel.dart';
import 'components/user_panel.dart';

class AdScreen extends StatelessWidget {
  AdScreen(this.ad);
  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Anúncio'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: 200,
                child: Carousel(
                  images: ad.images
                      .map((url) => CachedNetworkImageProvider(url))
                      .toList(),
                  dotSize: 4,
                  dotBgColor: Colors.transparent,
                  dotColor: Colors.indigo,
                  autoplay: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MainPanel(ad),
                    Divider(color: Colors.grey[500]),
                    DescriptionPanel(ad),
                    Divider(color: Colors.grey[500]),
                    LocationPanel(ad),
                    Divider(color: Colors.grey[500]),
                    UserPanel(ad),
                    SizedBox(height: ad.status == AdStatus.PENDING ? 30 : 100)
                  ],
                ),
              ),
            ],
          ),
          BottomBar(ad),
        ],
      ),
    );
  }
}