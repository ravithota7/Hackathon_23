import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/app_state.dart';
import 'package:hackathon/data.dart';
import 'package:hackathon/responsive.dart';
import 'package:provider/provider.dart';

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context) ? SingleChildScrollView(
      child: Column(
        children: [
          Text("Total Assets: \$ ${DummyDataService.getTotalInvested()}",
            style: const TextStyle(fontSize: 24,)),
          TotalAssetsChart(),
          const Divider(endIndent: 24.0,indent: 24.0),
          AssetList()
        ],
      ),
    ) : 
    Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text("Total Assets: \$ ${DummyDataService.getTotalInvested()}",
                style: const TextStyle(fontSize: 24,)),
                TotalAssetsChart(),
              ]
          ),
        ),
        const VerticalDivider(indent: 30.0,endIndent: 30.0,),
        Expanded(flex:3,child: AssetList()),
      ], 
    );
  }
}

class AssetList extends StatelessWidget {
  const AssetList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PortfolioData> portfolio = DummyDataService.getPortfolio();
    return Column(
            children: [
              for(int index=0; index < portfolio.length; index ++)
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(width: 4, height: 20,
                    child: Container(color: DummyDataService.colors[index],),),
                  ),
                  title: Text(portfolio[index].fundName),
                  subtitle: Text("\$ ${portfolio[index].nav * portfolio[index].units}"),
                  trailing: Column(
                    children:  [
                      Icon(Icons.arrow_drop_up_outlined,color: Colors.green,),
                      Text("9.0%")
                    ],
                  ),
                )
            ],
    );
  }
}

class TotalAssetsChart extends StatelessWidget {
  const TotalAssetsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 200,
            width: 200,
            child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    enabled: true,
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                        context.read<AppState>().updatePortfolioTouchIndex(-1);
                        return;
                      }
                    context.read<AppState>().updatePortfolioTouchIndex(pieTouchResponse.touchedSection!.touchedSectionIndex);
                    },
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 80,
                  sections: DummyDataService.getPortfolioChartSections(context),
                )
              ),
          );
  }
}