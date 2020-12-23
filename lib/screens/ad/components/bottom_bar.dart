import 'package:amicao/models/ad.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBar extends StatelessWidget {
  BottomBar(this.ad);
  final Ad ad;
  @override
  Widget build(BuildContext context) {
    if(ad.status == AdStatus.PENDING) return Container();
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 26),
            height: 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), color: Colors.indigo),
            child: Row(
              children: [
                if (!ad.hidePhone)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        final phone =
                            ad.user.phone.replaceAll(RegExp('[^0-9]'), '');
                        launch('tel:$phone');
                      },
                      child: Container(
                        height: 23,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border:
                                Border(right: BorderSide(color: Colors.white))),
                        child: Text(
                          'Ligar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 23,
                      alignment: Alignment.center,
                      child: Text(
                        'Chat',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border(top: BorderSide(color: Colors.grey[400])),
            ),
            height: 28,
            alignment: Alignment.center,
            child: Text(
              '${ad.user.name} (Anunciante)',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}
