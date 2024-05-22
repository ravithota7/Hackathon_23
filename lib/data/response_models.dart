class Fund {
  final String name;
  final String id;
  final String investmentVehicleId;
  final String tradingSymbol;
  final String legalType;
  final String morningstarCategory;
  final num? performanceBeforeSalesChargeYearToDate;
  final num? performanceBeforeSalesCharge1Year;
  final num? performanceBeforeSalesCharge3Year;
  final Map<String, dynamic>? link;

  const Fund(
      {required this.name,
      required this.id,
      required this.investmentVehicleId,
      required this.tradingSymbol,
      required this.legalType,
      required this.morningstarCategory,
      required this.performanceBeforeSalesChargeYearToDate,
      required this.performanceBeforeSalesCharge1Year,
      required this.performanceBeforeSalesCharge3Year,
      required this.link});

  factory Fund.fromJson(Map<String, dynamic> json) {
    return Fund(
        name: json['name'],
        id: json['id'],
        investmentVehicleId: json['investmentVehicleId'],
        tradingSymbol: json['tradingSymbol'],
        legalType: json['legalType'],
        morningstarCategory: json['morningstarCategory'],
        performanceBeforeSalesChargeYearToDate:
            json['performanceBeforeSalesChargeYearToDate'],
        performanceBeforeSalesCharge1Year:
            json['performanceBeforeSalesCharge1Year'],
        performanceBeforeSalesCharge3Year:
            json['performanceBeforeSalesCharge3Year'],
        link: json['link']);
  }
}

class FundResponse {
  final List<Fund> funds;
  final int numberOfFunds;
  const FundResponse({required this.funds, required this.numberOfFunds});
}

class FundInfoResponse {
  final num ? captureRatioDownY1;
  final num ? captureRatioDownY3;
  final num ? captureRatioDownY5;
  final num ? captureRatioUpY1;
  final num ? captureRatioUpY3;
  final num ? captureRatioUpY5;
  final bool ? closedToNewInvestors;
  final num ? effectiveDurationLong;
  final String ?  fundFamilyName;
  final num ?  fundNetAssets;
  final num ?  inceptionDate;
  final num ? informationRatioY1;
  final num ? informationRatioY3;
  final num ? informationRatioY5;
  final String ?  investmentVehicleId;
  final String ?  investmentVehicleName;
  final String ?  legalType;
  final num ? maxFrontLoad;
  final num ? minimumInvestment;
  final String ?  morningstarCategory;
  final String ?  morningstarPrimaryBm;
  final String ?  morningstarProspectusObjective;
  final num ?  performanceAsOfDate;
  final num ?  previousQuarterEndDate;
  final num ? previousQuarterTrailLoadAdjustedReturnSinceInception;
  final num ? previousQuarterTrailLoadAdjustedReturnY1;
  final num ? previousQuarterTrailLoadAdjustedReturnY10;
  final num ? previousQuarterTrailLoadAdjustedReturnY3;
  final num ? previousQuarterTrailLoadAdjustedReturnY5;
  final num ? previousQuarterTrailReturnSinceInception;
  final num ? previousQuarterTrailReturnY1;
  final num ? previousQuarterTrailReturnY10;
  final num ? previousQuarterTrailReturnY3;
  final num ? previousQuarterTrailReturnY5;
  final String ?  primaryBenchmark;
  final String ?  primaryBenchmarkId;
  final String ?  primaryBenchmarkSource;
  final num ? primaryIndexAlphaY1;
  final num ? primaryIndexAlphaY3;
  final num ? primaryIndexAlphaY5;
  final num ? primaryIndexBetaY1;
  final num ? primaryIndexBetaY3;
  final num ? primaryIndexBetaY5;
  final num ? primaryIndexRsquaredY1;
  final num ? prospectusNetExpenseRatio;
  final num ? prospectusNetExpenseRatioVsCat;
  final num ? ratingOverall;
  final num ? ratingY10;
  final num ? ratingY3;
  final num ? ratingY5;
  final String ?  shareClassType;
  final num ? sharpeRatioY1;
  final num ? sharpeRatioY10;
  final num ? sharpeRatioY10VsCat;
  final num ? sharpeRatioY15;
  final num ? sharpeRatioY15VsCat;
  final num ? sharpeRatioY1VsCat;
  final num ? sharpeRatioY20;
  final num ? sharpeRatioY20VsCat;
  final num ? sharpeRatioY3;
  final num ? sharpeRatioY3VsCat;
  final num ? sharpeRatioY5;
  final num ? sharpeRatioY5VsCat;
  final num ? standardDeviationY1;
  final num ? standardDeviationY10;
  final num ? standardDeviationY3;
  final num ? standardDeviationY5;
  final String ?  tradingSymbol;
  final num ? trailLoadAdjustedReturnSinceInception;
  final num ? trailLoadAdjustedReturnY1;
  final num ? trailLoadAdjustedReturnY10;
  final num ? trailLoadAdjustedReturnY3;
  final num ? trailLoadAdjustedReturnY5;
  final num ? trailLoadAdjustedReturnYtd;
  final num ? trailReturnSinceInception;
  final num ? trailReturnY1;
  final num ? trailReturnY10;
  final num ? trailReturnY10CategorySize;
  final num ? trailReturnY3;
  final num ? trailReturnY3CategorySize;
  final num ? trailReturnY5;
  final num ? trailReturnY5CategorySize;
  final num ? trailReturnYtd;
  final num ? trailReturnYtdCategorySize;
  final num ? trailReturnsVsCatM1;
  final num ? trailReturnsVsCatM3;
  final num ? trailReturnsVsCatSinceInception;
  final num ? trailReturnsVsCatY1;
  final num ? trailReturnsVsCatY10;
  final num ? trailReturnsVsCatY3;
  final num ? trailReturnsVsCatY5;
  final num ? trailReturnsVsCatYtd;
  final num ? trailReturnsVsIndexM1;
  final num ? trailReturnsVsIndexM3;
  final num ? trailReturnsVsIndexSinceInception;
  final num ? trailReturnsVsIndexY1;
  final num ? trailReturnsVsIndexY10;
  final num ? trailReturnsVsIndexY3;
  final num ? trailReturnsVsIndexY5;
  final num ? trailReturnsVsIndexYtd;
  final num ? transactionFee;
  final num ? turnoverRatio;
  final Map<String, dynamic>? link;

  const FundInfoResponse(
      { this.captureRatioDownY1,
       this.captureRatioDownY3,
       this.captureRatioDownY5,
       this.captureRatioUpY1,
       this.captureRatioUpY3,
       this.captureRatioUpY5,
       this.closedToNewInvestors,
       this.effectiveDurationLong,
       this.fundFamilyName,
       this.fundNetAssets,
       this.inceptionDate,
       this.informationRatioY1,
       this.informationRatioY3,
       this.informationRatioY5,
       this.investmentVehicleId,
       this.investmentVehicleName,
       this.legalType,
       this.maxFrontLoad,
       this.minimumInvestment,
       this.morningstarCategory,
       this.morningstarPrimaryBm,
       this.morningstarProspectusObjective,
       this.performanceAsOfDate,
       this.previousQuarterEndDate,
       this.previousQuarterTrailLoadAdjustedReturnSinceInception,
       this.previousQuarterTrailLoadAdjustedReturnY1,
       this.previousQuarterTrailLoadAdjustedReturnY10,
       this.previousQuarterTrailLoadAdjustedReturnY3,
       this.previousQuarterTrailLoadAdjustedReturnY5,
       this.previousQuarterTrailReturnSinceInception,
       this.previousQuarterTrailReturnY1,
       this.previousQuarterTrailReturnY10,
       this.previousQuarterTrailReturnY3,
       this.previousQuarterTrailReturnY5,
       this.primaryBenchmark,
       this.primaryBenchmarkId,
       this.primaryBenchmarkSource,
       this.primaryIndexAlphaY1,
       this.primaryIndexAlphaY3,
       this.primaryIndexAlphaY5,
       this.primaryIndexBetaY1,
       this.primaryIndexBetaY3,
       this.primaryIndexBetaY5,
       this.primaryIndexRsquaredY1,
       this.prospectusNetExpenseRatio,
       this.prospectusNetExpenseRatioVsCat,
       this.ratingOverall,
       this.ratingY10,
       this.ratingY3,
       this.ratingY5,
       this.shareClassType,
       this.sharpeRatioY1,
       this.sharpeRatioY10,
       this.sharpeRatioY10VsCat,
       this.sharpeRatioY15,
       this.sharpeRatioY15VsCat,
       this.sharpeRatioY1VsCat,
       this.sharpeRatioY20,
       this.sharpeRatioY20VsCat,
       this.sharpeRatioY3,
       this.sharpeRatioY3VsCat,
       this.sharpeRatioY5,
       this.sharpeRatioY5VsCat,
       this.standardDeviationY1,
       this.standardDeviationY10,
       this.standardDeviationY3,
       this.standardDeviationY5,
       this.tradingSymbol,
       this.trailLoadAdjustedReturnSinceInception,
       this.trailLoadAdjustedReturnY1,
       this.trailLoadAdjustedReturnY10,
       this.trailLoadAdjustedReturnY3,
       this.trailLoadAdjustedReturnY5,
       this.trailLoadAdjustedReturnYtd,
       this.trailReturnSinceInception,
       this.trailReturnY1,
       this.trailReturnY10,
       this.trailReturnY10CategorySize,
       this.trailReturnY3,
       this.trailReturnY3CategorySize,
       this.trailReturnY5,
       this.trailReturnY5CategorySize,
       this.trailReturnYtd,
       this.trailReturnYtdCategorySize,
       this.trailReturnsVsCatM1,
       this.trailReturnsVsCatM3,
       this.trailReturnsVsCatSinceInception,
       this.trailReturnsVsCatY1,
       this.trailReturnsVsCatY10,
       this.trailReturnsVsCatY3,
       this.trailReturnsVsCatY5,
       this.trailReturnsVsCatYtd,
       this.trailReturnsVsIndexM1,
       this.trailReturnsVsIndexM3,
       this.trailReturnsVsIndexSinceInception,
       this.trailReturnsVsIndexY1,
       this.trailReturnsVsIndexY10,
       this.trailReturnsVsIndexY3,
       this.trailReturnsVsIndexY5,
       this.trailReturnsVsIndexYtd,
       this.transactionFee,
       this.turnoverRatio,
       this.link});

  factory FundInfoResponse.fromJson(Map<String, dynamic> json) {
    return FundInfoResponse(
      captureRatioDownY1: json['captureRatioDownY1'],
      captureRatioDownY3: json['captureRatioDownY3'],
      captureRatioDownY5: json['captureRatioDownY5'],
      captureRatioUpY1: json['captureRatioUpY1'],
      captureRatioUpY3: json['captureRatioUpY3'],
      captureRatioUpY5: json['captureRatioUpY5'],
      closedToNewInvestors: json['closedToNewInvestors'],
      effectiveDurationLong: json['effectiveDurationLong'],
      fundFamilyName: json['fundFamilyName'],
      fundNetAssets: json['fundNetAssets'],
      inceptionDate: json['inceptionDate'],
      informationRatioY1: json['informationRatioY1'],
      informationRatioY3: json['informationRatioY3'],
      informationRatioY5: json['informationRatioY5'],
      investmentVehicleId: json['investmentVehicleId'],
      investmentVehicleName: json['investmentVehicleName'],
      legalType: json['legalType'],
      maxFrontLoad: json['maxFrontLoad'],
      minimumInvestment: json['minimumInvestment'],
      morningstarCategory: json['morningstarCategory'],
      morningstarPrimaryBm: json['morningstarPrimaryBm'],
      morningstarProspectusObjective: json['morningstarProspectusObjective'],
      performanceAsOfDate: json['performanceAsOfDate'],
      previousQuarterEndDate: json['previousQuarterEndDate'],
      previousQuarterTrailLoadAdjustedReturnSinceInception:
          json['previousQuarterTrailLoadAdjustedReturnSinceInception'],
      previousQuarterTrailLoadAdjustedReturnY1:
          json['previousQuarterTrailLoadAdjustedReturnY1'],
      previousQuarterTrailLoadAdjustedReturnY10:
          json['previousQuarterTrailLoadAdjustedReturnY10'],
      previousQuarterTrailLoadAdjustedReturnY3:
          json['previousQuarterTrailLoadAdjustedReturnY3'],
      previousQuarterTrailLoadAdjustedReturnY5:
          json['previousQuarterTrailLoadAdjustedReturnY5'],
      previousQuarterTrailReturnSinceInception:
          json['previousQuarterTrailReturnSinceInception'],
      previousQuarterTrailReturnY1: json['previousQuarterTrailReturnY1'],
      previousQuarterTrailReturnY10: json['previousQuarterTrailReturnY10'],
      previousQuarterTrailReturnY3: json['previousQuarterTrailReturnY3'],
      previousQuarterTrailReturnY5: json['previousQuarterTrailReturnY5'],
      primaryBenchmark: json['primaryBenchmark'],
      primaryBenchmarkId: json['primaryBenchmarkId'],
      primaryBenchmarkSource: json['primaryBenchmarkSource'],
      primaryIndexAlphaY1: json['primaryIndexAlphaY1'],
      primaryIndexAlphaY3: json['primaryIndexAlphaY3'],
      primaryIndexAlphaY5: json['primaryIndexAlphaY5'],
      primaryIndexBetaY1: json['primaryIndexBetaY1'],
      primaryIndexBetaY3: json['primaryIndexBetaY3'],
      primaryIndexBetaY5: json['primaryIndexBetaY5'],
      primaryIndexRsquaredY1: json['primaryIndexRsquaredY1'],
      prospectusNetExpenseRatio: json['prospectusNetExpenseRatio'],
      prospectusNetExpenseRatioVsCat: json['prospectusNetExpenseRatioVsCat'],
      ratingOverall: json['ratingOverall'],
      ratingY10: json['ratingY10'],
      ratingY3: json['ratingY3'],
      ratingY5: json['ratingY5'],
      shareClassType: json['shareClassType'],
      sharpeRatioY1: json['sharpeRatioY1'],
      sharpeRatioY10: json['sharpeRatioY10'],
      sharpeRatioY10VsCat: json['sharpeRatioY10VsCat'],
      sharpeRatioY15: json['sharpeRatioY15'],
      sharpeRatioY15VsCat: json['sharpeRatioY15VsCat'],
      sharpeRatioY1VsCat: json['sharpeRatioY1VsCat'],
      sharpeRatioY20: json['sharpeRatioY20'],
      sharpeRatioY20VsCat: json['sharpeRatioY20VsCat'],
      sharpeRatioY3: json['sharpeRatioY3'],
      sharpeRatioY3VsCat: json['sharpeRatioY3VsCat'],
      sharpeRatioY5: json['sharpeRatioY5'],
      sharpeRatioY5VsCat: json['sharpeRatioY5VsCat'],
      standardDeviationY1: json['standardDeviationY1'],
      standardDeviationY10: json['standardDeviationY10'],
      standardDeviationY3: json['standardDeviationY3'],
      standardDeviationY5: json['standardDeviationY5'],
      tradingSymbol: json['tradingSymbol'],
      trailLoadAdjustedReturnSinceInception:
          json['trailLoadAdjustedReturnSinceInception'],
      trailLoadAdjustedReturnY1: json['trailLoadAdjustedReturnY1'],
      trailLoadAdjustedReturnY10: json['trailLoadAdjustedReturnY10'],
      trailLoadAdjustedReturnY3: json['trailLoadAdjustedReturnY3'],
      trailLoadAdjustedReturnY5: json['trailLoadAdjustedReturnY5'],
      trailLoadAdjustedReturnYtd: json['trailLoadAdjustedReturnYtd'],
      trailReturnSinceInception: json['trailReturnSinceInception'],
      trailReturnY1: json['trailReturnY1'],
      trailReturnY10: json['trailReturnY10'],
      trailReturnY10CategorySize: json['trailReturnY10CategorySize'],
      trailReturnY3: json['trailReturnY3'],
      trailReturnY3CategorySize: json['trailReturnY3CategorySize'],
      trailReturnY5: json['trailReturnY5'],
      trailReturnY5CategorySize: json['trailReturnY5CategorySize'],
      trailReturnYtd: json['trailReturnYtd'],
      trailReturnYtdCategorySize: json['trailReturnYtdCategorySize'],
      trailReturnsVsCatM1: json['trailReturnsVsCatM1'],
      trailReturnsVsCatM3: json['trailReturnsVsCatM3'],
      trailReturnsVsCatSinceInception: json['trailReturnsVsCatSinceInception'],
      trailReturnsVsCatY1: json['trailReturnsVsCatY1'],
      trailReturnsVsCatY10: json['trailReturnsVsCatY10'],
      trailReturnsVsCatY3: json['trailReturnsVsCatY3'],
      trailReturnsVsCatY5: json['trailReturnsVsCatY5'],
      trailReturnsVsCatYtd: json['trailReturnsVsCatYtd'],
      trailReturnsVsIndexM1: json['trailReturnsVsIndexM1'],
      trailReturnsVsIndexM3: json['trailReturnsVsIndexM3'],
      trailReturnsVsIndexSinceInception:
          json['trailReturnsVsIndexSinceInception'],
      trailReturnsVsIndexY1: json['trailReturnsVsIndexY1'],
      trailReturnsVsIndexY10: json['trailReturnsVsIndexY10'],
      trailReturnsVsIndexY3: json['trailReturnsVsIndexY3'],
      trailReturnsVsIndexY5: json['trailReturnsVsIndexY5'],
      trailReturnsVsIndexYtd: json['trailReturnsVsIndexYtd'],
      transactionFee: json['transactionFee'],
      turnoverRatio: json['turnoverRatio'],
      link: json['link'],
    );
  }
}
