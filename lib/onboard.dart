import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intro_slider_app/page_view_item.dart';
import 'package:is_first_run/is_first_run.dart';

import 'login_register_pages.dart';
import 'pageview_indicator.dart';


class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  List<String> slideTitle = [
    'First Slide\nStill Title',
    'Second Slide',
    'Third Slide',
    'Forth Slide',
  ];
  List<String> slideText = [
    '',
    'second slide text',
    'third slide text',
    'forth slide text',
  ];
  List<String> slideImgPath = [
    'assets/black-landing_a.jpg',
    'assets/black-landing_b.jpg',
    'assets/black-landing_c.jpg',
    'assets/black-landing_d.jpg',
  ];
  List<String> slideVdoPath = [
    '',
    '',
    '',
    '',
  ];

  PageController pageController = PageController();
  int currentPage = 0;
  bool? _isFirstRun;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  void _checkFirstRun() async {
    bool ifr = await IsFirstRun.isFirstRun();
    setState(() {
      _isFirstRun = ifr;
    });
  }

  void push({required Widget page, required Function? popCallback}) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    })).then((data) {
      if (popCallback != null) {
        popCallback(data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _checkFirstRun();
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
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
            flex: 12,
            child: PageView.builder(
              itemCount:
              _isFirstRun != null && _isFirstRun! ? slideTitle.length : 1,
              controller: pageController,
              onPageChanged: _onPageChanged,
              itemBuilder: (BuildContext context, int index) {
                return PageViewItem(
                  slideTitle[index],
                  slideText[index],
                  slideImgPath[index],
                  slideVdoPath[index],
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Visibility(
              visible: _isFirstRun ?? true,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: PageViewIndicator(pageController, slideTitle.length),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Visibility(
                  visible: _isFirstRun != null && _isFirstRun!
                      ? currentPage != slideTitle.length - 1
                      : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width, 56),
                        ),
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontFamily: "roboto_medium",
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        pageController.animateToPage(
                          4,
                          duration: const Duration(seconds: 2),
                          curve: Curves.linearToEaseOut,
                        );
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: _isFirstRun != null && _isFirstRun!
                      ? currentPage == slideTitle.length - 1
                      : true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                Size(MediaQuery.of(context).size.width, 56),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.black26),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            onPressed: () {
                              push(page: const SignInPage(), popCallback: null);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.black45,
                                fontFamily: "roboto_medium",
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                Size(MediaQuery.of(context).size.width, 56),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.greenAccent),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            onPressed: () {
                              push(
                                  page: const CreateAccountPage(), popCallback: null);
                            },
                            child: const Text(
                              'Create Account',
                              style: TextStyle(
                                color: Colors.black45,
                                fontFamily: "roboto_medium",
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
