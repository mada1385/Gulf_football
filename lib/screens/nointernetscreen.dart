import 'package:flutter/material.dart';

class Nointernetscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
          // decoration: BoxDecoration(gradient: k_gradient),
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                // title: Tiltle(),
                centerTitle: true,
              ),
              body: Container(
                color: Colors.white,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "asset/noI.png",
                      height: 400,
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ))),
    );
  }
}
