import 'dart:async';
import 'package:krypto/models/Crypto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CryptoService {
  String cryptoUrl =
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";
  Future<List<Crypto>?> fetchCryptoData() async {
    final response = await http.Client().get(Uri.parse(cryptoUrl));
    if (response.statusCode != 200) {
      return null;
    } else {
      List<Crypto>? cryptoList = [];
      Iterable items = jsonDecode(response.body);
      for (var element in items) {
        cryptoList.add(Crypto.fromJson(element));
      }
      return cryptoList;
    }
  }
}
