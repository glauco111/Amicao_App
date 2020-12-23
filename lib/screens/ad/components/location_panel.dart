import 'package:amicao/models/ad.dart';
import 'package:flutter/material.dart';

class LocationPanel extends StatelessWidget {
  LocationPanel(this.ad);
  final Ad ad;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 10),
          child: Text(
            'Localização',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: const [
                  Text('CEP'),
                  SizedBox(
                    height: 12,
                  ),
                  Text('Município'),
                  SizedBox(
                    height: 12,
                  ),
                  Text('Bairro')
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(ad.address.cep),
                  SizedBox(
                    height: 12,
                  ),
                  Text(ad.address.city.name),
                  SizedBox(
                    height: 12,
                  ),
                  Text(ad.address.district),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
