// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// class PopupMenuButtonExample1 extends StatefulWidget {
//   const PopupMenuButtonExample1({Key? key}) : super(key: key);

//   @override
//   _PopupMenuButtonExample1State createState() =>
//       _PopupMenuButtonExample1State();
// }

// class _PopupMenuButtonExample1State extends State {
//   var selectedItem = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("AppMaking.com"),
//         centerTitle: true,
//         actions: [
//           PopupMenuButton(onSelected: (value) {
//             // your logic
//             setState(() {
//               selectedItem = value.toString();
//             });
//             print(value);
//             Navigator.pushNamed(context, value.toString());
//           }, itemBuilder: (BuildContext bc) {
//             return [
//               PopupMenuItem(
//                 child: ElevatedButton.icon(
//                   onPressed: () {},
//                   icon: const Icon(Icons.flag),
//                   label: const Text('data'),
//                 ),
//                 value: '/hello',
//               ),
//               const PopupMenuItem(
//                 child: Text("About"),
//                 value: '/about',
//               ),
//               const PopupMenuItem(
//                 child: Text("Contact"),
//                 value: '/contact',
//               )
//             ];
//           })
//         ],
//       ),
//       body: Center(
//         child: Text(selectedItem),
//       ),
//     );
//   }
// }

// class Charts extends StatelessWidget {
//   Charts({super.key});
//   final LinearGradient _linearGradient = LinearGradient(
//     colors: <Color>[
//       Color(0xff477BFF).withOpacity(0.7),
//       Colors.transparent,
//     ],
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:  Text('Syncfusion Flutter Gradient Area chart'),
//       ),
//       body: FittedBox(
//         child: SfCartesianChart(

//           // selectionType: SelectionType.cluster,
//           primaryXAxis: NumericAxis(
//             isVisible: false
//           ),
//           primaryYAxis: NumericAxis(
//             isVisible: false
//           ),
//           // // primaryYAxis: NumericAxis(minimum: 20),
//           series: <ChartSeries<SalesData, num>>[
//             AreaSeries<SalesData, num>(
//               dataSource: [
//                 SalesData(year: 2000, sales: 522.0),
//                 SalesData(year: 2005, sales: 155),
//                 SalesData(year: 2010, sales: 255),
//                 SalesData(year: 2015, sales: 600),
//               ],
//               gradient: _linearGradient,
//               xValueMapper: (SalesData sales, _) => sales.year,
//               yValueMapper: (SalesData sales, _) => sales.sales,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SalesData {
//   SalesData({required this.year, required this.sales});
//   final dynamic year;
//   final double sales;
// }

// class DropList extends StatefulWidget {
//   const DropList({super.key});

//   @override
//   State<DropList> createState() => _DropListState();
// }

// class _DropListState extends State<DropList> {
//   List<DropdownMenuItem<String>> get dropdownItems {
//     List<DropdownMenuItem<String>> menuItems = const [
//       DropdownMenuItem(child: Text("USD"), value: "USA"),
//       DropdownMenuItem(child: Text("EGP"), value: "Eygpt"),
//       DropdownMenuItem(child: Text("SAR"), value: "Saudi Arabia"),
//       DropdownMenuItem(child: Text("UAD"), value: "Emarat"),
//       DropdownMenuItem(child: Text("Euro"), value: "Europ"),
//     ];
//     return menuItems;
//   }

//   String selectedValue = "USA";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: DropdownButton(
//           icon: const Icon(
//             Icons.arrow_drop_down,
//           ),
//           value: selectedValue,
//           items: dropdownItems,
//           onChanged: (String? newValue) {
//             setState(
//               () {
//                 selectedValue = newValue!;
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class CardTest extends StatelessWidget {
//   const CardTest({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Center(
//           child: cardWidget(
//             price: "1,800.usd",
//             leading: 'assets/icons/21k.png',
//             karat: '21K',
//             unitMetal: 'oz',
//             changePriceOfMetal: '10% +17',
//             icon: Icons.arrow_upward,
//             iconColor: pIconColor,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TableScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: tableTimeOPriceWidget(),
//       ),
//     );
//   }
// }

// class ChangeThingOnScreen extends StatefulWidget {
//   const ChangeThingOnScreen({super.key});

//   @override
//   State<ChangeThingOnScreen> createState() => _ChangeThingOnScreenState();
// }

// class _ChangeThingOnScreenState extends State<ChangeThingOnScreen> {
//   bool changeThis = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     setState(() {
//                       changeThis = false;
//                     });
//                   },
//                   child: Text('gold'),
//                 ),
//                 SizedBox(width: 10),
//                 TextButton(
//                   child: Text('silver'),
//                   onPressed: () {
//                     setState(() {
//                       changeThis = true;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             ConditionalBuilder(
//               condition: changeThis == false,
//               builder: (context) => Text(
//                 'data 1',
//               ),
//               fallback: (context) => Container(
//                 color: Colors.blue,
//                 child: Text(
//                   'data 2',
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomeTextFiledCalculator extends StatefulWidget {
//   const HomeTextFiledCalculator({super.key});

//   @override
//   State<HomeTextFiledCalculator> createState() =>
//       _HomeTextFiledCalculatorState();
// }

// class _HomeTextFiledCalculatorState extends State<HomeTextFiledCalculator> {
//   final myController = TextEditingController();
//   double calculator = 0.0;
//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     myController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Column(
//             children: [
//               TextField(
//                 controller: myController,
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // When the user presses the button, show an alert dialog containing
//         // the text that the user has entered into the text field.
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 // Retrieve the text that the user has entered by using the
//                 // TextEditingController.
//                 content: Text('${int.parse(myController.text * 5).toString()}'),
//               );
//             },
//           );
//         },
//         tooltip: 'Show me the value!',
//         child: const Icon(Icons.text_fields),
//       ),
//     );
//   }
// }
//
// //Creating a class user to store the data;
// class User {
//   final int? id;
//   final int? userId;
//   final String? title;
//   final String? body;
//
//   User({
//     this.id,
//     this.userId,
//     this.title,
//     this.body,
//   });
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
// //Applying get request.
//
//   Future<List<User>> getRequest() async {
//     //replace your restFull API here.
//     // String url = "https://jsonplaceholder.typicode.com/posts";
//     String url =
//         "https://api.yaffet.com/public/api/prices-history?metal=silver&period=day";
//
//     final response = await http.get(Uri.parse(url));
//
//     var responseData = json.decode(response.body);
//
//     //Creating a list to store input data;
//     List<User> users = [];
//     for (var singleUser in responseData) {
//       User user = User(
//         id: singleUser["id"],
//         userId: singleUser["name"],
//         title: singleUser["data"],
//         body: singleUser["body"],
//       );
//
//       //Adding user to the list.
//       users.add(user);
//     }
//     return users;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Http Get Request."),
//           leading: Icon(
//             Icons.get_app,
//           ),
//         ),
//         body: Container(
//           padding: EdgeInsets.all(16.0),
//           child: FutureBuilder(
//             future: getRequest(),
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               if (snapshot.data == null) {
//                 return Container(
//                   child: Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 );
//               } else {
//                 return ListView.builder(
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (context, index) => ListTile(
//                     title: Text(
//                         'title ${snapshot.data[index].price} ${snapshot.data[index].date}'),
//                     subtitle: Text(snapshot.data[index].metalName),
//                     contentPadding: EdgeInsets.only(bottom: 20.0),
//                   ),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // class HiveHelper {
// //   var box = Hive.box(
// //     'myBox',
// //   );
// //   crateBox({required box}) async{
// //     box = await this.box;
// //     this.box.put('key', '')
// //   }
// // }
//
// Widget seeSilverPrice({required dynamic model}) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//     child: Row(
//       children: [
//         Expanded(
//           child: Container(
//             width: 120,
//             height: 120,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Text('${model['metalName']}'),
//           ),
//         ),
//         const SizedBox(width: 20),
//         Expanded(
//           child: SizedBox(
//             height: 120,
//             width: 120,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Expanded(
//                     child: Text(
//                   '${model['name']}',
//                   maxLines: 3,
//                   overflow: TextOverflow.ellipsis,
//                 )),
//                 const SizedBox(height: 5),
//                 Text(
//                   '${model['date'] ?? ''}',
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 Text(
//                   DateFormat().add_yMMMMEEEEd().format(
//                         DateTime.parse(
//                           model['date'],
//                         ),
//                       ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// class Data {
//   Data(
//     this.date,
//     this.price,
//   );
//
//   final String date;
//   final int price;
//
//   factory Data.fromJson(Map<String, dynamic> parsedJson) {
//     return Data(
//       parsedJson['date'].toString(),
//       parsedJson['price'],
//     );
//   }
// }
//
// class SeeSilver extends StatefulWidget {
//   const SeeSilver({super.key});
//
//   @override
//   State<SeeSilver> createState() => _SeeSilverState();
// }
//
// class _SeeSilverState extends State<SeeSilver> {
//   Future<String> getJsonFromFirebaseRestAPI() async {
//     String url = "https://api.yaffet.com/public/api/getHighestPrice.json";
//     http.Response response = await http.get(Uri.parse(url));
//     return response.body;
//   }
//
//   List<Data> chartData = [];
//
//   Future loadSalesData() async {
//     String jsonString = await getJsonFromFirebaseRestAPI();
//     final jsonResponse = json.decode(jsonString);
//     setState(() {
//       for (Map<String, dynamic> i in jsonResponse) {
//         chartData.add(Data.fromJson(i));
//       }
//     });
//   }
//
//   @override
//   void initState() {
//     loadSalesData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<DioCubit, DioState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(),
//           body: FutureBuilder(
//             future: getJsonFromFirebaseRestAPI(),
//             builder: (context, snapShot) {
//               if (snapShot.hasData) {
//                 return SfCartesianChart(
//                     primaryXAxis: CategoryAxis(),
//                     title: ChartTitle(text: 'Half yearly sales analysis'),
//                     series: <ChartSeries<Data, String>>[
//                       LineSeries<Data, String>(
//                         dataSource: chartData,
//                         xValueMapper: (Data sales, _) => sales.date,
//                         yValueMapper: (Data sales, _) => sales.price,
//                       )
//                     ]);
//               } else {
//                 return CircularProgressIndicator();
//               }
//             },
//           ),
//         );
//       },
//     );
//   }
// }
//
// class Charts extends StatefulWidget {
//   const Charts({super.key});
//
//   @override
//   State<Charts> createState() => _ChartsState();
// }
//
// class _ChartsState extends State<Charts> {
//   var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
//
//   List<double> silverHistoryPriceList = [];
//   dynamic metalPriceSilver;
//   dynamic metalPriceSilver2;
//   double? dateSilver;
//
//   void getSilverPriceHistory() {
//     DioHelper.getData(
//       url: 'public/api/prices-history?',
//       query: {
//         'metal': 'silver',
//         'period': 'day',
//       },
//     ).then((value) {
//       silverHistoryPriceList = value?.data['data']['metalPrice'];
//       metalPriceSilver = value?.data['metalPrice'];
//       metalPriceSilver2 = value?.data['metalPrice'];
//       dateSilver = value?.data['date'];
//     }).catchError((error) {
//       print('this is error ${error.toString()}');
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getSilverPriceHistory();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//           width: 300.0,
//           height: 100.0,
//           child: Sparkline(
//             data: silverHistoryPriceList,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ChartWidget extends StatefulWidget {
//   const ChartWidget({super.key});
//
//   @override
//   _ChartWidgetState createState() => _ChartWidgetState();
// }
//
// class _ChartWidgetState extends State<ChartWidget> {
//   List<dynamic> _silverPrices = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchSilverPrices();
//   }
//
//   Future<void> _fetchSilverPrices() async {
//     final response = await http.get(Uri.parse(
//         'https://api.yaffet.com/public/api/prices-history?metal=silver&period=day'));
//     if (response.statusCode == 200) {
//       setState(() {
//         // If the call to the server was successful, parse the JSON
//         _silverPrices = jsonDecode(response.body)['data'];
//       });
//     } else {
//       // If that call was not successful, throw an error.
//       throw Exception('Failed to load silver prices');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Silver Prices'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Silver Prices',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 20),
//             SizedBox(
//               height: 400,
//               child: SfCartesianChart(
//                 primaryXAxis: NumericAxis(
//                   edgeLabelPlacement: EdgeLabelPlacement.shift,
//                   interval: 1,
//                   maximum: 24,
//                   minimum: 0,
//                   labelIntersectAction: AxisLabelIntersectAction.rotate45,
//                   axisLine: AxisLine(width: 2),
//                   majorTickLines: MajorTickLines(size: 10),
//                   title: AxisTitle(text: 'Time'),
//                 ),
//                 primaryYAxis: NumericAxis(
//                   edgeLabelPlacement: EdgeLabelPlacement.shift,
//                   interval: 100,
//                   numberFormat: NumberFormat.simpleCurrency(),
//                   axisLine: AxisLine(width: 2),
//                   majorTickLines: MajorTickLines(size: 10),
//                   title: AxisTitle(text: 'Price'),
//                 ),
//                 series: <ChartSeries>[
//                   LineSeries<dynamic, double>(
//                     dataSource: _silverPrices,
//                     xValueMapper: (dynamic data, _) => data['date'],
//                     yValueMapper: (dynamic data, _) => data['metalPrice'],
//                     color: Colors.blue,
//                     markerSettings: MarkerSettings(
//                       isVisible: true,
//                     ),
//                   ),
//                 ],
//                 tooltipBehavior: TooltipBehavior(
//                   enable: true,
//                   format: 'point.x : point.y',
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ChartsData {
  ChartsData({this.month, this.price});

  final month;
  int? price;

// factory ChartsData.fromJson(Map<String, dynamic> parsedJson) {
//   return ChartsData(
//     parsedJson['date'].toString(),
//     parsedJson['metalPrice'],
//   );
// }
}

DropdownButton itemDown({
  required String? value,
  required List<DropdownMenuItem<String>>? items,
  required ValueChanged<String?>? onChange,
  bool isExpanded = true,
  double height = 19.55,
  double width = 190,
}) =>
    DropdownButton(
      value: value,
      items: items,
      onChanged: (value) {
        value = value;
      },
      isExpanded: true,
    );

List<DropdownMenuItem<String>>? iconCountryList = [
  DropdownMenuItem(
    value: "1",
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(Icons.perm_device_information_sharp),
        SizedBox(width: 10),
        Text(
          "build1",
        ),
      ],
    ),
  ),
  DropdownMenuItem(
    value: "2",
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(Icons.adb),
        SizedBox(width: 10),
        Text(
          "build2",
        ),
      ],
    ),
  ),
];

class DropListScreen extends StatefulWidget {
  const DropListScreen({super.key});

  @override
  State<DropListScreen> createState() => _DropListScreenState();
}

class _DropListScreenState extends State<DropListScreen> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          itemDown(
            value: '1',
            items: iconCountryList,
            onChange: (String? value) {
              setState(() {
                _value = value;
              });
            },
          )
        ],
      ),
    );
  }
}
