import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/data/response_models.dart';
import 'package:hackathon/responsive.dart';
import 'package:hackathon/tabs/invest/fund_info.dart';
import 'package:hackathon/tabs/invest/fund_service.dart';
import 'package:hackathon/tabs/invest/fund_list.dart';
import 'package:shimmer/shimmer.dart';

class InvestHome extends StatelessWidget {
  InvestHome({super.key});
  final FundService service = FundService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        children: [
          Carousel(
              title: 'Allocation--50% to 70% Equity',
              futureInfo: service.getFundsWithCatergory(
                  'morningstarCategory', 'Allocation--50% to 70% Equity')),
          Carousel(
              title: 'Large Growth',
              futureInfo: service.getFundsWithCatergory(
                  'morningstarCategory', 'Large Growth')),
          Carousel(
              title: 'Large Blend',
              futureInfo: service.getFundsWithCatergory(
                  'morningstarCategory', 'Large Blend')),
          Carousel(
              title: 'Global Allocation',
              futureInfo: service.getFundsWithCatergory(
                  'morningstarCategory', 'Global Allocation')),
          Carousel(
              title: 'Nontraditional Bond',
              futureInfo: service.getFundsWithCatergory(
                  'morningstarCategory', 'Nontraditional Bond')),
          Carousel(
              title: 'Convertibles',
              futureInfo: service.getFundsWithCatergory(
                  'morningstarCategory', 'Convertibles')),
          Carousel(
              title: 'Diversified Emerging Mkts',
              futureInfo: service.getFundsWithCatergory(
                  'morningstarCategory', 'Diversified Emerging Mkts')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FundListPage(
                                    categoryName: "",
                                    catergoryValue: "All Putnam Funds")));
                      },
                      child: const Text('View All Funds')),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  const Carousel({super.key, required this.title, required this.futureInfo});
  final Future<FundResponse> futureInfo;
  final String title;
  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: textTheme.titleLarge,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FundListPage(
                            categoryName: 'morningstarCategory',
                            catergoryValue: title)));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("View All"),
                  Icon(Icons.arrow_right_alt_rounded)
                ],
              ),
            )
          ],
        ),
        FutureBuilder<FundResponse>(
          future: futureInfo,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Fund> funds = snapshot.data!.funds;
              return CarouselSlider.builder(
                itemBuilder: (context, index, realIndex) {
                  return _buildCarouselItem(context, realIndex, funds[index]);
                },
                itemCount: funds.length,
                options: CarouselOptions(
                    initialPage: !isSmallScreen ? 1 : 0,
                    aspectRatio: 2,
                    height: 200,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: !isSmallScreen ? false : true,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    viewportFraction: !isSmallScreen ? 0.3 : 0.8,
                    pageViewKey: PageStorageKey<String>(title)),
              );
            }
            if (snapshot.hasError) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(
                    // you may want to use an aspect ratio here for tablet support
                    height: 200.0,
                    child: Center(child: Text('Unable to load')),
                  )
                ],
              );
            }
            return const CarouselLoading();
          },
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int itemIndex, Fund fund) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FundInfoPage(
                        fund: fund,
                        showLeading: true,
                      )));
        },
        child: Container(
          width: !ResponsiveWidget.isSmallScreen(context) ? 400 : null,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: colorScheme.surfaceVariant,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Text(
                fund.name,
                style: textTheme.titleLarge,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Chip(
                    labelStyle: textTheme.bodySmall,
                    backgroundColor: colorScheme.onPrimary,
                    label: Text(
                      fund.tradingSymbol,
                    ),
                  ),
                  Chip(
                    labelStyle: textTheme.bodySmall,
                    backgroundColor: colorScheme.onPrimary,
                    label: Text(
                      fund.legalType,
                    ),
                  ),
                ],
              ),
              const Divider(
                endIndent: 8.0,
                indent: 8.0,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('YTD'),
                        Text(fund.performanceBeforeSalesChargeYearToDate != null
                            ? fund.performanceBeforeSalesChargeYearToDate
                                .toString()
                            : "NA")
                      ],
                    ),
                    Column(
                      children: [
                        Text('3Y'),
                        Text(fund.performanceBeforeSalesCharge3Year != null
                            ? fund.performanceBeforeSalesCharge3Year.toString()
                            : "NA")
                      ],
                    ),
                    Column(
                      children: [
                        Text('1Y'),
                        Text(fund.performanceBeforeSalesCharge1Year != null
                            ? fund.performanceBeforeSalesCharge1Year.toString()
                            : "NA")
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CarouselLoading extends StatelessWidget {
  const CarouselLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    final colorScheme = Theme.of(context).colorScheme;
    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceVariant,
      highlightColor: colorScheme.onSurfaceVariant,
      child: CarouselSlider.builder(
        itemCount: isSmallScreen ? 1 : 4,
        itemBuilder: (context, index, realIndex) => Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: colorScheme.surfaceVariant),
            child: const SizedBox(
              width: 400,
              height: 200,
            ),
          ),
        ),
        options: CarouselOptions(
          initialPage: !isSmallScreen ? 1 : 0,
          aspectRatio: 2,
          height: 200,
          enableInfiniteScroll: false,
          enlargeCenterPage: !isSmallScreen ? false : true,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          viewportFraction: !isSmallScreen ? 0.3 : 0.8,
        ),
      ),
    );
  }
}
