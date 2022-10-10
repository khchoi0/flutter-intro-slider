import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intro_slider_app/intro_slider.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/logo.svg", width: 64,height: 64,),
            const Expanded(
                child: IntroSlider()
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:  ElevatedButton(onPressed: (){}, child: const Text('Login'))),
                ),
                Expanded(child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:  ElevatedButton(onPressed: (){}, child: const Text('Create Account'))),
                ),
              ],
            )
          ],
    );
  }
}
