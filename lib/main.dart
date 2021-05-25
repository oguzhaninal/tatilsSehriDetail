import 'package:flutter/material.dart';
import 'package:tatilsehri/as.dart';
import 'package:tatilsehri/colors.dart';
import 'package:tatilsehri/myCard.dart';
import 'package:tatilsehri/pageSelect.dart';
import 'package:tatilsehri/widgets/filterRow.dart';
import 'package:tatilsehri/widgets/topFilter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen(),
    );
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  bool isChecked = false;
  bool isHoverMap = false;
  bool isHoverButton = false;
  bool filterHandly = false;
  var selectedRange = RangeValues(0, 2000);
  RangeLabels labels = RangeLabels('0', "2000");
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Center(
          child: Container(
            width: 1200,
            height: 3000,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                filterContainer(deviceSize),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                      height: filterHandly ? 900 : 830,
                      child: VerticalDivider()),
                ),
                rightBlock()
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Container rightBlock() {
    return Container(
      width: 850,
      height: 2750,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Container(
              width: 850,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kapadokya: 2.890  Tesis Bulundu",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    height: 65,
                    width: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("assets/images/map.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                        child: MouseRegion(
                      onEnter: (s) {
                        setState(() {
                          isHoverMap = true;
                        });
                      },
                      onExit: (s) {
                        setState(() {
                          isHoverMap = false;
                        });
                      },
                      child: AnimatedContainer(
                        curve: Curves.bounceInOut,
                        duration: Duration(milliseconds: 200),
                        width: isHoverMap ? 112 : 110,
                        height: isHoverMap ? 20 : 18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: MainColors.mainPurple,
                        ),
                        child: Center(
                            child: Text(
                          "Haritada Göster",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                      ),
                    )),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: 850,
              height: 35,
              decoration: BoxDecoration(
                border: Border.all(color: MainColors.mainPurple),
              ),
              child: Row(
                children: [
                  Topfilter("Uzun konaklama için popüler seçimler"),
                  VerticalDivider(
                    width: 0,
                    color: MainColors.mainPurple,
                  ),
                  Topfilter("Evlerin ve dairelerin tamamı"),
                  VerticalDivider(
                    width: 0,
                    color: MainColors.mainPurple,
                  ),
                  Topfilter("Fiyat(düşük)"),
                  VerticalDivider(width: 0, color: MainColors.mainPurple),
                  Container(
                    width: 98,
                    child: Center(
                      child: Text("..."),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            // height: 1000,
            child: Expanded(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, index) {
                    return MyCard();
                  }),
            ),
          ),
          PageSelect(),
        ],
      ),
    );
  }

  filterContainer(Size deviceSize) {
    return Container(
      height: filterHandly ? 900 : 830,
      width: deviceSize.width * .14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          filterManual(),
          if (filterHandly)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SliderTheme(
                data: SliderThemeData(
                    trackShape: RoundedRectSliderTrackShape(),
                    trackHeight: 8,
                    activeTrackColor: MainColors.mainPurple,
                    valueIndicatorColor: MainColors.mainPurple,
                    thumbColor: MainColors.mainOrange,
                    showValueIndicator: ShowValueIndicator.always),
                child: RangeSlider(
                    min: 0,
                    max: 2000,
                    values: selectedRange,
                    labels: labels,
                    onChanged: (RangeValues newValues) {
                      setState(() {
                        selectedRange = newValues;
                        labels = RangeLabels(
                            "${selectedRange.start.toInt().toString()}\₺",
                            "${selectedRange.end.toInt().toString()}\₺");
                      });
                    }),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Filtrele",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                FilterRow(isChecked, "TL 0 - TL 499"),
                FilterRow(isChecked, "TL 499 - TL 998"),
                FilterRow(isChecked, "TL 998 - TL 1.490"),
                FilterRow(isChecked, "TL 1.490 - TL 1.990"),
                FilterRow(isChecked, "TL 1.999+"),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Popüler Filtreler",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                FilterRow(isChecked, "1 KM'den daha az"),
                FilterRow(isChecked, "Daireler"),
                FilterRow(isChecked, "Çok iyi: 8+"),
                FilterRow(isChecked, "5 Yıldız"),
                FilterRow(isChecked, "Kahvaltı dahil"),
                FilterRow(isChecked, "Oteller"),
                FilterRow(isChecked,
                    "İlave sağlık ve güvenlik önlemleri alan tesisler"),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sağlık ve Güvenlik",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                FilterRow(isChecked, "1 KM'den daha az"),
                FilterRow(isChecked, "Daireler"),
                FilterRow(isChecked, "Çok iyi: 8+"),
                FilterRow(isChecked, "5 Yıldız"),
                FilterRow(isChecked, "Kahvaltı dahil"),
                FilterRow(isChecked, "Oteller"),
                FilterRow(isChecked,
                    "İlave sağlık ve güvenlik önlemleri alan tesisler"),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Yıldız sayısı",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                FilterRow(isChecked, "1 KM'den daha az"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  filterManual() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Switch(
            activeColor: MainColors.mainPurple,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey[200],
            value: filterHandly,
            onChanged: (bool value) {
              setState(() {
                filterHandly = value;
              });
            },
          ),
          Text(
            "Kendi Bütçenizi Belirleyin",
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
