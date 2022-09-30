import 'package:flutter/material.dart';

class IntroSlider extends StatelessWidget {
  const IntroSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.greenAccent,
        ),
      ],
    );
  }
}
