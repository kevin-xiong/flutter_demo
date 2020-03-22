import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  Chart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory Chart.withSampleData() {
    return new Chart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 25,
            arcRendererDecorators: [new charts.ArcLabelDecorator()]));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 20),
      new LinearSales(1, 20),
      new LinearSales(2, 20),
      new LinearSales(3, 20),
      new LinearSales(4, 40),
    ];
    var amap = {
      0:"",
      1:"",
      2:"",
      3:"",
      4:"",
    };
    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        labelAccessorFn: (LinearSales row, _) => '${amap[row.year]}',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}


