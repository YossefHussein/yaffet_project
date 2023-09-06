import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../controllers/cubit.dart';
import '../../../models/local_database/depot_database/depot_database_cubit.dart';
import '../styles/sizes.dart';
import 'boxshadow.dart';
import 'buttons.dart';
import 'droplist.dart';
import 'message_to_user_widgets.dart';
import 'sizebox.dart';
import 'textform.dart';

/// this for
/// depot screen

// this item in listview
Widget depotItem({
  required Map model,
  required BuildContext context,
}) =>
    Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 56.sp,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            containerBoxShadow(),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                flex: 3,
                // child: TextScroll(
                // ${model['weightValue']} ${model['weightUnit']}
                child: TextScroll(
                  '${model['name']}',
                  delayBefore: Duration(seconds: 1),
                  mode: TextScrollMode.endless,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              IconButton(
                icon: Image.asset('assets/icons/edit_icon.png'),
                onPressed: () {
                  updateDepotItem(context: context, model: model);
                },
                color: Color(0xffC08832),
              ),
              pSizeboxWidth10(width: 5),
              IconButton(
                icon: Image.asset('assets/icons/remove_icon.png'),
                onPressed: () {
                  confirmDeleteMessageForDepot(context: context, model: model);
                },
                color: Color(0xff505F6D),
              ),
            ],
          ),
        ),
      ),
    );

// this for build depot in screen with another widget
Widget depotBuilder({
  required List<Map> depot,
  required BuildContext context,
}) =>
    ConditionalBuilder(
      condition: DepotDatabaseCubit.get(context).newDepotList.isNotEmpty,
      builder: (BuildContext context) => ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => depotItem(
          context: context,
          model: depot[index],
        ),
        itemCount: depot.length,
      ),
      // this if no depot is not exist send this message
      fallback: (BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'No data is has been added please click on add new Depot to create new one',
              style: TextStyle(
                color: Colors.black.withOpacity(0.56),
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );

// this pop up menu for depot
// Future popupDepotDialogWidget(
//   BuildContext context, {
//   double width = 120,
//   bool isGold = true,
// }) =>
//     showDialog(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         backgroundColor: Colors.transparent,
//         content: Container(
//           height: 400,
//           width: 400,
//           padding: EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Color(0xFFF8F8F8),
//             borderRadius: BorderRadius.circular(15),
//             boxShadow:  [
//               BoxShadow(
//                 color: Color(0x3F000000),
//                 blurRadius: 4,
//                 offset: Offset(0, 4),
//                 spreadRadius: 0,
//               )
//             ],
//           ),
//           child: StatefulBuilder(
//             builder: (context, setState) => Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   children: [
//                      FittedBox(
//                       child: Text(
//                         'Name',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                      Spacer(),
//                     FittedBox(
//                       child: formFieldWidget(
//                         width: width,
//                         type: TextInputType.name,
//                         controller: AppCubit.get(context).nameDepotController,
//                       ),
//                     )
//                   ],
//                 ),
//                  Spacer(),
//                 // Depot type section
//                 Row(
//                   children: [
//                      FittedBox(
//                       child: Text(
//                         'Depot type',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                      Spacer(),
//                     dropListWidget(
//                       context: context,
//                       width: width,
//                       value: AppCubit.get(context).depotTypeSelected,
//                       items: AppCubit.get(context).depotTypeDropList,
//                       onChange: (change) {
//                         AppCubit.get(context)
//                             .changedDepotTypeDrop(change: change);
//                         setState(() {
//                           isGold = !isGold;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//                  Spacer(),
//                 // value section
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.baseline,
//                   textBaseline: TextBaseline.alphabetic,
//                   children: [
//                      FittedBox(
//                       child: Text(
//                         'Weight Value',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                      Spacer(),
//                     FittedBox(
//                       child: formFieldWidget(
//                         width: width,
//                         controller: AppCubit.get(context)
//                             .weightValueAlertMetalController,
//                         validMsg: (String? value) {
//                           if (value!.isEmpty) {
//                             return 'sholde text form not empty';
//                           } else {
//                             return null;
//                           }
//                         },
//                         type: TextInputType.number,
//                       ),
//                     ),
//                   ],
//                 ),
//                  Spacer(),
//                 // Weight Unit section
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.baseline,
//                   textBaseline: TextBaseline.alphabetic,
//                   children: [
//                      FittedBox(
//                       child: Text(
//                         'Weight Unit',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                      Spacer(),
//                     FittedBox(
//                       child: dropListWidget(
//                         context: context,
//                         width: width,
//                         value: AppCubit.get(context).unitSelected,
//                         items: AppCubit.get(context).unitMetalDropList,
//                         onChange: (String? value) {
//                           AppCubit.get(context).changedUnitDrop(change: value);
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 ConditionalBuilder(
//                   condition: isGold == true,
//                   builder: (BuildContext context) =>  Spacer(),
//                   fallback: null,
//                 ),
//                 // Pure gold section
//                 ConditionalBuilder(
//                   condition: isGold == true,
//                   fallback: null,
//                   builder: (context) => Row(
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     textBaseline: TextBaseline.alphabetic,
//                     children: [
//                        FittedBox(
//                         child: Text(
//                           'Pure gold',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                        Spacer(),
//                       FittedBox(
//                         child: dropListWidget(
//                           context: context,
//                           width: width,
//                           value: AppCubit.get(context).karatSelected,
//                           items: AppCubit.get(context).karatGoldMetalDropList,
//                           onChange: (String? value) {
//                             AppCubit.get(context)
//                                 .changeKaratUnitDrop(change: value);
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                  Spacer(),
//                 // section currency
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.baseline,
//                   textBaseline: TextBaseline.alphabetic,
//                   children: [
//                      FittedBox(
//                       child: Text(
//                         'Currency',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                      Spacer(),
//                     FittedBox(
//                       child: dropListWidget(
//                         context: context,
//                         width: width,
//                         items: AppCubit.get(context).currencyDropList,
//                         onChange: (String? value) {
//                           AppCubit.get(context)
//                               .changedCurrencyDrop(change: value);
//                         },
//                         value: AppCubit.get(context).currencySelected,
//                       ),
//                     ),
//                   ],
//                 ),
//                  Spacer(),
//                 // to add database
//                 elevatedButton(
//                   width: 213,
//                   height: 27.47,
//                   name: 'Save',
//                   onPressed: () {
//                     if (AppCubit.get(context)
//                         .nameDepotController
//                         .text
//                         .isNotEmpty) {
//                       // DepotDatabaseCubit.get(context)
//                       //     .insertDepotDatabase(
//                       //   name: AppCubit.get(context).nameDepotController.text,
//                       //   currency: AppCubit.get(context).currencySelected,
//                       //   depotType: AppCubit.get(context).depotTypeSelected,
//                       //   pureGold: AppCubit.get(context).karatSelected,
//                       //   weightUnit: null,
//                       //   weightValue: null,
//                       // )
//                       //     .then(
//                       //   (value) {
//                       //     Navigator.of(context).pop();
//                       //   },
//                       // );
//                       // DepotDatabaseCubit.get(context).insertData(
//                       //          name: AppCubit.get(context).nameDepotController.text,
//                       //   currency: AppCubit.get(context).currencySelected,
//                       //   depotType: AppCubit.get(context).depotTypeSelected,
//                       //   pureGold: AppCubit.get(context).karatSelected,
//                       //   weightUnit: null,
//                       //   weightValue: null,
//                       // ).then((value){
//                       //   Navigator.pop(context);
//                       // });
//                     } else {
//                       textFieldIsEmptyMessage();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );

Future popupDepotDialogWidget({
  BuildContext? context,
  double width = 190,
}) =>
    showDialog(
      context: context!,
      builder: (BuildContext context) => AlertDialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        content: Container(
          width: 329.spMax,
          height: 453.spMin,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFFF8F8F8),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.sp,
              vertical: 5.sp,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer__literals_to_create_immutables
              children: [
                Spacer(),
                // this name of depot
                Row(
                  children: [
                    FittedBox(
                      child: Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      child: formFieldWidget(
                        width: width.spMin,
                        type: TextInputType.name,
                        controller: AppCubit.get(context).nameDepotController,
                      ),
                    )
                  ],
                ),
                Spacer(),
                // Depot type section
                Row(
                  children: [
                    FittedBox(
                      child: Text(
                        'Depot type',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      child: dropListWidget(
                        context: context,
                        width: width.spMin,
                        value: AppCubit.get(context).depotTypeSelected,
                        items: AppCubit.get(context).depotTypeDropList,
                        onChange: (change) {
                          AppCubit.get(context)
                              .changedDepotTypeDrop(change: change);
                        },
                      ),
                    ),
                  ],
                ),
                // Weight value section
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    FittedBox(
                      child: Text(
                        'Weight Value',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    // Spacer(),
                    FittedBox(
                      child: formFieldWidget(
                        width: width.spMin,
                        controller: AppCubit.get(context)
                            .weightValueDepotMetalController,
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
                Spacer(),
                // Weight Unit section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    FittedBox(
                      child: Text(
                        'Weight Unit',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      child: dropListWidget(
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
                Spacer(),
                // Pure gold section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    FittedBox(
                      child: Text(
                        'Pure gold',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      child: dropListWidget(
                        context: context,
                        width: width.sp,
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
                Spacer(),
                // section currency
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    FittedBox(
                      child: Text(
                        'Currency',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      child: dropListWidget(
                        context: context,
                        width: width.spMin,
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
                Spacer(),
                elevatedButton(
                  width: 213.sp,
                  height: 27.47.sp,
                  name: 'Save',
                  onPressed: () {
                    if (AppCubit.get(context)
                            .nameDepotController
                            .text
                            .isNotEmpty &&
                        AppCubit.get(context)
                            .weightValueDepotMetalController
                            .text
                            .isNotEmpty) {
                      DepotDatabaseCubit.get(context)
                          .insertDepotDatabase(
                        name: AppCubit.get(context).nameDepotController.text,
                        currency: AppCubit.get(context).currencySelected,
                        depotType: AppCubit.get(context).depotTypeSelected,
                        pureGold: AppCubit.get(context).karatSelected,
                        weightUnit: null,
                        weightValue: null,
                      )
                          .then(
                        (value) {
                          Navigator.of(context).pop();
                        },
                      );
                    } else {
                      textFieldIsEmptyMessage();
                    }
                  },
                ),
                Spacer(),
              ],
            ),
          ),
          // to add database
        ),
      ),
    );

// this for update when click on update click
Future updateDepotItem({
  required BuildContext context,
  required model,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        width: 329.spMax,
        height: 453.spMin,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          // ignore: prefer__literals_to_create_immutables
          children: [
            Spacer(),
            // this name of depot
            Row(
              children: [
                FittedBox(
                  child: Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Spacer(),
                formFieldWidget(
                  type: TextInputType.name,
                  controller: AppCubit.get(context).nameDepotController,
                ),
              ],
            ),
            Spacer(),
            // Depot type section
            Row(
              children: [
                FittedBox(
                  child: Text(
                    'Depot type',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Spacer(),
                FittedBox(
                  child: dropListWidget(
                    context: context,
                    value: AppCubit.get(context).depotTypeSelected,
                    items: AppCubit.get(context).depotTypeDropList,
                    onChange: (change) {
                      AppCubit.get(context)
                          .changedDepotTypeDrop(change: change);
                    },
                  ),
                ),
              ],
            ),
            Spacer(),
            // Weight Unit section
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                FittedBox(
                  child: Text(
                    'Weight Unit',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Spacer(),
                FittedBox(
                  child: dropListWidget(
                    context: context,
                    value: AppCubit.get(context).unitSelected,
                    items: AppCubit.get(context).unitMetalDropList,
                    onChange: (String? value) {
                      AppCubit.get(context).changedUnitDrop(change: value);
                    },
                  ),
                ),
              ],
            ),
            Spacer(),
            // Pure gold section
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                FittedBox(
                  child: Text(
                    'Pure gold',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Spacer(),
                FittedBox(
                  child: dropListWidget(
                    context: context,
                    value: AppCubit.get(context).karatSelected,
                    items: AppCubit.get(context).karatGoldMetalDropList,
                    onChange: (String? value) {
                      AppCubit.get(context).changeKaratUnitDrop(change: value);
                    },
                  ),
                ),
              ],
            ),
            Spacer(),
            // section currency
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Currency',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                dropListWidget(
                  context: context,
                  items: AppCubit.get(context).currencyDropList,
                  onChange: (String? value) {
                    AppCubit.get(context).changedCurrencyDrop(change: value);
                  },
                  value: AppCubit.get(context).currencySelected,
                ),
              ],
            ),
            Spacer(),
            // to update
            elevatedButton(
              width: 213,
              height: 27.47,
              name: 'Save',
              onPressed: () {
                if (AppCubit.get(context).nameDepotController.text.isNotEmpty) {
                  DepotDatabaseCubit.get(context)
                      .updateItemDepot(
                    id: model['id'],
                    currency: AppCubit.get(context).currencySelected,
                    name: AppCubit.get(context).nameDepotController.text,
                    depotType: AppCubit.get(context).depotTypeSelected,
                    pureGold: AppCubit.get(context).karatSelected,
                    weightValue: null,
                    weightUnit: null,
                  )
                      .then(
                    (value) {
                      Navigator.of(context).pop();
                    },
                  );
                } else {
                  textFieldIsEmptyMessage();
                }
              },
            ),
            Spacer(),
          ],
        ),
      ),
    ),
  );
}

// this message to user to confirm the delete in depot screen
confirmDeleteMessageForDepot({
  required Map model,
  required BuildContext context,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderSizeOfDeledMessage),
        ),
        content: Text(
          'Are you sure you want to delete this row ?',
          style: TextStyle(
            fontSize: 15.spMin,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          elevatedButton(
            width: 116.spMin,
            height: 28.81.spMin,
            name: 'Confirm',
            onPressed: () {
              DepotDatabaseCubit.get(context)
                  .deleteData(
                id: model['id'],
              )
                  .then(
                (value) {
                  Navigator.pop(context);
                },
              );
            },
          ),
          elevatedButton(
            width: 116.spMin,
            height: 28.81.spMin,
            color: Color(0xFFD6B506),
            name: 'Cancel',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
