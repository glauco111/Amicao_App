import 'package:amicao/components/error_box/error_box.dart';
import 'package:amicao/models/category.dart';
import 'package:amicao/stores/category_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({this.showAll = true, this.selected});
  final Category selected;
  final bool showAll;
  final CategoryStore categoryStore = GetIt.I<CategoryStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.fromLTRB(32, 12, 32, 32),
          child: Observer(
            builder: (_) {
              if (categoryStore.error != null) {
                return ErrorBox(
                  message: categoryStore.error,
                );
              } else if (categoryStore.categoryList.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final categories = showAll
                    ? categoryStore.allCategoryList
                    : categoryStore.categoryList;
                return ListView.separated(
                    itemBuilder: (_, index) {
                      final category = categories[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pop(category);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          color: category.id == selected?.id
                              ? Colors.indigo.withAlpha(50)
                              : null,
                          child: Text(
                            category.description,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: category.id == selected?.id
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: category.id == selected?.id ? 16 : null,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) {
                      return Divider(
                        height: 0.1,
                        color: Colors.indigo,
                      );
                    },
                    itemCount: categories.length);
              }
            },
          ),
        ),
      ),
    );
  }
}
