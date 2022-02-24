class Crypto {
  String? id;
  String? symbol;
  String? name;
  String? image;
  num? currentPrice;
  num? marketCap;
  num? marketCapRank;
  num? fullyDilutedValuation;
  num? totalVolume;
  num? high24h;
  num? low24h;
  num? priceChange24h;
  num? priceChangePercentage24h;
  num? marketCapChange24h;
  num? marketCapChangePercentage24h;
  num? circulatingSupply;
  num? totalSupply;
  num? maxSupply;
  num? ath;
  num? athChangePercentage;
  String? athDate;
  num? atl;
  num? atlChangePercentage;
  String? atlDate;
  dynamic roi;
  String? lastUpdated;

  Crypto(
      {this.id,
      this.symbol,
      this.name,
      this.image,
      this.currentPrice,
      this.marketCap,
      this.marketCapRank,
      this.fullyDilutedValuation,
      this.totalVolume,
      this.high24h,
      this.low24h,
      this.priceChange24h,
      this.priceChangePercentage24h,
      this.marketCapChange24h,
      this.marketCapChangePercentage24h,
      this.circulatingSupply,
      this.totalSupply,
      this.maxSupply,
      this.ath,
      this.athChangePercentage,
      this.athDate,
      this.atl,
      this.atlChangePercentage,
      this.atlDate,
      this.roi,
      this.lastUpdated});

  Crypto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    image = json['image'];
    currentPrice = json['current_price'];
    marketCap = json['market_cap'];
    marketCapRank = json['market_cap_rank'];
    fullyDilutedValuation = json['fully_diluted_valuation'];
    totalVolume = json['total_volume'];
    high24h = json['high_24h'];
    low24h = json['low_24h'];
    priceChange24h = json['price_change_24h'];
    priceChangePercentage24h = json['price_change_percentage_24h'];
    marketCapChange24h = json['market_cap_change_24h'];
    marketCapChangePercentage24h = json['market_cap_change_percentage_24h'];
    circulatingSupply = json['circulating_supply'];
    totalSupply = json['total_supply'];
    maxSupply = json['max_supply'];
    ath = json['ath'];
    athChangePercentage = json['ath_change_percentage'];
    athDate = json['ath_date'];
    atl = json['atl'];
    atlChangePercentage = json['atl_change_percentage'];
    atlDate = json['atl_date'];
    roi = json['roi'];
    lastUpdated = json['last_updated'];
  }
}
