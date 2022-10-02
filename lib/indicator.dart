import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Indicator extends StatefulWidget {
  const Indicator(this.controller, this.itemCount, {Key? key}) : super(key: key);
  final PageController controller;
  final int itemCount;

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {

  @override
  void initState() {
    widget.controller.addListener(_handleChanges);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleChanges);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Refreshing the layout');
    }
    return SizedBox(
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.itemCount,
        itemBuilder: (context, index) {
          return _createIndicatorElements(index);
        },
      ),
    );
  }

  Widget _createIndicatorElements(index) {
    double w = 10;
    double h = 10;
    MaterialColor color = Colors.grey;

    if(widget.controller.page==index) {
      w = 15;
      h = 15;
      color = Colors.blueGrey;
    }

    return SizedBox(
      height: 16,
      width: 16,
      child: Center(
        child: AnimatedContainer(
          margin: const EdgeInsets.all(5),
          width: w,
          height: h,
          color: color,
          duration: const Duration(milliseconds: 100),
        ),
      ),
    );
  }

  _handleChanges() {
    setState(() {

    });
  }
  
  Widget _indicator(bool isActive) {
    return Container(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10.0 : 8.0,
        width: isActive ? 12.0 : 8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
              color: const Color(0XFF2FB7B2).withOpacity(0.72),
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: const Offset(
                0.0,
                0.0,
              ),
            )
                : const BoxShadow(
              color: Colors.transparent,
            )
          ],
          shape: BoxShape.circle,
          color: isActive ? const Color(0XFF6BC4C9) : const Color(0XFFEAEAEA),
        ),
      ),
    );
  }
}
