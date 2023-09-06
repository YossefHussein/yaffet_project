import 'dart:convert';

import 'package:http/http.dart' as http;

class GetHighestPrice {
  double? price;
  String? metal;
  String? currency;
  String? unit;
  String? date;
  GetHighestPrice({
    required this.price,
    required this.metal,
    required this.currency,
    required this.unit,
    required this.date,
  });
  static Future<List<GetHighestPrice>> getData() async {
    // api like
    String url = "https://api.yaffet.com/public/api/getHighestPrice";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<GetHighestPrice> data = [];
    for (var i in responseData) {
      GetHighestPrice getData = GetHighestPrice(
        price: i['price'],
        metal: i['metal'],
        currency: i['currency'],
        unit: i['unit'],
        date: i['date'],
      );

      //adding user to the list.
      data.add(getData);
    }
    return data;
  }
}
