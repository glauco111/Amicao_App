import 'package:amicao/components/custom_drawer/custom_drawer.dart';
import 'package:amicao/screens/myads/myads_screen.dart';
import 'package:amicao/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Minha Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 150,
                child: Stack(children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          GetIt.I<UserManagerStore>().user.name,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.indigo),
                        ),
                        Text(
                          GetIt.I<UserManagerStore>().user.email,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.indigo.withAlpha(120)),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: FlatButton(
                      child: Text(
                        'EDITAR',
                        style: TextStyle(
                            color: Colors.indigo, fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ]),
              ),
              Divider(),
              ListTile(
                title: Text('Meus Anuncios',
                    style: TextStyle(
                        color: Colors.indigo, fontWeight: FontWeight.w500)),
                trailing: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.indigo,
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => MyAdsScreen()));
                },
              ),
              ListTile(
                title: Text('Favoritos',
                    style: TextStyle(
                        color: Colors.indigo, fontWeight: FontWeight.w500)),
                trailing: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.indigo,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
