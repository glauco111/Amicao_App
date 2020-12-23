import 'package:amicao/screens/login/login_screen.dart';
import 'package:amicao/stores/page_store.dart';
import 'package:amicao/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


class CustomDrawerHeader extends StatelessWidget {
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();
        if (userManagerStore.isLoggedIn){
          GetIt.I<PageStore>().setPage(4);
        }else{
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_)=> LoginScreen()));
        }
      },
      child: Container(
        color: Colors.blue,
        height: 95,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(Icons.person, color: Colors.white, size: 35,),
            const SizedBox(width: 20,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userManagerStore.isLoggedIn ? userManagerStore.user.name :
                    'Acesse sua conta', style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.w700),),
                  Text(userManagerStore.isLoggedIn ? userManagerStore.user.email :
                    'Clique Aqui!', style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.w700),),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
