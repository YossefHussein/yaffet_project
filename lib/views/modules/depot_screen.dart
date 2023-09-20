import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yaffet/views/ui/styles/colors.dart';

import '../../models/local_database/depot_database/depot_database_cubit.dart';
import '../../models/local_database/depot_database/depot_database_state.dart';
import '../ui/styles/sizes.dart';
import '../ui/widgets/boxshadow.dart';
import '../ui/widgets/buttons.dart';
import '../ui/widgets/depot_widget.dart';
import '../ui/widgets/sizebox.dart';

class DepotScreen extends StatefulWidget {
  const DepotScreen({super.key});

  @override
  State<DepotScreen> createState() => _DepotScreenState();
}

class _DepotScreenState extends State<DepotScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DepotDatabaseCubit, DepotDatabaseCubitState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var depotCubit = DepotDatabaseCubit.get(context);
        var depotList = DepotDatabaseCubit.get(context).newDepotList;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
              bottom: 35,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      containerBoxShadow(),
                    ],
                    borderRadius: BorderRadius.circular(pCardBorderRadius),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'My Depot',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        ConditionalBuilder(
                          condition: DepotDatabaseCubit.get(context)
                              .newDepotList
                              .isEmpty,
                          builder: (BuildContext context) =>
                              PSizeboxHeight20(height: 100),
                          fallback: (context) => PSizeboxHeight30(),
                        ), // depot items
                        depotBuilder(
                          depot: DepotDatabaseCubit.get(context).newDepotList,
                          context: context,
                        ),
                        ConditionalBuilder(
                          condition: DepotDatabaseCubit.get(context)
                              .newDepotList
                              .isEmpty,
                          builder: (BuildContext context) =>
                              PSizeboxHeight20(height: 100),
                          fallback: (context) => PSizeboxHeight30(),
                        ), //
                        // this for add depot
                        ElevatedButtonWidget(
                          width: 213,
                          height: 36.24,
                          name: 'Add new depot',
                          onPressed: () {
                            popupDepotDialogWidget(context: context);
                          },
                        ),
                        PSizeboxHeight20(),
                      ],
                    ),
                  ),
                ),
                PSizeboxHeight15(),
                // this for see price of depot
                ConditionalBuilder(
                  condition: depotCubit.newDepotList.isNotEmpty,
                  builder: (context) =>
                      depotContentWidget(depotContentList: depotList),
                  fallback: (context) => Container(
                    height: 195.spMax,
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: pColorContainer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      shadows: [
                        containerBoxShadow(),
                      ],
                    ),
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding: EdgeInsets.all(15.sp),
                      // ignore: prefer_const_constructors
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Total Balance',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '0 USD',
                                style: TextStyle(
                                  color: const Color(0xFF505F6D),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          PSizeboxHeight15(),
                          Row(
                            children: [
                              Text(
                                'Gold 24k',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontFamily: 'Source Sans Pro',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '0 Grams',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          PSizeboxHeight10(),
                          Row(
                            children: [
                              Text(
                                'Silver',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontFamily: 'Source Sans Pro',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '0 Grams',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
