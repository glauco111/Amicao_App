import 'package:amicao/helpers/extensions.dart';
import 'package:amicao/models/ad.dart';
import 'package:flutter/material.dart';

class UserPanel extends StatelessWidget {
  UserPanel(this.ad);
  final Ad ad;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 18),
          child: Text(
            'Anunciante',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ad.user.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Na Amicão desde: ${ad.user.createdAt.formattedDate()}',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        )
      ],
    );
  }
}
