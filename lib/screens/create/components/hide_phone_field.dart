import 'package:amicao/stores/create_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HidePhoneField extends StatelessWidget {
  HidePhoneField(this.createStore);
  final CreateStore createStore;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Observer(builder: (_) {
            return Checkbox(
                activeColor: Colors.indigo,
                value: createStore.hidePhone,
                onChanged: createStore.setHidePhone);
          }),
          Expanded(child: Text('Ocultar o meu telefone neste anúncio'))
        ],
      ),
    );
  }
}
