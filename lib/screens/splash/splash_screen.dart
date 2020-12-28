import 'dart:async';

import 'package:amicao/screens/base/base_screen.dart';
import 'package:flutter/material.dart';

class Lottie extends StatefulWidget {
  @override
  _LottieState createState() => _LottieState();
}

class _LottieState extends State<Lottie> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => BaseScreen())),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.indigo, Colors.blueAccent]),
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              child: Image.asset('assets/turma.png'),
            ),
          ),
          Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.white),
                    )),
              ))
        ],
      ),
    ));
  }
}
