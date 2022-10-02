import 'package:flutter/material.dart';
import 'package:intro_slider_app/indicator.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({Key? key}) : super(key: key);

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: const [
              EachPage('assets/landing_a.jpg', 'landing_a'),
              EachPage('assets/landing_b.jpg', 'landing_b'),
              EachPage('assets/landing_c.jpg', 'landing_c'),
              EachPage('assets/landing_d.jpg', 'landing_d'),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PVIndicators(controller, 4),
                Row(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child:  ElevatedButton(onPressed: (){}, child: const Text('Register'))),
                    ),
                    Expanded(child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child:  ElevatedButton(onPressed: (){}, child: const Text('Login'))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EachPage extends StatelessWidget {
  const EachPage(this.imagePath, this.tagLine, {Key? key}) : super(key: key);
  final String imagePath, tagLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, width: 500, height: 500),
        Text(
            tagLine,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
