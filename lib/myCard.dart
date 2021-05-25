import 'package:flutter/material.dart';
import 'package:tatilsehri/widgets/greyTexts.dart';
import 'package:tatilsehri/widgets/orangeBox.dart';
import 'package:tatilsehri/widgets/star.dart';

import 'colors.dart';

class MyCard extends StatefulWidget {
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool isHoverButton = false;
  bool isHoverText1 = false;
  bool isHoverCity = false;
  bool isHoverShowMap = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 235,
      width: 850,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: MainColors.mainPurple.withOpacity(.8),
            spreadRadius: -9,
            blurRadius: 8,
            offset: Offset(0, 8),
          )
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 300,
                      height: 195,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("assets/images/kapadokya.jpg"),
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 20),
                    child: Container(
                      width: 215,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onEnter: (s) {
                              setState(() {
                                isHoverText1 = true;
                              });
                            },
                            onExit: (s) {
                              setState(() {
                                isHoverText1 = false;
                              });
                            },
                            child: Text(
                              "Suhan Kapadokya Otel",
                              style: TextStyle(
                                  color: isHoverText1
                                      ? MainColors.mainOrange
                                      : MainColors.mainPurple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                onEnter: (s) {
                                  setState(() {
                                    isHoverCity = true;
                                  });
                                },
                                onExit: (s) {
                                  setState(() {
                                    isHoverCity = false;
                                  });
                                },
                                child: Text(
                                  "Avanos",
                                  style: TextStyle(
                                    color: isHoverCity
                                        ? MainColors.mainOrange
                                        : MainColors.mainPurple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              OrangeBox(),
                              MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  onEnter: (s) {
                                    setState(() {
                                      isHoverShowMap = true;
                                    });
                                  },
                                  onExit: (s) {
                                    setState(() {
                                      isHoverShowMap = false;
                                    });
                                  },
                                  child: Text(
                                    "Haritada Göster",
                                    style: TextStyle(
                                        color: isHoverShowMap
                                            ? MainColors.mainOrange
                                            : Colors.black),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 65,
                          ),
                          Row(
                            children: [
                              Text(
                                "Stüdyo Daire",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Icon(
                                  Icons.people,
                                  color: MainColors.mainPurple,
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              GreyText("Stüdyonun Tamamı"),
                              OrangeBox(),
                              GreyText("1 Banyo"),
                              OrangeBox(),
                              GreyText("37 m2"),
                              OrangeBox(),
                              GreyText(
                                  "2 Yatak (1 Çekyat, 1 Büyük Çift Kişilik)"),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: MainColors.mainPurple,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "9.5",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        MyStar(),
                        MyStar(),
                        MyStar(),
                        MyStar(),
                        MyStar(),
                      ],
                    ),
                    GreyText("4567 Değerlendirme"),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            GreyText("6 Gece, 2 Yetişkin, 1 Çocuk"),
                            OrangeBox()
                          ],
                        ),
                        Text(
                          "4890 ₺",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            GreyText("KDV Dahil"),
                            OrangeBox(),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: MouseRegion(
                        onEnter: (s) {
                          setState(() {
                            isHoverButton = true;
                          });
                        },
                        onExit: (s) {
                          setState(() {
                            isHoverButton = false;
                          });
                        },
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          width: 175,
                          height: 22.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: isHoverButton
                                ? MainColors.mainOrange
                                : MainColors.mainPurple,
                          ),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Yer Durumuna Bak",
                                  style: TextStyle(
                                      color: isHoverButton
                                          ? Colors.black
                                          : Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  color: isHoverButton
                                      ? Colors.black
                                      : Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
