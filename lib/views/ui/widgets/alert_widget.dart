import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:yaffet/views/ui/widgets/textform.dart';

import '../../../controllers/cubit.dart';
import '../../../models/local_database/alert_database/alert_database_cubit.dart';
import '../styles/colors.dart';
import '../styles/sizes.dart';
import 'boxshadow.dart';
import 'buttons.dart';
import 'droplist.dart';
import 'message_to_user_widgets.dart';
import 'sizebox.dart';

/// this for
/// alert screen
Widget alertItem({
  required Map model,
  required BuildContext context,
}) =>
    Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 56.spMin,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            containerBoxShadow(),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  // ${model['karatGold'] == null ? '${model['karatGold']}' : ''}
                  '${AppCubit.get(context).isGoldInAlert ? model['isGold'] : model['isSilver']} ${model['price']} ${model['currency']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.spMin,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              IconButton(
                icon: Image.asset('assets/icons/edit_icon.png'),
                onPressed: () {
                  updateAlertItem(context: context, model: model);
                },
                color: const Color(0xffC08832),
              ),
              PSizeboxWidth10(width: 5),
              IconButton(
                icon: Image.asset('assets/icons/remove_icon.png'),
                onPressed: () {
                  confirmDeleteMessageForAlert(context: context, model: model);
                },
                color: const Color(0xff505F6D),
              ),
            ],
          ),
        ),
      ),
    );

Widget alertBuilder({
  required List<Map> alert,
  required BuildContext context,
}) =>
    ConditionalBuilder(
      condition: AlertDatabaseCubit.get(context).newAlertList.isNotEmpty,
      builder: (context) => ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => alertItem(
          context: context,
          model: alert[index],
        ),
        itemCount: alert.length,
      ),
      // this if no depot is not exist send this message
      fallback: (BuildContext context) => Center(
        child: Text(
          'No data is has been added please click on add new Alert to create new one',
          style: TextStyle(
            color: Colors.black.withOpacity(0.56),
            fontSize: 13.spMin,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );

// this pop up menu
Future popupAlertDialogWidget(
  BuildContext context, {
  double width = 190,
  bool isGold = false,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: StatefulBuilder(
        builder: (context, setState) => Container(
          width: 329.spMax,
          height: 453.spMin,
          padding: EdgeInsets.all(20.spMin),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F8F8),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // this for see price and currency metal type
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                FittedBox(
                                  child: Text(
                                    AppCubit.get(context).isGoldInAlert
                                        ? 'GOLD'
                                        : 'SILVER',
                                    style: TextStyle(
                                      color: pGoldColor,
                                      fontSize: 35.spMin,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                /// this button to change to gold or silver
                                FittedBox(
                                  child: TextButton(
                                    child: Text(
                                      'change',
                                      style: TextStyle(
                                        color: Color(0xFF1549CE),
                                        fontSize: 10.spMin,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onPressed: () {
                                      AppCubit.get(context)
                                          .isGoldInAlertCheck();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  AppCubit.get(context).currencySelected,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                PSizeboxWidth10(),
                              ],
                            ),
                          ),
                          PSizeboxHeight10(),
                          FittedBox(
                            child: Text(
                              '1 ${AppCubit.get(context).unitSelected}/${AppCubit.get(context).currencySelected} ${DateFormat('hh:mm a').format(DateTime.now())}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.spMin,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FittedBox(
                                  child: Text(
                                    '1,811.31USD',
                                    style: TextStyle(
                                      fontSize: 19.spMin,
                                      fontWeight: FontWeight.w700,
                                      color: pTextMoveUpColor,
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  child: Icon(
                                    Icons.arrow_drop_up_sharp,
                                    color: Color(0xff007104),
                                    size: 45.spMin,
                                  ),
                                )
                              ],
                            ),
                          ),
                          FittedBox(
                            child: Text(
                              '(0.01%)+0.17',
                              style: TextStyle(
                                fontSize: 13.spMin,
                                color: pTextMoveUpColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // weight value section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    FittedBox(
                      child: Text(
                        'Weight Value',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.spMin,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    FittedBox(
                      child: FormFieldWidget(
                        width: width.spMin,
                        controller: AppCubit.get(context)
                            .weightValueAlertMetalController,
                        validMsg: (String? value) {
                          if (value!.isEmpty) {
                            return 'shoulde text form not empty';
                          } else {
                            return null;
                          }
                        },
                        type: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                // weight unit section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    FittedBox(
                      child: Text(
                        'Weight Unit',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.spMin,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    FittedBox(
                      child: DropListWidget(
                        context: context,
                        width: width.spMin,
                        value: AppCubit.get(context).unitSelected,
                        items: AppCubit.get(context).unitMetalDropList,
                        onChange: (String? value) {
                          AppCubit.get(context).changedUnitDrop(change: value);
                        },
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: AppCubit.get(context).isGoldInAlert == true,
                  child: const Spacer(),
                ),
                // gold purity section
                Visibility(
                  visible: AppCubit.get(context).isGoldInAlert == true,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'Gold Purity',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.spMin,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      FittedBox(
                        child: DropListWidget(
                          width: width.spMin,
                          context: context,
                          value: AppCubit.get(context).karatSelected,
                          items: AppCubit.get(context).karatGoldMetalDropList,
                          onChange: (String? value) {
                            AppCubit.get(context)
                                .changeKaratUnitDrop(change: value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // currency section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      'Currency',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    FittedBox(
                      child: DropListWidget(
                        width: width.spMin,
                        context: context,
                        items: AppCubit.get(context).currencyDropList,
                        onChange: (String? value) {
                          AppCubit.get(context)
                              .changedCurrencyDrop(change: value);
                        },
                        value: AppCubit.get(context).currencySelected,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // price section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    FittedBox(
                      child: Text(
                        'Price',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.spMin,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    FittedBox(
                      child: FormFieldWidget(
                        width: width.spMin,
                        controller: AppCubit.get(context).priceMetalController,
                        validMsg: (String? value) {
                          if (value!.isEmpty) {
                            return 'sholde text form not empty';
                          } else {
                            return null;
                          }
                        },
                        type: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // this to add to database
                ElevatedButtonWidget(
                  width: 213.spMin,
                  height: 27.47.spMin,
                  name: 'Set Alert',
                  onPressed: () {
                    if (AppCubit.get(context).weightValueAlertMetalController.text.isNotEmpty || AppCubit.get(context).priceMetalController.text.isNotEmpty) {
                      AlertDatabaseCubit.get(context)
                          .insertAlertDatabase(
                        isGold: AppCubit.get(context).isGoldInAlert == true
                            ? 'GOLD'
                            : 'SILVER',
                        isSilver: AppCubit.get(context).isGoldInAlert == false
                            ? 'SILVER'
                            : 'GOLD',
                        weight: AppCubit.get(context).weightValueAlertMetalController.text,
                        price: AppCubit.get(context).priceMetalController.text,
                        unit: AppCubit.get(context).unitSelected,
                        karatGold: AppCubit.get(context).isGoldInAlert == true
                            ? AppCubit.get(context).karatSelected
                            : null,
                        currency: AppCubit.get(context).currencySelected,
                      )
                          .then((value) {
                        print('data inserted in alert');
                      });
                      Navigator.of(context).pop();
                    } else {
                      // if the text form empty
                      textFieldIsEmptyMessage();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

// this for update when click on update click

Future updateAlertItem({
  required BuildContext context,
  required model,
  double width = 190,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        content: Container(
          width: 329.spMax,
          height: 453.spMin,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F8F8),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            children: [
              const Spacer(),
              // weight value section
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  FittedBox(
                    child: Text(
                      'Weight Value',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  FittedBox(
                    child: FormFieldWidget(
                      width: width.spMin,
                      controller:
                          AppCubit.get(context).weightValueAlertMetalController,
                      validMsg: (String? value) {
                        if (value!.isEmpty) {
                          return 'sholde text form not empty';
                        } else {
                          return null;
                        }
                      },
                      type: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // weight unit section
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  FittedBox(
                    child: Text(
                      'Weight Unit',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  FittedBox(
                    child: DropListWidget(
                      context: context,
                      width: width.spMin,
                      value: AppCubit.get(context).unitSelected,
                      items: AppCubit.get(context).unitMetalDropList,
                      onChange: (String? value) {
                        AppCubit.get(context).changedUnitDrop(change: value);
                      },
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: AppCubit.get(context).isGoldInAlert == true,
                child: const Spacer(),
              ),
              // gold purity section
              Visibility(
                visible: AppCubit.get(context).isGoldInAlert == true,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      'Gold Purity',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    FittedBox(
                      child: DropListWidget(
                        width: width.spMin,
                        context: context,
                        value: AppCubit.get(context).karatSelected,
                        items: AppCubit.get(context).karatGoldMetalDropList,
                        onChange: (String? value) {
                          AppCubit.get(context)
                              .changeKaratUnitDrop(change: value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // currency section
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Currency',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.spMin,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  FittedBox(
                    child: DropListWidget(
                      width: width.spMin,
                      context: context,
                      items: AppCubit.get(context).currencyDropList,
                      onChange: (String? value) {
                        AppCubit.get(context)
                            .changedCurrencyDrop(change: value);
                      },
                      value: AppCubit.get(context).currencySelected,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // price section
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.spMin,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  FormFieldWidget(
                    width: width.spMin,
                    controller: AppCubit.get(context).priceMetalController,
                    validMsg: (String? value) {
                      if (value!.isEmpty) {
                        return 'sholde text form not empty';
                      } else {
                        return null;
                      }
                    },
                    type: TextInputType.number,
                  ),
                ],
              ),
              const Spacer(),
              // this to add to database
              ElevatedButtonWidget(
                width: 213.spMin,
                height: 27.47.spMin,
                name: 'Update',
                onPressed: () {
                  if (AppCubit.get(context)
                          .weightValueAlertMetalController
                          .text
                          .isNotEmpty &&
                      AppCubit.get(context)
                          .priceMetalController
                          .text
                          .isNotEmpty) {
                    AlertDatabaseCubit.get(context)
                        .updateItemAlert(
                      id: model['id'],
                      isGold: AppCubit.get(context).isGoldInAlert == true
                          ? 'GOLD'
                          : 'SILVER',
                      isSilver: AppCubit.get(context).isGoldInAlert == false
                          ? 'SILVER'
                          : 'GOLD',
                      weight: AppCubit.get(context)
                          .weightValueAlertMetalController
                          .text,
                      price: AppCubit.get(context).priceMetalController.text,
                      unit: AppCubit.get(context).unitSelected,
                      karatGold: AppCubit.get(context).isGoldInAlert == true
                          ? AppCubit.get(context).karatSelected
                          : null,
                      currency: AppCubit.get(context).currencySelected,
                    )
                        .then((value) {
                      print('data updated');
                    });
                    Navigator.of(context).pop();
                  } else {
                    // if the text form empty
                    textFieldIsEmptyMessage();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );

// this message to user to confirm the delete in alert screen
confirmDeleteMessageForAlert({
  required Map model,
  required BuildContext context,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderSizeOfDeledMessage.spMin),
        ),
        content: Text(
          'Are you sure you want to delete this row ?',
          style: TextStyle(
            fontSize: 15.spMin,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          ElevatedButtonWidget(
            width: 116.spMin,
            height: 28.81.spMin,
            name: 'Confirm',
            onPressed: () {
              AlertDatabaseCubit.get(context)
                  .deleteData(
                id: model['id'],
              )
                  .then((value) {
                Navigator.pop(context);
              });
            },
          ),
          ElevatedButtonWidget(
            width: 116.spMin,
            height: 28.81.spMin,
            color: const Color(0xFFD6B506),
            name: 'Cancel',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
