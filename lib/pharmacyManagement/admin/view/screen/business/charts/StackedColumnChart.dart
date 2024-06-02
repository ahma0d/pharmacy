import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'AreaDefault.dart';
import '../const/model.dart';
class ChartSampleData {
  ChartSampleData(
      {this.x,
        this.y,
        this.xValue,
        this.yValue,
        this.secondSeriesYValue,
        this.thirdSeriesYValue,
      });

  final dynamic x,xValue;
  final num? y,yValue,secondSeriesYValue,
      thirdSeriesYValue;


}

class StackedColumnChart extends SampleView {
  @override
  _StackedColumnChartState createState() => _StackedColumnChartState();
}

class _StackedColumnChartState extends SampleViewState {
  List<ChartSampleData>? chartData;

  @override
  void initState() {
    chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'children',
          y: 90,
          yValue: 55,
          secondSeriesYValue: 72,
          thirdSeriesYValue: 65),
      ChartSampleData(
          x: 'Yothes',
          y: 80,
          yValue: 75,
          secondSeriesYValue: 40,
          thirdSeriesYValue: 60),
      ChartSampleData(
          x: 'old',
          y: 35,
          yValue: 90,
          secondSeriesYValue: 55,
          thirdSeriesYValue: 52),
      ChartSampleData(
          x: 'aged',
          y: 24,
          yValue: 33,
          secondSeriesYValue: 35,
          thirdSeriesYValue: 24),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildStackedColumnChart();
  }

  SfCartesianChart _buildStackedColumnChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      legend: Legend(isVisible: false, overflowMode: LegendItemOverflowMode.scroll),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          labelFormat: '{value}',
          maximum: 300,
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getStackedColumnSeries(),
    );
  }

  List<StackedColumnSeries<ChartSampleData, String>> _getStackedColumnSeries() {
    return <StackedColumnSeries<ChartSampleData, String>>[
      StackedColumnSeries<ChartSampleData, String>(
          dataSource: chartData!,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
         ),
      StackedColumnSeries<ChartSampleData, String>(
          dataSource: chartData!,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.yValue,
          ),
      StackedColumnSeries<ChartSampleData, String>(
          dataSource: chartData!,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
      ),
      StackedColumnSeries<ChartSampleData, String>(
          dataSource: chartData!,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
         )
    ];
  }
}
