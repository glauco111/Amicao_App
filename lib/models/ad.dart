import 'package:amicao/models/city.dart';
import 'package:amicao/models/uf.dart';
import 'package:amicao/models/user.dart';
import 'package:amicao/repositories/table_keys.dart';
import 'package:amicao/repositories/user_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'address.dart';
import 'category.dart';

enum AdStatus { PENDING, ACTIVE, ADOPT, DELETED }

class Ad {
  Ad.fromParse(ParseObject object) {
    id = object.objectId;
    title = object.get<String>(keyAdTitle);
    description = object.get<String>(keyAdDescription);
    images = object.get<List>(keyAdImages).map((e) => e.url).toList();
    hidePhone = object.get<bool>(keyAdHidePhone);
    price = object.get<num>(keyAdPrice);
    created = object.createdAt;
    address = Address(
      district: object.get<String>(keyAdDistrict),
      city: City(name: object.get<String>(keyAdCity)),
      cep: object.get<String>(keyAdPostalCode),
      uf: UF(initials: object.get<String>(keyAdFederativeUnit)),
    );
    views = object.get<int>(keyAdViews, defaultValue: 0);
    user = UserRepository().mapParseToUser(object.get<ParseUser>(keyAdOwner));
    category = Category.fromParse(object.get<ParseObject>(keyAdCategory));
    status = AdStatus.values[object.get<int>(keyAdStatus)];
  }
  Ad();
  String id;
  List images = [];
  String title;
  String description;
  Category category;
  Address address;
  num price;
  bool hidePhone = false;
  AdStatus status = AdStatus.PENDING;
  DateTime created;
  User user;
  int views;
}
