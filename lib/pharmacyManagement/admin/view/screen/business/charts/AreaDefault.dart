import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../const/model.dart';
import 'StackedColumnChart.dart';


class AreaDefault extends SampleView {
  @override
  _AreaDefaultState createState() => _AreaDefaultState();
}

class _AreaDefaultState extends SampleViewState {
  _AreaDefaultState();
  List<ChartSampleData>? chartData;

  @override
  void initState() {
    chartData = <ChartSampleData>[
      ChartSampleData(x: DateTime(2018), y: 4, secondSeriesYValue: 2.6),
      ChartSampleData(x: DateTime(2019), y: 3.0, secondSeriesYValue: 2.8),
      ChartSampleData(x: DateTime(2020), y: 3.8, secondSeriesYValue: 2.6),
      ChartSampleData(x: DateTime(2021), y: 3.4, secondSeriesYValue: 3),
      ChartSampleData(x: DateTime(2022), y: 3.2, secondSeriesYValue: 3.6),
      ChartSampleData(x: DateTime(2023), y: 3.9, secondSeriesYValue: 3),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDefaultAreaChart();
  }

  /// Returns the default cartesian area chart.
  SfCartesianChart _buildDefaultAreaChart() {
    return SfCartesianChart(
      legend: Legend( opacity: 2),
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat.y(),
          interval: 1,
          intervalType: DateTimeIntervalType.years,
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}k',
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getDefaultAreaSeries(),
    );
  }

  List<AreaSeries<ChartSampleData, DateTime>> _getDefaultAreaSeries() {
    return <AreaSeries<ChartSampleData, DateTime>>[
      AreaSeries<ChartSampleData, DateTime>(
        dataSource: chartData!,
        opacity: 0.7,
        name: 'Average sales of laboratory',
        xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
      ),
      AreaSeries<ChartSampleData, DateTime>(
        dataSource: chartData!,
        opacity: 0.7,
        name: 'Average sales of Company',
        xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
        yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
      )
    ];
  }

}
