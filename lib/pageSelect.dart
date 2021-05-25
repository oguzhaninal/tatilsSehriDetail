import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tatilsehri/colors.dart';
import 'package:tatilsehri/widgets/pageSelectButtons.dart';

class PageSelect extends StatefulWidget {
  @override
  _PageSelectState createState() => _PageSelectState();
}

class _PageSelectState extends State<PageSelect> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: 850,
        height: 50,
        decoration: BoxDecoration(
          color: MainColors.mainPurple.withOpacity(.1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  PageSelectButtons(" ", true, false, false),
                  PageSelectButtons("1", false, true, false),
                  PageSelectButtons("2", false, false, false),
                  PageSelectButtons("3", false, false, false),
                  PageSelectButtons("4", false, false, false),
                  PageSelectButtons("5", false, false, false),
                  PageSelectButtons(" ", true, false, true)
                ],
              ),
              Text(
                "1-25 Arası Sonuçlar Gösteriliyor",
                style: TextStyle(color: MainColors.mainPurple),
              )
            ],
          ),
        ),
      ),
    );
  }
}
