import 'package:amicao/models/ad.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DescriptionPanel extends StatelessWidget {
  DescriptionPanel(this.ad);
  final Ad ad;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text(
            'Descrição',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: ReadMoreText(
            ad.description,
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Ver mais...',
            trimExpandedText: '...ver menos',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
