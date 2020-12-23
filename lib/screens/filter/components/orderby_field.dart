import 'package:amicao/screens/filter/components/section_title.dart';
import 'package:amicao/stores/filter_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OrderByField extends StatelessWidget {
  OrderByField(this.filter);
  final FilterStore filter;
  @override
  Widget build(BuildContext context) {
    Widget buildOption(String title, OrderBy option) {
      return GestureDetector(
        onTap: () {
          filter.setOrderBy(option);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          alignment: Alignment.center,
          height: 50,
          child: Text(
            title,
            style: TextStyle(
                color: filter.orderBy == option ? Colors.white : Colors.indigo,
                fontWeight: FontWeight.w600),
          ),
          decoration: BoxDecoration(
            border: Border.all(
                color: filter.orderBy == option ? Colors.indigo : Colors.grey),
            color:
                filter.orderBy == option ? Colors.indigo : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Ordernar por:'),
        Observer(builder: (_) {
          return Row(
            children: [
              buildOption('Data', OrderBy.DATE),
              const SizedBox(width: 12),
              buildOption('Preço', OrderBy.PRICE),
            ],
          );
        })
      ],
    );
  }
}
