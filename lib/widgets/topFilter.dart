import 'package:flutter/material.dart';
import 'package:tatilsehri/colors.dart';

class Topfilter extends StatefulWidget {
  String content;
  Topfilter(this.content);
  @override
  _TopfilterState createState() => _TopfilterState();
}

class _TopfilterState extends State<Topfilter> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (s) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (s) {
        setState(() {
          isHover = false;
        });
      },
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: isHover ? MainColors.mainPurple : Colors.white,
        ),
        child: Center(
          child: Text(
            widget.content,
            style: TextStyle(
              color: isHover ? MainColors.mainOrange : MainColors.mainPurple,
            ),
          ),
        ),
      ),
    );
  }
}
