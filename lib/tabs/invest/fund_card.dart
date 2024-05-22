import 'package:flutter/material.dart';
import 'package:hackathon/data/response_models.dart';

class FundCard extends StatelessWidget {
  const FundCard({super.key, required this.fund, required this.onFundTap});
  final Fund fund;
  final Function(Fund) onFundTap;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      top: false,
      bottom: false,
      child: Card(
        color: colorScheme.surface,
        child: InkWell(
          onTap: () {
              onFundTap(fund);
          },
          child: ListTile(
            title: Text(fund.name,style: textTheme.titleMedium),
            subtitle: Text('Category : ${fund.morningstarCategory}',style: textTheme.titleSmall),
            trailing: const Icon(Icons.arrow_forward_ios),
            
          ),
        ),
      ),
    );
    // return ListTile(
    //   title: Text(fund.name),
    //   subtitle: Text(fund.morningstarCategory),
    //   onTap: (){
    //     Navigator.push(context, MaterialPageRoute(builder: (context)=> FundInfoPage(fund:fund)));
    //   } ,
    //   contentPadding: EdgeInsets.all(8.0),
    //   horizontalTitleGap: 4.0,
    //   hoverColor: colorScheme.onPrimaryContainer,
    // );
  }
}