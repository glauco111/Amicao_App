import 'package:amicao/screens/myads/components/adopt_tile.dart';
import 'package:amicao/stores/myads_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/active_tile.dart';
import 'components/pending_tile.dart';

class MyAdsScreen extends StatefulWidget {
  MyAdsScreen({this.initialPage = 0});
  final int initialPage;
  @override
  _MyAdsScreenState createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen>
    with SingleTickerProviderStateMixin {
  final MyAdsStore store = MyAdsStore();
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: (3), vsync: this, initialIndex: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Meus Anuncios'),
        centerTitle: true,
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: tabController,
          tabs: [
            Tab(child: Text('ATIVOS')),
            Tab(child: Text('PENDENTES')),
            Tab(child: Text('DOADOS'))
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Observer(builder: (_) {
            if (store.activeAds.isEmpty) return Container();
            return ListView.builder(
                itemCount: store.activeAds.length,
                itemBuilder: (_, index) {
                  return ActiveTile(store.activeAds[index]);
                });
          }),
          Observer(builder: (_) {
            if (store.pendentAds.isEmpty) return Container();
            return ListView.builder(
                itemCount: store.pendentAds.length,
                itemBuilder: (_, index) {
                  return PendingTile(store.pendentAds[index]);
                });
          }),
          Observer(builder: (_) {
            if (store.adoptAds.isEmpty) return Container();
            return ListView.builder(
                itemCount: store.adoptAds.length,
                itemBuilder: (_, index) {
                  return AdoptTile(store.adoptAds[index]);
                });
          }),
        ],
      ),
    );
  }
}
