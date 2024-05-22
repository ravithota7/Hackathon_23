import 'dart:convert';

import 'package:hackathon/data/response_models.dart';
import 'package:hackathon/tabs/invest/homedata.dart';
import 'package:http/http.dart' as http;

Map<String, String> requestHeaders = {
       'Content-type': 'application/json',
       'Accept': 'application/json',
       'Access-Control-Allow-Origin': '*'
};

class FundService {
  Future<FundResponse> getFunds(query,start) async {
    var url = Uri.parse('<fund_query_url>');
    final response = await http.get(url);
    if(response.statusCode == 200){
      final jsonResponse = jsonDecode(response.body);
      List<Fund> funds = [];
      for (var element in (jsonResponse['funds'] as List)) { 
        //print(element);
        funds.add(Fund.fromJson(element));
      }
      return FundResponse(funds: funds, numberOfFunds: jsonResponse['numberOfFunds']);
    }
    else{
      throw Exception('Failed to load funds');
    }
  }

  Future<FundInfoResponse> getFundInfo(investmentVehicleId) async{
    final url = Uri.parse('<fund_info_url>');
    final response = await http.get(url);
    if(response.statusCode == 200){
      final jsonResponse = jsonDecode(response.body)[0];
      final fundreponse = FundInfoResponse.fromJson(jsonResponse);
      return fundreponse;
    }
    else{
      throw Exception('Failed to load fund info');
    }
  }

  getTrendingFunds() {
    return tredingFunds;
  }

  Future<FundResponse> getFundsWithCatergory( String categoryName, String caetegoryValue, { String familyName="Putnam" , int start = 0, }) async {
    final url = Uri.parse('<funds_url>');
    List<Map<String,String>> activeFilters = [];
    activeFilters.add({"facetField": "familyName", "operator": "eq", "value": familyName});
    if(categoryName.isNotEmpty && caetegoryValue.isNotEmpty){
      activeFilters.add({
          "facetField": categoryName,
          "operator": "eq",
          "value": caetegoryValue
        });
    }
    final body = jsonEncode({
      "query": "*",
      "start": "$start",
      "maxResults": "20",
      "activeFilters": activeFilters
    });
    final response = await http.post(url,
    body: body,
    headers: {'Content-type': 'application/json'});
    if(response.statusCode == 200){
      final jsonResponse = jsonDecode(response.body);
      List<Fund> funds = [];
      for (var element in (jsonResponse['funds'] as List)) { 
        //print(element);
        funds.add(Fund.fromJson(element));
      }
      return FundResponse(funds: funds, numberOfFunds: jsonResponse['numberOfFunds']);
    }
    else{
      throw Exception('Failed to load funds');
    }
  }

  Future<FundResponse> getFundsWithQuery( String query, { String familyName="Putnam" , int start = 0, }) async {
    final url = Uri.parse('<funds>');
    List<Map<String,String>> activeFilters = [];
    activeFilters.add({"facetField": "familyName", "operator": "eq", "value": familyName});
    final body = jsonEncode({
      "query": query,
      "start": "$start",
      "maxResults": "20",
      "activeFilters": activeFilters
    });
    final response = await http.post(url,
    body: body,
    headers: {'Content-type': 'application/json'});
    if(response.statusCode == 200){
      final jsonResponse = jsonDecode(response.body);
      List<Fund> funds = [];
      for (var element in (jsonResponse['funds'] as List)) { 
        //print(element);
        funds.add(Fund.fromJson(element));
      }
      return FundResponse(funds: funds, numberOfFunds: jsonResponse['numberOfFunds']);
    }
    else{
      throw Exception('Failed to load funds');
    }
  }

  Future<FundResponse> searchFunds( String query) async {
    final url = Uri.parse('<seach_fund_url>');
    List<Map<String,String>> activeFilters = [];
    activeFilters.add({"facetField": "familyName", "operator": "eq", "value": "Putnam"});
    final body = jsonEncode({
      "query": query,
      "start": "0",
      "maxResults": "5",
      "activeFilters": activeFilters
    });
    final response = await http.post(url,
    body: body,
    headers: {'Content-type': 'application/json'});
    if(response.statusCode == 200){
      final jsonResponse = jsonDecode(response.body);
      List<Fund> funds = [];
      for (var element in (jsonResponse['funds'] as List)) { 
        //print(element);
        funds.add(Fund.fromJson(element));
      }
      return FundResponse(funds: funds, numberOfFunds: jsonResponse['numberOfFunds']);
    }
    else{
      throw Exception('Failed to load funds');
    }
  }


}