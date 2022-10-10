import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(this.imagePath, this.tagLine, {Key? key}) : super(key: key);
  final String imagePath, tagLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    tagLine,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    tagLine,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
            ),
          ],
        ),
        Image.asset(imagePath, fit: BoxFit.fitWidth,),
      ],
    );
  }
}
