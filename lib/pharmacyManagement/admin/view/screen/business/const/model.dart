import 'package:flutter/material.dart';

import 'model2.dart';

abstract class SampleView extends StatefulWidget {
}

abstract class SampleViewState<T extends SampleView> extends State<T> {
  late SampleModel model;
  Widget? buildSettings(BuildContext context) {
    return null;
  }
}
class SalesData {
  /// Holds the datapoint values like x, y, etc.,
  SalesData(this.x, this.y, [this.date, this.color]);

  /// X value of the data point
  final dynamic x;

  /// y value of the data point
  final dynamic y;

  /// color value of the data point
  final Color? color;

  /// Date time value of the data point
  final DateTime? date;
}
