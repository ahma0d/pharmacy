import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';




class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<ChartData> chartData;

  @override
  void initState() {
    chartData = [
      ChartData(DateTime(2023, 12, 01, 09, 1), 50),
      ChartData(DateTime(2023, 12, 01, 09, 2), 45),
      ChartData(DateTime(2023, 12, 01, 09, 3), 54),
      ChartData(DateTime(2023, 12, 01, 09, 4), 51),
      ChartData(DateTime(2023, 12, 01, 09, 5), 53),
      ChartData(DateTime(2023, 12, 01, 09, 6), 49),
      ChartData(DateTime(2023, 12, 01, 09, 7), 54),
      ChartData(DateTime(2023, 12, 01, 09, 8), 45),
      ChartData(DateTime(2023, 12, 01, 09, 9), 30),
      ChartData(DateTime(2023, 12, 01, 09, 10), 48),
      ChartData(DateTime(2023, 12, 01, 09, 11), 65),
      ChartData(DateTime(2023, 12, 01, 09, 12), 63),
      ChartData(DateTime(2023, 12, 01, 09, 13), 71),
      ChartData(DateTime(2023, 12, 01, 09, 14), 48),
      ChartData(DateTime(2023, 12, 01, 09, 15), 51),
      ChartData(DateTime(2023, 12, 01, 09, 16), 49),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfCartesianChart(
          primaryXAxis: DateTimeAxis(
            axisLine:  AxisLine(color: Colors.red
             ),
          ),
          primaryYAxis: NumericAxis(
            interval: 50,

            axisLine:  AxisLine(color: Colors.red),
            minimum: 0,
            maximum: 100,
          ),
          series: <ChartSeries<ChartData, DateTime>>[
            AreaSeries(
                borderColor: Colors.red,
                borderWidth: 3,
                gradient: LinearGradient(colors: [
                  Colors.red.withOpacity(0.4),
                  Colors.red.withOpacity(0.3),
                  Colors.red.withOpacity(0.12)
                ], stops: const [
                  0.1,
                  0.3,
                  0.6
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                color: Colors.red,
                yValueMapper: (ChartData data, _) => data.y)
          ],
        ),
      );
  }
}

class ChartData {
  final DateTime x;
  final num y;

  ChartData(this.x, this.y);
}
