import 'dart:math';

import 'package:amicao/components/custom_drawer/custom_drawer.dart';
import 'package:amicao/components/error_box/error_box.dart';
import 'package:amicao/screens/signup/signup_screen.dart';
import 'package:amicao/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class LoginScreen extends StatelessWidget {
  final LoginStore loginStore = LoginStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: const Text('Entrar'),centerTitle: true,),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Acessar com E-mail:',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                  ),
                  ),
                  Observer(builder: (_){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ErrorBox(
                          message: loginStore.error
                      ),
                    );
                  },
                  ),
                  Padding(padding: const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                  child: const Text('E-mail', style: TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w700),),),
                  Observer(builder:(_){
                    return TextField(
                      enabled: !loginStore.loading,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: loginStore.emailError
                      ),
                      onChanged: loginStore.setEmail,
                      keyboardType: TextInputType.emailAddress,);
                  }),
                  const SizedBox(height: 16,),
                  Padding(padding: const EdgeInsets.only(left: 3, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      const Text('Senha', style: TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w700),),
                      GestureDetector(
                        onTap: (){},
                        child: const Text('Esqueci minha senha', style: TextStyle(color: Colors.lightBlueAccent, decoration: TextDecoration.underline),),
                      )
                    ],),),
                  Observer(builder:(_){
                    return TextField(
                      enabled: !loginStore.loading,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: loginStore.passwordError
                      ),
                      onChanged: loginStore.setPassword,
                      obscureText: true,);
                  }),
                  Observer(builder:(_){
                    return Container(
                      height: 40,
                      margin: const EdgeInsets.only(top: 20, bottom: 12),
                      child: RaisedButton(

                        disabledColor: Colors.indigo.withAlpha(120),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        onPressed: loginStore.loginPressed,
                        color: Colors.indigo,
                        textColor: Colors.white,
                        elevation: 0,
                        child: loginStore.loading
                        ? CircularProgressIndicator()
                        : const Text('ENTRAR'),
                      ),
                    );
                  }),
                  Divider(color: Colors.black45,),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      const Text(
                        'Não tem uma conta?    ',
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignUpScreen()));
                        },
                        child: Text(
                          'Cadastre-se',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.indigo,
                            fontSize: 16
                          ),
                        ),
                      )
                    ],
                  ),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
