import 'package:flutter/material.dart';
import 'package:peer_money/testCode/donutPieChart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PieChartTest extends StatefulWidget {
  static const String id = "PieChartTest";
  final void Function() onInit;
  final List<charts.Series>? seriesList;
  final bool? animate;
  const PieChartTest(
      {Key? key, required this.onInit, this.seriesList, this.animate})
      : super(key: key);
  @override
  State<PieChartTest> createState() => _PieChartTestState();
}

class _PieChartTestState extends State<PieChartTest> {
  late List<CyptoData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    // _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          InkWell(
            child: const Text('Pie Chart'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => DonutPieChart(
                          _createSampleData(),
                          animate: false,
                        )),
              );
            },
          ),
          Container(
            child: SfCircularChart(
              title: ChartTitle(text: 'Test Cypto Chart'),
              legend: Legend(
                  isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
              series: <CircularSeries>[
                DoughnutSeries<CyptoData, String>(
                  dataSource: _chartData,
                  xValueMapper: (CyptoData data, _) => data.name,
                  yValueMapper: (CyptoData data, _) => data.value,
                  // dataLabelSettings: const DataLabelSettings(isVisible: true),
                  // enableTooltip: true,
                  // maximumValue: 40000,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<CyptoData> getChartData() {
    final List<CyptoData> chartData = [
      CyptoData('BTC', 25),
      CyptoData('ETH', 25),
      CyptoData('USDC', 15),
      CyptoData('USDT', 10),
      CyptoData('Other', 5),
    ];
    return chartData;
  }

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

class CyptoData {
  CyptoData(this.name, this.value);

  final String name;
  final int value;
}
