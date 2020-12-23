import 'package:amicao/helpers/extensions.dart';
import 'package:amicao/models/ad.dart';
import 'package:flutter/material.dart';

class MainPanel extends StatelessWidget {
  MainPanel(this.ad);
  final Ad ad;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 10,
          ),
          child: Text(
            ad.price.formattedMoney(),
            style: TextStyle(
                fontSize: 34,
                letterSpacing: 2.8,
                fontWeight: FontWeight.w300,
                color: Colors.grey[800]),
          ),
        ),
        Text(
          ad.title,
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 18),
          child: Text('Publicado em ${ad.created.formattedDate()}'),
        ),
      ],
    );
  }
}
