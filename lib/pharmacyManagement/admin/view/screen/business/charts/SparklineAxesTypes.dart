/// Package import
import 'package:flutter/material.dart';

import '../const/const.dart';
import '../const/dashboard_comonent1.dart';
import '../const/model.dart';

class SparklineAxesTypes extends SampleView {
  @override
  _SparklineAxesTypesState createState() => _SparklineAxesTypesState();
}

List<double> num = [
  230,
  180,
  144,
  190,
  222,
  150,
  122,
  171,
  128,
  133,
  213,
  185,
  210
];
List<String> ammount2 = ['9', '8', "7", '6', "5", "4", "3", "2", "1"];
List<String> times = [
  '1:00',
  '2:00',
  "3:00",
  '4:00',
  "5:00",
  "6:00",
  "7:00",
  "8:00",
  "9:00"
];

class _SparklineAxesTypesState extends SampleViewState {
  _SparklineAxesTypesState();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: <Widget>[
      Container(
          padding: EdgeInsets.only(left: 4),
          height: size.height * 0.34,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.28,
                width: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                        times.length,
                        (i) => Text(
                              ammount2[i].toString() + ' k',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ))
                  ],
                ),
              ),
              Column(children: <Widget>[
                Container(
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ...List.generate(
                              9,
                              (index) => Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 3.33),
                                  height: num[index],
                                  width: 31,
                                  decoration: BoxDecoration(
                                      color: columnColors[index],
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(7.0),
                                        topLeft: Radius.circular(7.0),
                                      ))))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(12, 12, 17, 0),
                  height: 30,
                  width: size.width - 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                          9,
                          (i) => Text(
                                times[i].toString(),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: columnColors[i]),
                              ))
                    ],
                  ),
                )
              ]),
            ],
          )),
      MySpacer(size: size)
    ]);
  }
}

class SalesData {
  SalesData(this.title, this.value);

  final String title;
  final double? value;
}
