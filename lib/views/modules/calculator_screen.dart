// ignore_for_file: prefer_const_constructors,, prefer_const_literals_to_create_immutables
// prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../controllers/cubit.dart';
import '../../controllers/states.dart';
import '../ui/styles/colors.dart';
import '../ui/styles/sizes.dart';
import '../ui/widgets/boxshadow.dart';
import '../ui/widgets/buttons.dart';
import '../ui/widgets/droplist.dart';
import '../ui/widgets/padding.dart';
import '../ui/widgets/sizebox.dart';
import '../ui/widgets/textform.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        String saveMessageOfCalculate =
            '${AppCubit.get(context).currencySelected.isEmpty ? "" : AppCubit.get(context).currencySelected}/${AppCubit.get(context).unitSelected.isEmpty ? "" : AppCubit.get(context).unitSelected}';
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: pSizePaddingAll,
                  child: Column(
                    children: [
                      // this for see price or change metal type or currency
                      Container(
                        height: 370,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: pColorContainer,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // to see price and change currency or gold
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FittedBox(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.baseline,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              FittedBox(
                                                child: Text(
                                                  'GOLD',
                                                  style: TextStyle(
                                                    color: pGoldColor,
                                                    fontSize: 35,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              FittedBox(
                                                child: TextButton(
                                                  child: Text(
                                                    'change',
                                                    style: TextStyle(
                                                      color: Colors.lightBlue,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.baseline,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              Text(
                                                AppCubit.get(context).currencySelected,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              pSizeboxWidth10(),
                                              FittedBox(
                                                  child: TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  'change',
                                                  style: TextStyle(
                                                    color: Colors.lightBlue,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              )),
                                            ],
                                          ),
                                        ),
                                        pSizeboxHeight10(),
                                        FittedBox(
                                          child: Text(
                                            '1 ${AppCubit.get(context).unitSelected}/${AppCubit.get(context).currencySelected} ${DateFormat('hh:mm a').format(DateTime.now())}',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FittedBox(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              FittedBox(
                                                child: Text(
                                                  '1,811.31USD',
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w700,
                                                    color: pTextMoveUpColor,
                                                  ),
                                                ),
                                              ),
                                              FittedBox(
                                                child: Icon(
                                                  Icons.arrow_drop_up_sharp,
                                                  color: Color(0xff007104),
                                                  size: 45,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          child: Text(
                                            '(0.01%)+0.17',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: pTextMoveUpColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              pSizeboxHeight10(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  FittedBox(
                                    child: Text(
                                      'Weight Value',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Spacer(flex: 1),
                                  FittedBox(
                                    child: formFieldWidget(
                                      controller:
                                          cubit.weightValueMetalController,
                                      validMsg: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'text form not empty';
                                        } else {
                                          return null;
                                        }
                                      },
                                      type: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                              pSizeboxHeight10(),
                              // weight unit section
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  FittedBox(
                                    child: Text(
                                      'Weight Unit',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Spacer(flex: 1),
                                  FittedBox(
                                    child: Container(
                                      width: 190,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFDFDFD),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: dropListWidget(
                                        context: context,
                                        value: cubit.unitSelected,
                                        items: cubit.unitMetalDropList,
                                        onChange: (String? value) {
                                          cubit.changedUnitDrop(change: value);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              pSizeboxHeight10(),
                              // gold purity section
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    'Gold Purity',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(flex: 1),
                                  Container(
                                    width: 190,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFDFDFD),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: dropListWidget(
                                        context: context,
                                        value: cubit.karatSelected,
                                        items: cubit.karatGoldMetalDropList,
                                        onChange: (String? value) {
                                          cubit.changeKaratUnitDrop(
                                              change: value);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              pSizeboxHeight10(),
                              // currency section
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    'Currency',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(flex: 1),
                                  Container(
                                    width: 190,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFDFDFD),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: dropListWidget(
                                        context: context,
                                        items: cubit.currencyDropList,
                                        onChange: (String? value) {
                                          cubit.changedCurrencyDrop(
                                              change: value);
                                        },
                                        value: cubit.currencySelected,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              pSizeboxHeight10(),
                              Spacer(flex: 3),
                              Center(
                                child: FittedBox(
                                  child: elevatedButton(
                                    width: 213,
                                    height: 27.02,
                                    name: 'Calculate',
                                    onPressed: () {
                                      print('object');
                                    },
                                  ),
                                ),
                              ),
                              Spacer(flex: 3),
                            ],
                          ),
                        ),
                      ),
                      pSizeboxHeight15(),
                      Container(
                        height: 220,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: pColorContainer,
                          boxShadow: [
                            containerBoxShadow(),
                          ],
                          borderRadius: BorderRadius.circular(
                            pContainerBorderRadius,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(),
                                Expanded(
                                  flex: 2,
                                  child: FittedBox(
                                    child: Text(
                                      '${cubit.weightValueMetalController.text.isEmpty ? '1000' : cubit.weightValueMetalController.text} $saveMessageOfCalculate',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 33,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                pSizeboxHeight15(),
                                Expanded(
                                  child: Text(
                                    '${DateFormat.yMMMMEEEEd().format(DateTime.now())} ${DateFormat('hh:mm a').format(DateTime.now())}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                pSizeboxHeight5(),
                                Center(
                                  child: elevatedButton(
                                    color: Color(0xffD7B582),
                                    name: 'Clean',
                                    height: 40,
                                    borderColor: Color(0xFFCEA362),
                                    borderSide: 3,
                                    paddingButton: 10,
                                    onPressed: () {
                                      setState(
                                        () {
                                          saveMessageOfCalculate =
                                              'insert any things bro';
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      pSizeboxHeight35(),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
