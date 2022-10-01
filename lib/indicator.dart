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
}
