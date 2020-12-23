import 'package:amicao/components/custom_drawer/custom_drawer.dart';
import 'package:amicao/components/error_box/error_box.dart';
import 'package:amicao/stores/signup_store.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/field_title.dart';


class SignUpScreen extends StatelessWidget {

  final SignupStore signupStore = SignupStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: const Text('Cadastro'),centerTitle: true,),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Observer(builder: (_){
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ErrorBox(
                            message: signupStore.error
                          ),
                        );
                      },
                      ),
                      FieldTitle(
                        title: 'Apelido',
                        subtitle: 'Como aparecerá em seus anúncios.',
                      ),
                      Observer(builder: (_){
                        return TextField(
                          enabled: !signupStore.loading,
                          onChanged: signupStore.setName,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: José de O.',
                            isDense: true,
                            errorText: signupStore.nameError,
                          ),
                        );
                      }),
                      const SizedBox(height: 16,),
                      FieldTitle(
                        title: 'E-mail',
                        subtitle: 'Enviaremos um e-mail para confirmação.',
                      ),
                      Observer(builder:(_){
                        return TextField(
                          enabled: !signupStore.loading,
                          onChanged: signupStore.setEmail,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          decoration: InputDecoration(
                            errorText: signupStore.emailError,
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: jose@outlook.com',
                            isDense: true,
                          ),
                        );
                      }),
                      const SizedBox(height: 16,),
                      FieldTitle(
                        title: 'Celular',
                        subtitle: 'Proteja sua conta.',
                      ),
                      Observer(builder:(_){
                        return TextField(
                          enabled: !signupStore.loading,
                          onChanged: signupStore.setPhone,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter()
                          ],
                          decoration: InputDecoration(
                            errorText: signupStore.phoneError,
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: (19)99999-9999',
                            isDense: true,
                          ),
                        );
                      }),
                      const SizedBox(height: 16,),
                      FieldTitle(
                        title: 'Senha',
                        subtitle: 'Use letras, números e caracteres especiais.',
                      ),
                       Observer(builder:(_){
                         return TextField(
                           enabled: !signupStore.loading,
                           onChanged: signupStore.setPass1,
                           decoration: InputDecoration(
                             errorText: signupStore.pass1Error,
                             border: const OutlineInputBorder(),
                             isDense: true, ),
                           obscureText: true,);
                       }),
                      const SizedBox(height: 16,),
                      FieldTitle(
                        title: 'Confirmar a senha',
                        subtitle: 'Confirme sua senha.',
                      ),
                      Observer(builder:(_){
                        return
                          TextField(
                            enabled: !signupStore.loading,
                            onChanged: signupStore.setPass2,
                            decoration: InputDecoration(
                              errorText: signupStore.pass2Error,
                              border: const OutlineInputBorder(),
                              isDense: true, ),
                            obscureText: true,);
                      }),
                      const SizedBox(height: 16,),
                      Observer(builder:(_){
                        return Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 12),
                          height: 40,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            onPressed: signupStore.signUpPressed,
                            color: Colors.indigo,
                            disabledColor: Colors.indigo.withAlpha(120),
                            textColor: Colors.white,
                            elevation: 0,
                            child: signupStore.loading ?
                                CircularProgressIndicator(): const Text('CADASTRAR'),
                          ),
                        );
                      }),
                        Divider(color: Colors.black,),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                          const Text(
                            'Ja tem uma conta?  ',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: Navigator.of(context).pop,
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.indigo,
                                fontSize: 16
                              ),
                            ),
                          ),
                        ],
                          ), 
                      )
                    ]
                ),
              ),
          ),
                  ),
        ),
      ),
    );
  }
}