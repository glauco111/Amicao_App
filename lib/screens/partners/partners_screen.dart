import 'package:amicao/components/custom_drawer/custom_drawer.dart';
import 'package:amicao/screens/partners/part/hotel_screen.dart';
import 'package:amicao/screens/partners/part/lab_screen.dart';
import 'package:amicao/screens/partners/part/petshop_screen.dart';
import 'package:amicao/screens/partners/part/vet_screen.dart';
import 'package:flutter/material.dart';

import 'file:///C:/dev/amicao/lib/screens/partners/components/slide_tile.dart';

class PartnersScreen extends StatefulWidget {
  PartnersScreen({Key key}) : super(key: key);
  @override
  _PartnersScreenState createState() => _PartnersScreenState();
}

class _PartnersScreenState extends State<PartnersScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  int _currentPage = 0;

  var _listImage = [
    {'id': 0, 'image': 'assets/pet_shop_n.png'},
    {'id': 1, 'image': 'assets/vet_n.png'},
    {'id': 2, 'image': 'assets/lab_pet_n.png'},
    {'id': 3, 'image': 'assets/hot_pet.png'}
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          'Parceiros',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _listImage.length,
              itemBuilder: (_, currentIndex) {
                bool activePage = currentIndex == _currentPage;
                return GestureDetector(
                  onTap: () {
                    if (_currentPage == 0)
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => PetShopScreen(),
                      ));
                    else if (_currentPage == 1)
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => VetScreen(),
                      ));
                    else if (_currentPage == 2)
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => LabScreen(),
                      ));
                    else if (_currentPage == 3)
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => HotelScreen(),
                      ));
                  },
                  child: SlideTile(
                      activePage: activePage,
                      image: _listImage[currentIndex]['image']),
                );
              },
            ),
          ),
          _buildbullets(),
        ],
      ),
    );
  }

  Widget _buildbullets() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _listImage.map((i) {
          return InkWell(
            onTap: () {
              setState(() {
                _pageController.jumpToPage(i['id']);
                _currentPage = i['id'];
              });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: _currentPage == i['id'] ? Colors.white : Colors.grey,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
