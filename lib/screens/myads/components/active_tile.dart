import 'package:amicao/helpers/extensions.dart';
import 'package:amicao/models/ad.dart';
import 'package:amicao/screens/ad/ad_screen.dart';
import 'package:amicao/screens/create/create_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ActiveTile extends StatelessWidget {
  ActiveTile(this.ad);
  final Ad ad;
  final List<MenuChoice> choices = [
    MenuChoice(index: 0, title: 'Editar', iconData: Icons.edit),
    MenuChoice(index: 1, title: 'Já Vendi', iconData: Icons.thumb_up),
    MenuChoice(index: 2, title: 'Excluir', iconData: Icons.delete)
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => AdScreen(ad)));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 80,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: ad.images.isEmpty
                      ? 'https://static.thenounproject.com/png/194055-200.png'
                      : ad.images.first,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ad.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ad.price.formattedMoney(),
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '${ad.views} visitas',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  PopupMenuButton<MenuChoice>(
                    onSelected: (choice) {
                      switch (choice.index) {
                        case 0:
                          editAd(context);
                          break;
                        case 1:
                          break;
                        case 2:
                          break;
                      }
                    },
                    icon: Icon(
                      Icons.more_vert,
                      size: 30,
                      color: Colors.indigo,
                    ),
                    itemBuilder: (_) {
                      return choices
                          .map(
                            (choice) => PopupMenuItem<MenuChoice>(
                              value: choice,
                              child: Row(
                                children: [
                                  Icon(
                                    choice.iconData,
                                    size: 20,
                                    color: Colors.indigo,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    choice.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.indigo),
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> editAd(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => CreateScreen(ad: ad)));
  }
}

class MenuChoice {
  MenuChoice({this.title, this.index, this.iconData});
  final int index;
  final String title;
  final IconData iconData;
}
