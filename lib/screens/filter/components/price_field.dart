import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceField extends StatelessWidget {
  PriceField({this.label, this.onChanged, this.initialValue});
  final Function(int) onChanged;
  final int initialValue;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        style: TextStyle(fontSize: 16),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          RealInputFormatter(centavos: false)
        ],
        decoration: InputDecoration(
          labelText: label,
          isDense: true,
          prefixText: 'R\$ ',
          border: OutlineInputBorder(),
        ),
        onChanged: (text) {
          onChanged(int.tryParse(text.replaceAll('.', '')));
        },
        initialValue: initialValue?.toString(),
      ),
    );
  }
}
