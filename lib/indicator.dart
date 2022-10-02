import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PVIndicators extends StatefulWidget {
  const PVIndicators(this.controller, this.itemCount, {Key? key}) : super(key: key);
  final PageController controller;
  final int itemCount;

  @override
  State<PVIndicators> createState() => _PVIndicatorsState();
}

class _PVIndicatorsState extends State<PVIndicators> {

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
      child:
      ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: _buildPageIndicator(widget.itemCount),
      )
    );
  }

  _handleChanges() {
    setState(() {});
  }

  List<Widget> _buildPageIndicator(int itemCount) {
    List<Widget> list = [];
    for (int i=0; i<itemCount; i++) {
      list.add(i == widget.controller.page ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return SizedBox(
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
