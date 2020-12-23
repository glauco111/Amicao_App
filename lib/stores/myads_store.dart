import 'package:amicao/models/ad.dart';
import 'package:amicao/repositories/ad_repository.dart';
import 'package:amicao/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'myads_store.g.dart';

class MyAdsStore = _MyAdsStore with _$MyAdsStore;

abstract class _MyAdsStore with Store {
  _MyAdsStore() {
    _getMyAds();
  }
  @observable
  List<Ad> allAds = [];

  @computed
  List<Ad> get activeAds =>
      allAds.where((ad) => ad.status == AdStatus.ACTIVE).toList();
  List<Ad> get pendentAds =>
      allAds.where((ad) => ad.status == AdStatus.PENDING).toList();
  List<Ad> get adoptAds =>
      allAds.where((ad) => ad.status == AdStatus.ADOPT).toList();

  Future<void> _getMyAds() async {
    final user = GetIt.I<UserManagerStore>().user;
    try {
      allAds = await AdRepository().getMyAds(user);
    } catch (e) {}
  }
}
