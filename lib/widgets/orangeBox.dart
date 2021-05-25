import 'package:flutter/material.dart';

import '../colors.dart';

class OrangeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 4,
        height: 4,
        decoration: BoxDecoration(
          color: MainColors.mainOrange,
        ),
      ),
    );
  }
}
