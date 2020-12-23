import 'package:amicao/helpers/extensions.dart';
import 'package:amicao/models/ad.dart';
import 'package:amicao/screens/ad/ad_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdTile extends StatelessWidget {
  AdTile(this.ad);
  final Ad ad;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => AdScreen(ad)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        height: 135,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(16),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 135,
                width: 130,
                child: CachedNetworkImage(
                  imageUrl: ad.images.isEmpty
                      ? 'https://static.thenounproject.com/png/194055-200.png'
                      : ad.images.first,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ad.title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ad.price.formattedMoney(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '${ad.created.formattedDate()} - ${ad.address.city.name} - ${ad.address.uf.initials}',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
