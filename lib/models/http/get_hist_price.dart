import 'dart:convert';

import 'package:http/http.dart' as http;


/// this for see metal price if gold or silver

class GetHistPrice {
  int? id;
  String? metalName;
  String? currency;
  String? metalPrice;
  String? date;
  String? name;
  GetHistPrice({
    required this.id,
    required this.metalName,
    required this.currency,
    required this.metalPrice,
    required this.date,
    required this.name,
  });

  Future<List<GetHistPrice>> getData() async {
    // api like
    String url = "https://api.yaffet.com/public/api/getHistPrice/platinum";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<GetHistPrice> data = [];
    for (var i in responseData) {
      GetHistPrice getData = GetHistPrice(
        id: i['id'],
        metalName: i['metalName'],
        currency: i['currency'],
        metalPrice: i['metalPrice'],
        date: i['date'],
        name: i['name'],
      );

      //adding user to the list.
      data.add(getData);
    }
    return data;
  }
}
