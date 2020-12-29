import 'package:amicao/components/custom_drawer/custom_drawer.dart';
import 'package:amicao/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'components/ad_tile.dart';
import 'components/create_ad_button.dart';
import 'components/search_dialog.dart';
import 'components/top_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  final HomeStore homeStore = GetIt.I<HomeStore>();

  openSearch(BuildContext context) async {
    final search = await showDialog(
      context: context,
      builder: (_) => SearchDialog(
        currentSearch: homeStore.search,
      ),
    );
    if (search != null) homeStore.setSearch(search);
    print(search);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.indigo, Colors.blueAccent]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Observer(builder: (_) {
              if (homeStore.search.isEmpty)
                return Container();
              else
                return GestureDetector(
                  onTap: () => openSearch(context),
                  child: LayoutBuilder(
                    builder: (_, constraints) {
                      return Container(
                        width: constraints.biggest.width,
                        child: Text(homeStore.search),
                      );
                    },
                  ),
                );
            }),
            actions: [
              Observer(
                builder: (_) {
                  if (homeStore.search.isEmpty)
                    return IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          openSearch(context);
                        });
                  return IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        homeStore.setSearch('');
                      });
                },
              )
            ],
          ),
          drawer: CustomDrawer(),
          body: Column(
            children: [
              TopBar(),
              Expanded(
                child: Stack(
                  children: [
                    Observer(builder: (_) {
                      if (homeStore.error != null)
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error,
                              color: Colors.white,
                              size: 100,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Ocorreu um erro!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        );
                      if (homeStore.showProgress)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      if (homeStore.adList.isEmpty)
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.border_clear,
                              color: Colors.white,
                              size: 140,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Hmmm...\nNenhum anúncio encontrado!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            )
                          ],
                        );
                      return ListView.builder(
                        controller: scrollController,
                        itemCount: homeStore.itemCount,
                        itemBuilder: (_, index) {
                          if (index < homeStore.adList.length)
                            return AdTile(homeStore.adList[index]);
                          homeStore.loadNextPage();
                          return Container(
                            height: 10,
                            child: LinearProgressIndicator(),
                          );
                        },
                      );
                    }),
                    Positioned(
                        bottom: -50,
                        left: 0,
                        right: 0,
                        child: CreateAdButton(scrollController))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
