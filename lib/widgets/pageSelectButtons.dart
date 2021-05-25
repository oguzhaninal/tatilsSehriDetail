import 'package:flutter/material.dart';

import '../colors.dart';

class PageSelectButtons extends StatefulWidget {
  bool isLast;
  bool isArrow;
  bool isSelected;
  final String title;
  PageSelectButtons(this.title, this.isArrow, this.isSelected, this.isLast);
  @override
  _PageSelectButtonsState createState() => _PageSelectButtonsState();
}

class _PageSelectButtonsState extends State<PageSelectButtons> {
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
        height: 20,
        width: 20,
        decoration: widget.isSelected
            ? BoxDecoration(
                color: MainColors.mainPurple,
                borderRadius: BorderRadius.circular(20),
              )
            : BoxDecoration(
                color: isHover ? MainColors.mainPurple : null,
                borderRadius: BorderRadius.circular(20),
              ),
        child: Center(
          child: widget.isArrow
              ? Icon(
                  widget.isLast ? Icons.chevron_right : Icons.chevron_left,
                  color: isHover ? Colors.white : MainColors.mainPurple,
                )
              : Text(
                  widget.title,
                  style: widget.isSelected
                      ? TextStyle(color: Colors.white)
                      : TextStyle(
                          color:
                              isHover ? Colors.white : MainColors.mainPurple),
                ),
        ),
      ),
    );
  }
}
