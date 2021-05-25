import 'package:flutter/material.dart';

class GreyText extends StatelessWidget {
  String content;
  GreyText(this.content);
  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
    );
  }
}
