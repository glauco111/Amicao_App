import 'package:amicao/components/custom_drawer/custom_drawer.dart';
import 'package:amicao/components/error_box/error_box.dart';
import 'package:amicao/stores/create_store.dart';
import 'package:amicao/stores/page_store.dart';
import 'package:brasil_fields/formatter/real_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'components/category_field.dart';
import 'components/cep_field.dart';
import 'components/hide_phone_field.dart';
import 'components/images_field.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final labelStyle = TextStyle(
    fontWeight: FontWeight.w800,
    color: Colors.black54,
    fontSize: 18,
  );

  final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);

  final CreateStore createStore = CreateStore();

  @override
  void initState() {
    super.initState();
    when((_) => createStore.savedAd, () {
      GetIt.I<PageStore>().setPage(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Criar Anúncio'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Observer(builder: (_) {
              if (createStore.loading)
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Salvando o Anúncio',
                        style: TextStyle(fontSize: 18, color: Colors.indigo),
                      ),
                      const SizedBox(height: 16),
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              else
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImagesField(createStore),
                    Observer(builder: (_) {
                      return TextFormField(
                        onChanged: createStore.setTitle,
                        decoration: InputDecoration(
                          errorText: createStore.titleError,
                          contentPadding: contentPadding,
                          labelText: 'Título *',
                          labelStyle: labelStyle,
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      return TextFormField(
                        onChanged: createStore.setDescription,
                        maxLines: null,
                        decoration: InputDecoration(
                          errorText: createStore.descriptionError,
                          contentPadding: contentPadding,
                          labelText: 'Descrição *',
                          labelStyle: labelStyle,
                        ),
                      );
                    }),
                    CategoryField(createStore),
                    CepField(createStore),
                    Observer(builder: (_) {
                      return TextFormField(
                        initialValue: createStore.priceText,
                        onChanged: createStore.setPrice,
                        decoration: InputDecoration(
                          labelText: 'Preço *',
                          labelStyle: labelStyle,
                          contentPadding: contentPadding,
                          prefixText: 'R\$ ',
                          errorText: createStore.priceError,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RealInputFormatter(centavos: true),
                        ],
                      );
                    }),
                    HidePhoneField(createStore),
                    Observer(builder: (_) {
                      return ErrorBox(
                        message: createStore.error,
                      );
                    }),
                    SizedBox(
                      height: 50,
                      child: Observer(
                        builder: (_) {
                          return GestureDetector(
                            onTap: createStore.invalidSendPressed,
                            child: RaisedButton(
                              textColor: Colors.white,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              color: Colors.indigo,
                              disabledColor: Colors.indigo.withAlpha(100),
                              child: Text(
                                'Enviar',
                                style: TextStyle(fontSize: 18),
                              ),
                              onPressed: createStore.sendPressed,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
            }),
          ),
        ),
      ),
    );
  }
}
