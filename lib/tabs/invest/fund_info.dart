import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/data/response_models.dart';
import 'package:hackathon/responsive.dart';
import 'package:hackathon/tabs/invest/chat_widgets.dart';
import 'package:hackathon/tabs/invest/fund_service.dart';
import 'package:hackathon/util.dart';

class FundInfoPage extends StatelessWidget {
  FundInfoPage({super.key, required this.fund, this.showLeading = false});
  final Fund fund;
  final bool showLeading;
  static const routeName = '/fundInfoPage';
  final FundService service = FundService();

  @override
  Widget build(BuildContext context) {
    final fundInfo = service.getFundInfo(fund.investmentVehicleId);
    final isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    return Scaffold(
      appBar: AppBar(
        leading: (isSmallScreen || showLeading) ? null : Container(),
        title: Text(fund.name),
      ),
      body: FutureBuilder(
        future: fundInfo,
        builder: (context, snapshot) {
          if(snapshot.connectionState != ConnectionState.done){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error occured'),
            );
          }
          if (snapshot.hasData) {
            final fundDetails = snapshot.data!;
            return Center(
              child: SingleChildScrollView(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 800.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FundInfoCard(fundDetails: fundDetails),
                      Card(
                        child: AspectRatio(
                            aspectRatio: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Chart(
                                title: 'Perfomance',
                                points: ChartPoints(
                                    yTD: fundDetails.trailReturnYtd?.toDouble(),
                                    y1: fundDetails.trailReturnY1?.toDouble(),
                                    y3: fundDetails.trailReturnY3?.toDouble(),
                                    y5: fundDetails.trailReturnY5?.toDouble(),
                                    y10: fundDetails.trailReturnY10?.toDouble(),
                                    lOF: fundDetails.trailReturnSinceInception?.toDouble()),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  const DetailRow(
      {super.key, required this.detailKey, required this.detailValue});
  final String detailKey;
  final String detailValue;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.titleSmall;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          detailKey,
          style: textTheme,
        )),
        Expanded(
            child: Text(
          detailValue,
          style: textTheme,
        ))
      ],
    );
  }
}

class FundInfoCard extends StatelessWidget {
  const FundInfoCard({super.key, required this.fundDetails});
  final FundInfoResponse fundDetails;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          DetailRow(
              detailKey: 'Ticket',
              detailValue: fundDetails.investmentVehicleId !),
          const Divider(),
          DetailRow(
              detailKey: 'Lauched On',
              detailValue: fundDetails.inceptionDate !=null ?
              Util.getDateFromEpoch(fundDetails.inceptionDate) : "NA"),
          const Divider(),
          DetailRow(
              detailKey: 'Investment objective',
              detailValue: fundDetails.morningstarProspectusObjective ?? "NA"),
          const Divider(),
          DetailRow(
              detailKey: 'Morningstar category',
              detailValue: fundDetails.morningstarCategory ?? "NA"),
          const Divider(),
          DetailRow(
              detailKey: 'Primary Benchmark',
              detailValue: fundDetails.primaryBenchmark?? "NA"),
          const Divider(),
          DetailRow(
              detailKey: 'Share Class',
              detailValue: fundDetails.shareClassType ?? "NA"),
          const Divider(),
          DetailRow(
              detailKey: 'Primary Benchmark',
              detailValue: fundDetails.primaryBenchmark ?? "NA"),
          const Divider(),
          DetailRow(
              detailKey: 'Max sale charge',
              detailValue: fundDetails.maxFrontLoad.toString()),
          const Divider(),
          DetailRow(
              detailKey: 'Expense ratio',
              detailValue: fundDetails.prospectusNetExpenseRatio.toString() ),
          const Divider(),
          DetailRow(
              detailKey: 'Expense ratio vs. Category',
              detailValue:
                  fundDetails.prospectusNetExpenseRatioVsCat.toString()),
          const Divider(),
          DetailRow(
              detailKey: 'Fund assets',
              detailValue: fundDetails.fundNetAssets!=null ?
                  Util.convertToDollarValue(fundDetails.fundNetAssets) : "NA"),
          const Divider(),
          DetailRow(
              detailKey: 'Bond avg duration',
              detailValue:  fundDetails.effectiveDurationLong !=null ? "${fundDetails.effectiveDurationLong} years" : "NA"),
        ],
      ),
    ));
  }
}

class Chart extends StatelessWidget {
  const Chart({super.key, required this.points, required this.title});
  final ChartPoints points;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return LineChart( LineChartData(
      backgroundColor: colorScheme.background,
      lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: colorScheme.primaryContainer)),
      lineBarsData: [
        LineChartBarData(
          color: colorScheme.primary,
          isCurved: false,
          spots: getSpots(points),
          barWidth: 2.0
        ),
      ],
      borderData: FlBorderData(
          border: const Border(bottom: BorderSide(), left: BorderSide()),),
      gridData: FlGridData(
        show: true,
        getDrawingVerticalLine: (value) => FlLine(color: colorScheme.onInverseSurface),
        getDrawingHorizontalLine: (value) => FlLine(color: colorScheme.onInverseSurface),),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(sideTitles: _bottomTitles),
        leftTitles: AxisTitles(sideTitles: _leftTitles),
        topTitles: AxisTitles(
            axisNameWidget: Text(title),
            sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
    ));
  }

  getSpots(ChartPoints chartPoints){
    List<FlSpot> spots = [];
    chartPoints.yTD !=null ? spots.add( FlSpot(1, points.yTD!)) : null ;
    chartPoints.y1 !=null ? spots.add( FlSpot(3, points.y1!)) : null ;
    chartPoints.y3 !=null ? spots.add( FlSpot(5, points.y3!)) : null ;
    chartPoints.y5 !=null ? spots.add( FlSpot(7, points.y5!)) : null ;
    chartPoints.y10 !=null ? spots.add( FlSpot(9, points.y10!)) : null ;
    chartPoints.lOF !=null ? spots.add( FlSpot(11, points.lOF!)) : null ;
    return spots;
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          //print('value $value to int ${value.toInt()}');
          String text = '';
          if(value==1.0){
            text = 'YTD';
          }
          if(value==3.0){
            text = '1Y';
          }
          if(value==5.0){
            text = '3Y';
          }
          if(value==7.0){
            text = '5Y';
          }
          if(value==9.0){
            text = '10Y';
          }
          if(value==11.0){
            text = 'LOF';
          }
          return Text(text);
        },
      );

  SideTitles get _leftTitles => SideTitles(
        reservedSize: 50,
        showTitles: true,
        getTitlesWidget: (value, meta) {
          //print('left $value to ${value.toStringAsFixed(2)}');
          return Text(value.toStringAsFixed(2));
        },
      );
}
