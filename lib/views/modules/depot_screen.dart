
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        var cubit = DepotDatabaseCubit.get(context);
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
                          builder: (BuildContext context) => pSizeboxHeight20(height: 100),
                          fallback: (context) => pSizeboxHeight30(),
                        ), // depot items
                        depotBuilder(
                          depot: DepotDatabaseCubit.get(context).newDepotList,
                          context: context,
                        ),
                        ConditionalBuilder(
                          condition: DepotDatabaseCubit.get(context)
                              .newDepotList
                              .isEmpty,
                          builder: (BuildContext context) => pSizeboxHeight20(height: 100),
                          fallback: (context) => pSizeboxHeight30(),
                        ), //
                        // this for add depot
                        Container(
                          child: elevatedButton(
                            width: 213,
                            height: 36.24,
                            name: 'Add new depot',
                            onPressed: () {
                              popupDepotDialogWidget(context: context);
                            },
                          ),
                        ),
                        pSizeboxHeight20(),
                      ],
                    ),
                  ),
                ),
                pSizeboxHeight15(),
                // this for see price of depot
                ConditionalBuilder(
                  condition: cubit.newDepotList.isNotEmpty,
                  builder: (context) => Container(
                    height: 195,
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF8F8F8),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black.withOpacity(0.05000000074505806),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      shadows: [
                        containerBoxShadow(),
                      ],
                    ),
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      // ignore: prefer_const_constructors
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Total Balance',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '1555 USD',
                                style: TextStyle(
                                  color: Color(0xFF505F6D),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Row(
                            children: [
                              Text(
                                'Gold 24k',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Source Sans Pro',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '100 Grams',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Row(
                            children: [
                              Text(
                                '100 Grams',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '100 Grams',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Row(
                            children: [
                              Text(
                                'Gold 21k',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '1.5KG',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Row(
                            children: [
                              Text(
                                'Gold 18k',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '1.5KG',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  fallback: (context) => Container(
                    height: 195,
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF8F8F8),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black.withOpacity(0.05000000074505806),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      shadows: [
                        containerBoxShadow(),
                      ],
                    ),
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      // ignore: prefer_const_constructors
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text('no data inserted'),
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
