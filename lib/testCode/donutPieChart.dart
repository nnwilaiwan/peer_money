import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:peer_money/models/appTextSetting.dart';

class DonutPieChart extends StatelessWidget {
  static const String id = "PieChartTest";
  final List<charts.Series>? seriesList;
  final bool? animate;

  const DonutPieChart(this.seriesList, {this.animate});

  factory DonutPieChart.withSampleData() {
    return DonutPieChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  Container dataCypto(Color color, String image, String name, String value) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          height: 30,
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(image),
                  const SizedBox(width: 5),
                  Text(
                    name,
                    style: const TextStyle(
                        fontFamily: AppTextSetting.APP_FONT, fontSize: 14),
                  ),
                ],
              ),
              Text(
                value,
                style: const TextStyle(
                    fontFamily: AppTextSetting.APP_FONT, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: charts.PieChart(seriesList!,
                  animate: animate,
                  defaultRenderer: charts.ArcRendererConfig(arcWidth: 50)),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dataCypto(Colors.blue.shade500, 'assets/icons/btc.png', 'BTC',
                      '25%'),
                  const SizedBox(height: 5),
                  dataCypto(Colors.blue.shade400, 'assets/icons/eth.png', 'ETH',
                      '25%'),
                  const SizedBox(height: 5),
                  dataCypto(Colors.blue.shade300, 'assets/icons/usdc.png',
                      'USDC', '15%'),
                  const SizedBox(height: 5),
                  dataCypto(Colors.blue.shade200, 'assets/icons/usdt.png',
                      'USDT', '10%'),
                  const SizedBox(height: 5),
                  dataCypto(Colors.blue.shade100, 'assets/icons/other.png',
                      'Other', ' 5%'),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      LinearSales(0, 25),
      LinearSales(1, 25),
      LinearSales(2, 15),
      LinearSales(3, 10),
      LinearSales(4, 5),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
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
