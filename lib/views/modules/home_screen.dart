import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../controllers/cubit.dart';
import '../../controllers/states.dart';
import '../../models/dio/dio_cubit/dio_cubit.dart';
import '../../test_widget.dart';
import '../ui/responsive/responsive.dart';
import '../ui/styles/colors.dart';
import '../ui/styles/sizes.dart';
import '../ui/widgets/boxshadow.dart';
import '../ui/widgets/buttons.dart';
import '../ui/widgets/cards.dart';
import '../ui/widgets/linear_gradient_color.dart';
import '../ui/widgets/padding.dart';
import '../ui/widgets/sizebox.dart';
import '../ui/widgets/tables_price.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   PriceHistoryGold.getData();
  //   super.initState();
  // }

  // List<ChartsData> chartData = [];

  // Future<String> getJsonFromRestAPI() async {
  //   String url = "https://api.yaffet.com/public/api/prices-history?metal=silver&period=day";
  //   http.Response response = await http.get(Uri.parse(url));
  //   return response.body;
  // }

  // Future loadSalesData() async {
  //   String jsonString = await getJsonFromRestAPI();
  //   final jsonResponse = json.decode(jsonString);
  //   setState(() {
  //     for (Map<String, dynamic> i in jsonResponse) {
  //       chartData.add(ChartsData.fromJson(i));
  //     }
  //   });
  // }

  // @override
  // void initState() {
  //   loadSalesData();
  //   super.initState();
  // }

  var isButtonActive1D = true;
  var isButtonActive1W = false;
  var isButtonActive1M = false;
  var isButtonActive6M = false;
  var isButtonActive1Y = false;
  var isButtonActive1All = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        // ignore: unused_local_variable
        DioCubit dioCubit = DioCubit.get(context);
        // this widget use scroll but with expanded widgets
        return Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: pSizePaddingOnly,
                  child: Column(
                    children: [
                      // this padding for drop button
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 18.33,
                          top: 6.33,
                        ),
                        // row of drop list
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // currency drop list
                            Container(
                              height: 27.sp,
                              width: 92.sp,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(
                                top: 5.0,
                                right: 15.0,
                                bottom: 5.0,
                                left: 15.0,
                              ),
                              decoration: BoxDecoration(
                                color: pColorDropListOfHomeScreen,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.flag,
                                  ),
                                  DropdownButton(
                                    alignment: Alignment.center,
                                    dropdownColor: pColorDropList,
                                    icon: const Icon(
                                      Icons.arrow_drop_down_rounded,
                                      color: pColorIconDropList,
                                    ),
                                    underline: Container(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    value: cubit.currencySelected,
                                    items: cubit.currencyDropList,
                                    onChanged: (String? newValue) {
                                      cubit.changedCurrencyDrop(
                                        change: newValue,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            // this for select unit
                            Container(
                              height: 27.sp,
                              width: 61.sp,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(
                                top: 5.0,
                                bottom: 5.0,
                              ),
                              decoration: BoxDecoration(
                                color: pColorDropListOfHomeScreen,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 0.5,
                                    blurRadius: 1,
                                    offset: const Offset(0, 0.5),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButton(
                                alignment: Alignment.center,
                                icon: const Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: pColorIconDropList,
                                ),
                                underline: Container(
                                  color: Colors.transparent,
                                ),
                                dropdownColor: pColorDropList,
                                borderRadius: BorderRadius.circular(10),
                                value: cubit.unitSelected,
                                items: cubit.unitMetalDropList,
                                onChanged: (String? newValue) {
                                  cubit.changedUnitDrop(
                                    change: newValue,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 421.92.sp,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              containerBoxShadow(),
                            ],
                            borderRadius: BorderRadius.circular(
                              pContainerBorderRadius,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                // this for choice silver or gold
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    gradientButtonWidget(
                                      text: 'GOLD',
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          const Color(0xFFDAB906)
                                              .withOpacity(0.71),
                                          const Color(0xFFDAB906)
                                              .withOpacity(1),
                                          const Color(0xFFDAB906)
                                              .withOpacity(1),
                                          const Color(0xFFDAB906)
                                              .withOpacity(0.68),
                                          const Color(0xFFDAB906)
                                              .withOpacity(0.63),
                                          const Color(0xFFDAB906)
                                              .withOpacity(0.54),
                                          const Color(0xFFF5D62D)
                                              .withOpacity(0.67),
                                        ],
                                      ),
                                      onPressed: () {
                                        cubit.reverseGoldCard();
                                        cubit.changeMetalTypeToGold();
                                        print('gold button is pressed');
                                      },
                                    ),
                                    pSizeboxWidth15(),
                                    gradientButtonWidget(
                                      text: 'silver',
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          const Color(0xFFB7B7B7)
                                              .withOpacity(0.71),
                                          const Color(0xFFBDBDBD),
                                          const Color(0xFFBEBEBE),
                                          const Color(0xFFA4A4A3)
                                              .withOpacity(0.68),
                                          const Color(0xFFA6A6A6)
                                              .withOpacity(0.63),
                                          const Color(0xFF858585)
                                              .withOpacity(0.54),
                                          const Color(0xFF848484)
                                              .withOpacity(0.67),
                                        ],
                                      ),
                                      onPressed: () {
                                        cubit.deleteGoldCard();
                                        cubit.changeMetalTypeToSilver();
                                        print('silver button is pressed');
                                      },
                                    ),
                                  ],
                                ),
                                pSizeboxHeight15(),
                                FittedBox(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      // price
                                      FittedBox(
                                        child: Text(
                                          '1885.31 ${cubit.currencySelected}',
                                          style: TextStyle(
                                            fontSize: 29.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      pSizeboxWidth10(),
                                      // time of price
                                      FittedBox(
                                        child: Text(
                                          '1 ${cubit.unitSelected}/${cubit.currencySelected} ${DateFormat('hh:mm a').format(DateTime.now())}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // currency
                                Text(
                                  cubit.changedCountyDrop().toString(),
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                // this to see the price to up or down
                                FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.arrow_upward,
                                        color: pIconColor,
                                      ),
                                      pSizeboxWidth5(),
                                      Text(
                                        '(0.01%)+0.17',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w700,
                                          color: pTextMoveUpColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: SfCartesianChart(
                                    primaryXAxis: NumericAxis(
                                      isVisible: false,
                                    ),
                                    primaryYAxis: NumericAxis(
                                      isVisible: false,
                                    ),
                                    // delete border of chart
                                    plotAreaBorderWidth: 0,
                                    series: <ChartSeries<ChartsData, num>>[
                                      AreaSeries<ChartsData, num>(
                                        dataSource: [
                                          // this data
                                          ChartsData(month: 2000, price: 200),
                                          ChartsData(month: 2005, price: 500),
                                          ChartsData(month: 2010, price: 255),
                                          ChartsData(month: 2015, price: 600),
                                          ChartsData(month: 2016, price: 630),
                                          ChartsData(month: 2019, price: 425),
                                        ],
                                        borderColor: pGoldColor,
                                        borderWidth: 2,
                                        gradient: linearGradient,
                                        xValueMapper: (ChartsData sales, _) =>
                                            sales.month,
                                        yValueMapper: (ChartsData sales, _) =>
                                            sales.price,
                                      ),
                                    ],
                                  ),
                                ),
                                // FutureBuilder(
                                //   future: getJsonFromRestAPI(),
                                //   builder: (context, snapShot) {
                                //     if (snapShot.hasData) {
                                //       return Expanded(
                                //         child: Container(
                                //           width: double.infinity,
                                //           child: SfCartesianChart(
                                //             primaryXAxis: NumericAxis(
                                //               isVisible: false,
                                //             ),
                                //             primaryYAxis: NumericAxis(
                                //               isVisible: false,
                                //             ),
                                //             // delete border
                                //             plotAreaBorderWidth: 0,
                                //             series: <ChartSeries<ChartsData,
                                //                 num>>[
                                //               AreaSeries<ChartsData, num>(
                                //                 dataSource: chartData,
                                //                 borderColor: pGoldColor,
                                //                 borderWidth: 3.5,
                                //                 gradient: linearGradient,
                                //                 xValueMapper:
                                //                     (ChartsData sales, _) =>
                                //                         sales.month,
                                //                 yValueMapper:
                                //                     (ChartsData sales, _) =>
                                //                         sales.sales,
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       );
                                //     } else {
                                //       return Expanded(child: CircularProgressIndicator());
                                //     }
                                //   },
                                // ),
                                pSizeboxHeight15(),
                                Responsive(
                                  mobileUi: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      textButtonWidget(
                                        title: '1d',
                                        onPressed: () {
                                          setState(() {
                                            isButtonActive1D = true;
                                            isButtonActive1W = false;
                                            isButtonActive1M = false;
                                            isButtonActive6M = false;
                                            isButtonActive1Y = false;
                                            isButtonActive1All = false;
                                          });
                                        },
                                        isActive: isButtonActive1D,
                                      ),
                                      textButtonWidget(
                                        isActive: isButtonActive1W,
                                        title: '1w',
                                        onPressed: () {
                                          setState(() {
                                            isButtonActive1W = true;
                                            isButtonActive1D = false;
                                            isButtonActive1M = false;
                                            isButtonActive6M = false;
                                            isButtonActive1Y = false;
                                            isButtonActive1All = false;
                                          });
                                        },
                                      ),
                                      textButtonWidget(
                                        title: '1m',
                                        isActive: isButtonActive1M,
                                        onPressed: () {
                                          setState(() {
                                            isButtonActive1W = false;
                                            isButtonActive1D = false;
                                            isButtonActive1M = true;
                                            isButtonActive6M = false;
                                            isButtonActive1Y = false;
                                            isButtonActive1All = false;
                                          });
                                        },
                                      ),
                                      textButtonWidget(
                                        title: '6M',
                                        isActive: isButtonActive6M,
                                        onPressed: () {
                                          setState(() {
                                            isButtonActive1W = false;
                                            isButtonActive1D = false;
                                            isButtonActive1M = false;
                                            isButtonActive6M = true;
                                            isButtonActive1Y = false;
                                            isButtonActive1All = false;
                                          });
                                        },
                                      ),
                                      textButtonWidget(
                                        title: '1y',
                                        isActive: isButtonActive1Y,
                                        onPressed: () {
                                          setState(() {
                                            isButtonActive1W = false;
                                            isButtonActive1D = false;
                                            isButtonActive1M = false;
                                            isButtonActive6M = false;
                                            isButtonActive1Y = true;
                                            isButtonActive1All = false;
                                          });
                                        },
                                      ),
                                      textButtonWidget(
                                        isActive: isButtonActive1All,
                                        title: 'ALL',
                                        onPressed: () {
                                          setState(() {
                                            isButtonActive1W = false;
                                            isButtonActive1D = false;
                                            isButtonActive1M = false;
                                            isButtonActive6M = false;
                                            isButtonActive1Y = false;
                                            isButtonActive1All = true;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  tabletUi: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textButtonWidget(
                                          height: 62,
                                          width: 64,
                                          title: '1d',
                                          onPressed: () {
                                            setState(() {
                                              isButtonActive1D = true;
                                              isButtonActive1W = false;
                                              isButtonActive1M = false;
                                              isButtonActive6M = false;
                                              isButtonActive1Y = false;
                                              isButtonActive1All = false;
                                            });
                                          },
                                          isActive: isButtonActive1D),
                                      textButtonWidget(
                                        height: 62,
                                        width: 64,
                                        isActive: isButtonActive1W,
                                        title: '1w',
                                        onPressed: () {
                                          setState(() {
                                            isButtonActive1W = true;
                                            isButtonActive1D = false;
                                            isButtonActive1M = false;
                                            isButtonActive6M = false;
                                            isButtonActive1Y = false;
                                            isButtonActive1All = false;
                                          });
                                        },
                                      ),
                                      textButtonWidget(
                                        height: 62,
                                        width: 64,
                                        title: '1m',
                                        isActive: isButtonActive1M,
                                        onPressed: () {
                                          setState(() {
                                            isButtonActive1W = false;
                                            isButtonActive1D = false;
                                            isButtonActive1M = true;
                                            isButtonActive6M = false;
                                            isButtonActive1Y = false;
                                            isButtonActive1All = false;
                                          });
                                        },
                                      ),
                                      textButtonWidget(
                                        height: 62,
                                        width: 64,
                                        title: '6M',
                                        isActive: isButtonActive6M,
                                        onPressed: () {
                                          setState(() {
                                            isButtonActive1W = false;
                                            isButtonActive1D = false;
                                            isButtonActive1M = false;
                                            isButtonActive6M = true;
                                            isButtonActive1Y = false;
                                            isButtonActive1All = false;
                                          });
                                        },
                                      ),
                                      textButtonWidget(
                                        height: 62,
                                        width: 64,
                                        title: '1Y',
                                        isActive: isButtonActive1Y,
                                        onPressed: () {
                                          setState(() {
                                            isButtonActive1W = false;
                                            isButtonActive1D = false;
                                            isButtonActive1M = false;
                                            isButtonActive6M = false;
                                            isButtonActive1Y = true;
                                            isButtonActive1All = false;
                                          });
                                        },
                                      ),
                                      textButtonWidget(
                                        height: 62,
                                        width: 64,
                                        title: 'All',
                                        isActive: isButtonActive1Y,
                                        onPressed: () {
                                          setState(() {
                                            isButtonActive1All = true;
                                            isButtonActive1W = false;
                                            isButtonActive1D = false;
                                            isButtonActive1M = false;
                                            isButtonActive6M = false;
                                            isButtonActive1Y = false;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // when user click on silver button hide this sections
                      // give in user spacer
                      Visibility(
                        visible: AppCubit.get(context).isCardOfGoldExist,
                        child: ConditionalBuilder(
                          condition: AppCubit.get(context).isCardOfGoldExist,
                          builder: (context) => pSizeboxHeight25(),
                          fallback: (context) => pSizeboxHeight25(),
                        ),
                      ),
                      // when user click on silver button hide this sections
                      // gold or silver price card section
                      Visibility(
                        visible: AppCubit.get(context).isCardOfGoldExist,
                        child: Expanded(
                          flex: 0,
                          child: Container(
                            // height: 337.sp,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 3,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(
                                pContainerBorderRadius,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  pSizeboxHeight15(),
                                  Text(
                                    'Metal Price',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                  pSizeboxHeight15(),
                                  cardWidget(
                                    price: "1,900 ${cubit.currencySelected}",
                                    leading: 'assets/icons/24k.png',
                                    karat: '24K',
                                    unitMetal: '1${cubit.unitSelected}',
                                    changePriceOfMetal: '15% +17',
                                    icon: Icons.arrow_upward,
                                    iconColor: pIconColor,
                                  ),
                                  pSizeboxHeight20(height: 22),
                                  cardWidget(
                                    price: "1,800 ${cubit.currencySelected}",
                                    leading: 'assets/icons/21k.png',
                                    karat: '21K',
                                    unitMetal: '1${cubit.unitSelected}',
                                    changePriceOfMetal: '10% +17',
                                    icon: Icons.arrow_upward,
                                    iconColor: pIconColor,
                                  ),
                                  pSizeboxHeight20(height: 22),
                                  cardWidget(
                                    price: "1,700 ${cubit.currencySelected}",
                                    leading: 'assets/icons/18k.png',
                                    karat: '18K',
                                    unitMetal: '1${cubit.unitSelected}',
                                    changePriceOfMetal: '15% +17',
                                    icon: Icons.arrow_upward,
                                    iconColor: pIconColor,
                                  ),
                                  pSizeboxHeight20(height: 22),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // gold or silver price performance
                      pSizeboxHeight25(),
                      Expanded(
                        flex: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              containerBoxShadow(),
                            ],
                            borderRadius: BorderRadius.circular(
                              pContainerBorderRadius,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 35,
                              right: 10,
                              left: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${cubit.isGoldHomeScreen ? 'Gold' : 'Silver'} Price Performance ${cubit.currencySelected}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                pSizeboxHeight20(),
                                tableTimeOPriceWidget(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      pSizeboxHeight25(),
                      // hightest price of silver
                      Expanded(
                        flex: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              containerBoxShadow(),
                            ],
                            borderRadius: BorderRadius.circular(
                              pContainerBorderRadius,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 35,
                              right: 10,
                              left: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Highest Price Of ${cubit.isGoldHomeScreen ? 'Gold' : 'Silver'}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                pSizeboxHeight20(),
                                tableMetalPriceWidget(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
