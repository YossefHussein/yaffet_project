import 'dart:convert';

import 'package:http/http.dart' as http;

class PriceHistoryGold {
  int? id;
  String? metalName;
  String? currency;
  double? metalPrice;
  double? date;
  String? name;
  PriceHistoryGold({
    required this.id,
    required this.metalName,
    required this.currency,
    required this.metalPrice,
    required this.date,
    required this.name,
  });

 static List<PriceHistoryGold> data = [];

  static Future<List<PriceHistoryGold>> getData() async {
    // api like
    String url =
        "https://api.yaffet.com/public/api/prices-history?metal=gold&period=day";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    for (var i in responseData) {
      PriceHistoryGold getData = PriceHistoryGold(
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
