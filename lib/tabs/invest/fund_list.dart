import 'package:flutter/material.dart';
import 'package:hackathon/data/response_models.dart';
import 'package:hackathon/responsive.dart';
import 'package:hackathon/tabs/invest/fund_card.dart';
import 'package:hackathon/tabs/invest/fund_info.dart';
import 'package:hackathon/tabs/invest/fund_search.dart';
import 'package:hackathon/tabs/invest/fund_service.dart';

class FundListPage extends StatefulWidget {
  const FundListPage({super.key, required this.categoryName, required this.catergoryValue});
  final String categoryName;
  final String catergoryValue;
  @override
  State<FundListPage> createState() => _FundListPageState();
}

class _FundListPageState extends State<FundListPage> {
  int totalFunds = 0;
  int start = 0;
  FundService service = FundService();
  final ScrollController _scrollController = ScrollController();
  bool shouldLoadMore = false;
  bool firstLoad = false;
  bool hasMoreData = true;
  List<Fund> funds = [];
  Fund? _currentFund ;

  _firstLoad() async {
    setState(() {
      firstLoad = true;
    });
    try {
      final response = await service.getFundsWithCatergory(widget.categoryName,widget.catergoryValue);
      setState(() {
        funds = response.funds;
        totalFunds = response.numberOfFunds;
        if(totalFunds == funds.length){
          hasMoreData == false;
        }
      });
    } on Exception catch (e) {
      print("Error occured $e");
    }
    setState(() {
      firstLoad = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _scrollController.addListener(() async {
      if (hasMoreData == true &&
          firstLoad == false &&
          shouldLoadMore == false &&
          _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        setState(() {
          shouldLoadMore = true;
        });
        start = funds.length;
        await fetchFunds(start);
        setState(() {
          shouldLoadMore = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: firstLoad
          ? 
          CustomScrollView(
            controller: _scrollController,
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(strokeWidth: 3.0,),
                        ),
                      )
                    ]
                  )) 
                ]         
                )
          : Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                      SliverAppBar(
                        title: widget.catergoryValue=='All Putnam Funds' ? 
                        const FundSearch() :
                         Text(widget.catergoryValue,style: textTheme.titleLarge,),
                        pinned: true,
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return FundCard(
                              fund: funds[index],
                              onFundTap: (fund) {                        
                                if(!ResponsiveWidget.isSmallScreen(context)){
                                  setState(() {
                                    _currentFund = fund;
                                  });
                                }
                                else{
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> FundInfoPage(fund:fund)));
                                }
                              } );
                          },
                          childCount: funds.length,
                        )),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            if(shouldLoadMore)
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: CircularProgressIndicator(strokeWidth: 3.0,)),
                              ),
                            if(!hasMoreData)
                              const Center(child: Text('End of results'),)
                          ]
                        ),
                      ),
                  ],
                ),
              ),
              if(! ResponsiveWidget.isSmallScreen(context) )
                Expanded(
                  flex: 3,
                  child: _currentFund == null ? const Center(child: Text('Please select a fund'),) :
                      FundInfoPage(fund: _currentFund!,)   
                )
              ],
          ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  fetchFunds(start) async {
    final response = await service.getFundsWithCatergory(widget.categoryName,widget.catergoryValue, start: start);
    setState(() {
      funds.addAll(response.funds);
      if (totalFunds == funds.length) {
        hasMoreData = false;
      }
    });
  }

}

