import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Linear extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
height: 100,width: 200,
      child: SfCartesianChart(

          primaryXAxis: CategoryAxis(),
          series: <ChartSeries<_SalesData, String>>[
            LineSeries<_SalesData, String>(

              dataSource: data,
              xValueMapper: (_SalesData sales, _) => sales.year.toString(),
              yValueMapper: (_SalesData sales, _) => sales.sales,
            )
          ]),
    );
  }
  List<_SalesData> data = [
  _SalesData(1,1),
  _SalesData(2, 40),
  _SalesData(3, 12),
  _SalesData(4, 16),
  _SalesData(5, 49),
  _SalesData(6, 16)
  ];

}
class _SalesData {
  _SalesData(this.year, this.sales);

  final int year;
  final double sales;
}