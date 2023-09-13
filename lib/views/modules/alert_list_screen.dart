
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/local_database/alert_database/alert_database_cubit.dart';
import '../../models/local_database/alert_database/alert_database_state.dart';
import '../ui/styles/sizes.dart';
import '../ui/widgets/alert_widget.dart';
import '../ui/widgets/boxshadow.dart';
import '../ui/widgets/buttons.dart';
import '../ui/widgets/sizebox.dart';

class AlertListScreen extends StatefulWidget {
  const AlertListScreen({super.key});

  @override
  State<AlertListScreen> createState() => _AlertListScreenState();
}

class _AlertListScreenState extends State<AlertListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AlertDatabaseCubit, AlertDatabaseCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
              bottom: 35,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  containerBoxShadow(),
                ],
                borderRadius: BorderRadius.circular(pCardBorderRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'My Alert',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    ConditionalBuilder(builder: (context) => PSizeboxHeight30(height: 50), condition: AlertDatabaseCubit.get(context).newAlertList.isEmpty, fallback: (context) => PSizeboxHeight10(),),
                    // depot items
                    alertBuilder(
                      context: context,
                      alert: AlertDatabaseCubit.get(context).newAlertList,
                    ),
                   PSizeboxHeight20(),
                    // this for add depot
                    ElevatedButtonWidget(
                      width: 213,
                      height: 36.24,
                      name: 'Add new alert',
                      onPressed: () {
                        popupAlertDialogWidget(context);
                      },
                    ),
                    ConditionalBuilder(
                      condition: AlertDatabaseCubit.get(context).newAlertList.isEmpty,
                      builder: (conntext) => PSizeboxHeight30(height: 145),
                      fallback: (BuildContext context) => PSizeboxHeight30(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}