import 'package:amicao/stores/filter_store.dart';
import 'package:amicao/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'components/orderby_field.dart';
import 'components/price_range_field.dart';
import 'components/vendor_type_field.dart';

class FilterScreen extends StatelessWidget {
  final FilterStore filter = GetIt.I<HomeStore>().clonedFilter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar Busca'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.symmetric(horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                OrderByField(filter),
                PriceRangeField(filter),
                VendorTypeField(filter),
                Observer(builder: (_) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    height: 50,
                    child: RaisedButton(
                      elevation: 0,
                      disabledColor: Colors.indigo.withAlpha(120),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      color: Colors.indigo,
                      textColor: Colors.white,
                      child: Text(
                        'FILTRAR',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      onPressed: filter.isFormValid
                          ? () {
                              filter.save();
                              Navigator.of(context).pop();
                            }
                          : null,
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
