import 'dart:convert';

import 'package:http/http.dart' as http;

class PriceHistorySilver {
  int? id;
  String? metalName;
  String? currency;
  String? metalPrice;
  String? date;
  String? name;
  PriceHistorySilver({
    required this.id,
    required this.metalName,
    required this.currency,
    required this.metalPrice,
    required this.date,
    required this.name,
  });
  Future<List<PriceHistorySilver>> getData() async {
    // api like
    String url = "https://api.yaffet.com/public/api/prices-history?metal=silver&period=day";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<PriceHistorySilver> data = [];
    for (var i in responseData) {
      PriceHistorySilver getData = PriceHistorySilver(
        id: i['id'],
        currency: i['currency'],
        date: i['date'],
        metalName: i['metalName'],
        metalPrice: i['metalPrice'],
        name: i['name'],
      );

      //adding user to the list.
      data.add(getData);
    }
    return data;
  }
}
