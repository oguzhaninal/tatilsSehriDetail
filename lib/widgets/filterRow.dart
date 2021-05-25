import 'package:flutter/material.dart';
import 'package:tatilsehri/colors.dart';

class FilterRow extends StatefulWidget {
  String content;
  bool value;

  FilterRow(
    this.value,
    this.content,
  );

  @override
  _FilterRowState createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              splashRadius: 10,
              activeColor: MainColors.mainPurple,
              value: widget.value,
              onChanged: (newValue) {
                setState(() {
                  widget.value = !widget.value;
                });
              },
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.value = !widget.value;
                });
              },
              child: Container(
                width: deviceSize.width * .08,
                child: Text(
                  widget.content,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
              ),
            )
          ],
        ),
        Text(
          "233",
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
