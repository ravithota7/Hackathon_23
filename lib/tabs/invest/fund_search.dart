import 'package:flutter/material.dart';
import 'package:hackathon/data/response_models.dart';
import 'package:hackathon/tabs/invest/fund_info.dart';
import 'package:hackathon/tabs/invest/fund_service.dart';

class FundSearch extends StatefulWidget {
  const FundSearch({super.key});

  @override
  State<FundSearch> createState() => _FundSearchState();
}

class _FundSearchState extends State<FundSearch> {
  List<Fund> searchHistory = <Fund>[];
  final FundService fundService = FundService();
  Iterable<Widget> getHistoryList(SearchController controller) {
    return searchHistory.map((fund) => ListTile(
          leading: const Icon(Icons.history),
          title: Text(fund.name),
          trailing: IconButton(
              icon: const Icon(Icons.call_missed),
              onPressed: () {
                controller.text = fund.name;
                controller.selection =
                    TextSelection.collapsed(offset: controller.text.length);
              }),
          onTap: () {
            controller.closeView(fund.name);
            handleSelection(fund);
            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FundInfoPage(fund: fund,showLeading: true)));
          },
        ));
  }

  Iterable<Widget> getSuggestions(SearchController controller) {
    final String input = controller.value.text;
    return <Widget>[
      FutureBuilder<FundResponse>(
        future: fundService.getFundsWithQuery(input),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return const Center(child: Text("Error Occured"),);
          }
          if(snapshot.hasData){
            final fundList = snapshot.data!.funds;
            return Column(
              children: [
                  for(var fund in fundList)
                    ListTile(
                    title: Text(fund.name),
                    trailing: IconButton(
                        icon: const Icon(Icons.call_missed),
                        onPressed: () {
                          controller.text = fund.name;
                          controller.selection = TextSelection.collapsed(
                              offset: controller.text.length);
                        }),
                    onTap: () {
                      controller.closeView(fund.investmentVehicleId);
                      handleSelection(fund);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FundInfoPage(fund: fund,showLeading: true,)));
                    },
                  )
                ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },),
    ];
  }

  void handleSelection(Fund fund) {
    setState(() {
      if (searchHistory.length >= 5) {
        searchHistory.removeLast();
      }
      searchHistory.insert(0, fund);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
            barHintText: 'Search',  
            barElevation: const MaterialStatePropertyAll(0.0),
            barBackgroundColor: const MaterialStatePropertyAll(Colors.transparent),
            suggestionsBuilder: (context, controller) {
              if (controller.text.isEmpty) {
                if (searchHistory.isNotEmpty) {
                  return getHistoryList(controller);
                }
                return <Widget>[
                  const Center(
                    child: Text('No search history.',
                        style: TextStyle(color: Colors.grey)),
                  )
                ];
              }
              return getSuggestions(controller);
            },
          );
  }
}