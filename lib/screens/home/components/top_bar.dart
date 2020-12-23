import 'package:amicao/screens/category/category_screen.dart';
import 'package:amicao/screens/filter/filter_screen.dart';
import 'package:amicao/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'bar_button.dart';

class TopBar extends StatelessWidget {
  final HomeStore homeStore = GetIt.I<HomeStore>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Observer(builder: (_) {
            return BarButton(
              onTap: () async {
                final category = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CategoryScreen(
                      showAll: true,
                      selected: homeStore.category,
                    ),
                  ),
                );
                if (category != null) homeStore.setCategory(category);
              },
              label: homeStore.category?.description ?? 'Categorias',
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }),
        ),
        Expanded(
          child: BarButton(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FilterScreen(),
                ),
              );
            },
            label: 'Filtros',
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.white,
                ),
                bottom: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
