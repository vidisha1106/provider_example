class CryptoModel
{
    String baseSymbol;
    String baseId;
    String quoteSymbol;
    String quoteId;
    String priceQuote;

    Map<String,dynamic> toJson() => {
      'baseSymbol' : baseSymbol,
      "baseId" : baseId,
      "quoteSymbol" : quoteSymbol,
      "quoteId" : quoteId,
      "priceQuote" : priceQuote,
    };

    CryptoModel.fromJson(Map<String,dynamic> json) :
          baseSymbol = json['baseSymbol'],
          baseId = json['baseId'],
          quoteSymbol = json['quoteSymbol'],
          quoteId = json['quoteId'],
          priceQuote = json['priceQuote'];
}