
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/app_state.dart';
import 'package:provider/provider.dart';

class PortfolioData {
  const PortfolioData(
      {required this.fundName,
      required this.units,
      required this.nav});
  final String fundName;
  final int units;
  final double nav;
}

class DummyDataService {
  static List<Color> colors = [Colors.green.shade300, Colors.green.shade700,Colors.yellow.shade300,Colors.teal.shade300];
  static List<PortfolioData> getPortfolio() {
    return <PortfolioData>[
      PortfolioData(fundName: "Fund 1", units: 20, nav: 34),
      PortfolioData(fundName: "Fund 2", units: 20, nav: 48),
      PortfolioData(fundName: "Fund 3", units: 10, nav: 50),
      PortfolioData(fundName: "Fund 4", units: 15, nav: 40),
    ];
  }
  static double getTotalInvested(){
    double totalPortfolioValue = 0.0;
    for (var element in getPortfolio()) {
      totalPortfolioValue = totalPortfolioValue + (element.nav * element.units);
    }
    return totalPortfolioValue;
  }
  static List<PieChartSectionData> getPortfolioChartSections(BuildContext context){
    List<PortfolioData> portfolio = DummyDataService.getPortfolio();
    double totalPortfolioValue = getTotalInvested();
    return List<PieChartSectionData>.generate(portfolio.length, (index) {
        return PieChartSectionData(
          value: (portfolio[index].nav*portfolio[index].units)/totalPortfolioValue * 100,
          color: colors[index],
          showTitle: false,
          radius: index == context.watch<AppState>().portfolioTouchIndex ? 15.0 : 10.0,
        );
    });
  }
}
