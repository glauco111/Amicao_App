import 'package:amicao/screens/filter/components/price_field.dart';
import 'package:amicao/screens/filter/components/section_title.dart';
import 'package:amicao/stores/filter_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PriceRangeField extends StatelessWidget {
  PriceRangeField(this.filter);
  final FilterStore filter;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionTitle('Preço'),
        Row(
          children: [
            PriceField(
              label: 'Min',
              onChanged: filter.setMinPrice,
              initialValue: filter.minPrice,
            ),
            const SizedBox(
              width: 12,
            ),
            PriceField(
              onChanged: filter.setMaxPrice,
              label: 'Max',
              initialValue: filter.maxPrice,
            ),
          ],
        ),
        Observer(builder: (_) {
          if (filter.priceError != null)
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                filter.priceError,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 13,
                    fontStyle: FontStyle.italic),
              ),
            );
          return Container();
        }),
      ],
    );
  }
}
