import 'package:flutter/material.dart';

class IntroSlider extends StatelessWidget {
  const IntroSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              EachPage('assets/landing_a_share.jpg', 'landing_a_share'),
              EachPage('assets/landing_b_zam.jpg', 'landing_d_zam'),
              EachPage('assets/landing_c_bam.jpg', 'landing_d_bam'),
              EachPage('assets/landing_d_dfile.jpg', 'landing_d_dfile'),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:  ElevatedButton(onPressed: (){}, child: Text('Register'))),
                ),
                Expanded(child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:  ElevatedButton(onPressed: (){}, child: Text('Login'))),
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
  String imagePath, tagLine;

  EachPage(this.imagePath, this.tagLine, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, width: 500, height: 500),
        Text(
            tagLine,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
