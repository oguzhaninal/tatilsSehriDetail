import 'package:flutter/material.dart';

import '../colors.dart';

class MyStar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: MainColors.mainOrange,
      size: 16,
    );
  }
}
