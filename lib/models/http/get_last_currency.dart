import 'dart:convert';

import 'package:http/http.dart' as http;

class GetLastCurrency {
  String? currencyCode;
  double? priceRate;
  GetLastCurrency({
    required this.currencyCode,
    required this.priceRate,
  });
  Future<List<GetLastCurrency>> getData() async {
    // api like
    String url = "https://api.yaffet.com/public/api/getLastCurrency";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<GetLastCurrency> data = [];
    for (var i in responseData) {
      GetLastCurrency getData = GetLastCurrency(
        currencyCode: i['currencyCode'],
        priceRate: i['priceRate'],
      );

      //adding user to the list.
      data.add(getData);
    }
    return data;
  }
}
