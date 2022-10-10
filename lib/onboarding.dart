import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intro_slider_app/page_view_item.dart';

import 'indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 8,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: SvgPicture.asset(
                      "assets/logo.svg",
                      width: 64,
                      height: 64,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 48,
            child: PageView(
              controller: controller,
              children: const [
                PageViewItem('assets/landing_a.jpg', 'landing_a'),
                PageViewItem('assets/landing_b.jpg', 'landing_b'),
                PageViewItem('assets/landing_c.jpg', 'landing_c'),
                PageViewItem('assets/landing_d.jpg', 'landing_d'),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.bottomCenter,
              child:PVIndicators(controller, 4),
            ),
          ),
          Expanded(
            flex: 8,
            child: Row(
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
          )
        ],
      ),
    );
  }
}
