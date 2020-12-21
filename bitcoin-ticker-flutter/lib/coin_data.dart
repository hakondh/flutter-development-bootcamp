import 'package:http/http.dart' as http;
import 'dart:convert';

const url = 'https://rest.coinapi.io/v1/exchangerate/';
const apiKey = '0DFE22F9-D5ED-4668-9AA3-896824E75603';

Future getUSDRate() async {
  http.Response response = await http.get(url + 'BTC/USD', headers: {
    'X-CoinAPI-Key': apiKey,
  });

  if (response.statusCode == 200) {
    double rate = jsonDecode(response.body)['rate'];
    rate = num.parse(rate.toStringAsFixed(2));
    return rate;
  } else {
    print(response.statusCode);
  }
}

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

class CoinData {}
