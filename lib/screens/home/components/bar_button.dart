import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  BarButton({this.decoration, this.label, this.onTap});
  final BoxDecoration decoration;
  final VoidCallback onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: decoration,
        alignment: Alignment.center,
        height: 40,
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ),
    );
  }
}
