import 'package:flutter/material.dart';

class PageViewIndicator extends StatefulWidget {
  const PageViewIndicator(this.controller, this.itemCount, {Key? key})
      : super(key: key);
  final PageController controller;
  final int itemCount;

  @override
  State<PageViewIndicator> createState() => _PageViewIndicatorState();
}

class _PageViewIndicatorState extends State<PageViewIndicator> {
  bool isInit = true;

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
    return SizedBox(
        height: 20,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: _buildPageIndicator(widget.itemCount),
        ));
  }

  _handleChanges() {
    setState(() {});
  }

  List<Widget> _buildPageIndicator(int itemCount) {
    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      if (isInit) {
        list.add(_indicator(true));
        i++;
        isInit = false;
      }
      list.add(
          i == widget.controller.page ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return SizedBox(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 0),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10.0 : 8.0,
        width: isActive ? 12.0 : 8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
              color: Colors.greenAccent.withOpacity(0.72),
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
          color: isActive ? Colors.greenAccent : Colors.blueGrey,
        ),
      ),
    );
  }
}
