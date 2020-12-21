import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '0DFE22F9-D5ED-4668-9AA3-896824E75603';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> rateMap = {};
    for (String cryptoCurrency in cryptoList) {
      double rate = await fetchRate(cryptoCurrency, selectedCurrency);
      rateMap[cryptoCurrency] = rate.toStringAsFixed(0);
    }
    print(rateMap);
    return rateMap;
  }

  Future fetchRate(cryptoCurrency, selectedCurrency) async {
    String requestURL =
        '$coinAPIURL/$cryptoCurrency/$selectedCurrency?apikey=$apiKey';
    print(requestURL);
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
