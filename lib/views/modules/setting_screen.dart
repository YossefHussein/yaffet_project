
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';

import '../../controllers/cubit.dart';
import '../../controllers/states.dart';
import '../ui/responsive/responsive.dart';
import '../ui/styles/colors.dart';
import '../ui/styles/sizes.dart';
import '../ui/widgets/boxshadow.dart';
import '../ui/widgets/buttons.dart';
import '../ui/widgets/droplist.dart';
import '../ui/widgets/padding.dart';
import '../ui/widgets/sizebox.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SafeArea(
                child: Padding(
                  padding: pSizePaddingSettingScreen,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Setting',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      pSizeboxHeight10(),
                      Responsive(
                        mobileUi: Center(
                          child: Container(
                            width: double.infinity,
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
                              padding: pSizePaddingAll,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  pSizeboxHeight35(),
                                  Row(
                                    children: [
                                      const Text(
                                        'Language',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                      dropListWidget(
                                        context: context,
                                        value: cubit.languageSelected,
                                        items: cubit.languageDropList,
                                        onChange: (String? value) {
                                          cubit.changeLanguageUnitDrop(
                                            change: value,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  pSizeboxHeight30(),
                                  Row(
                                    children: [
                                      const Text(
                                        'Weight Unit',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                      dropListWidget(
                                        context: context,
                                        value: cubit.unitSelected,
                                        items: cubit.unitMetalDropList,
                                        onChange: (String? value) {
                                          cubit.changedUnitDrop(change: value);
                                        },
                                      ),
                                    ],
                                  ),
                                  pSizeboxHeight30(),
                                  Row(
                                    children: [
                                      const Text(
                                        'Pure gold',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Spacer(),
                                      dropListWidget(
                                        context: context,
                                        value: cubit.karatSelected,
                                        items: cubit.karatGoldMetalDropList,
                                        onChange: (String? value) {
                                          cubit.changeKaratUnitDrop(
                                              change: value);
                                        },
                                      ),
                                    ],
                                  ),
                                  pSizeboxHeight30(),
                                  Row(
                                    children: [
                                      const Text(
                                        'Currency',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                      dropListWidget(
                                        context: context,
                                        items: cubit.currencyDropList,
                                        onChange: (String? value) {
                                          cubit.changedCurrencyDrop(
                                              change: value);
                                        },
                                        value: cubit.currencySelected,
                                      ),
                                    ],
                                  ),
                                  pSizeboxHeight35(),
                                  Row(
                                    children: [
                                      const Text(
                                        'Push Notification',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                      GFToggle(
                                        enabledThumbColor: pSwitchColor,
                                        enabledTrackColor:
                                            pActiveTrackSwitchColor,
                                        value: cubit.notificationSwitch,
                                        type: GFToggleType.ios,
                                        onChanged: (value) {
                                          cubit.changeNotificationSwitch(
                                            value,
                                          );
                                        },
                                      ),
                                      // Switch(
                                      //   inactiveThumbColor: pSwitchColor,
                                      //   activeTrackColor:
                                      //       pActiveTrackSwitchColor,
                                      //   value: cubit.notificationSwitch,
                                      //   onChanged: (value) {
                                      //     cubit.changeNotificationSwitch(
                                      //       value,
                                      //     );
                                      //   },
                                      // ),
                                    ],
                                  ),
                                  pSizeboxHeight35(),
                                  // to save the sttings
                                  Center(
                                    child: elevatedButton(
                                      height: 32,
                                      width: 213,
                                      name: 'save',
                                      onPressed: () {},
                                    ),
                                  ),
                                  pSizeboxHeight35(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        tabletUi: Center(
                          child: Container(
                            width: double.infinity,
                            height: 450,
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
                              padding: pSizePaddingAll,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  pSizeboxHeight35(),
                                  Row(
                                    children: [
                                      const Text(
                                        'Language',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                      dropListWidget(
                                        context: context,
                                        value: cubit.languageSelected,
                                        items: cubit.languageDropList,
                                        onChange: (String? value) {
                                          cubit.changeLanguageUnitDrop(
                                            change: value,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  pSizeboxHeight30(),
                                  Row(
                                    children: [
                                      const Text(
                                        'Weight Unit',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                      dropListWidget(
                                        context: context,
                                        value: cubit.unitSelected,
                                        items: cubit.unitMetalDropList,
                                        onChange: (String? value) {
                                          cubit.changedUnitDrop(change: value);
                                        },
                                      ),
                                    ],
                                  ),
                                  pSizeboxHeight30(),
                                  Row(
                                    children: [
                                      const Text(
                                        'Pure gold',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Spacer(),
                                      dropListWidget(
                                        context: context,
                                        value: cubit.karatSelected,
                                        items: cubit.karatGoldMetalDropList,
                                        onChange: (String? value) {
                                          cubit.changeKaratUnitDrop(
                                              change: value);
                                        },
                                      ),
                                    ],
                                  ),
                                  pSizeboxHeight30(),
                                  Row(
                                    children: [
                                      const Text(
                                        'Currency',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                      dropListWidget(
                                        context: context,
                                        items: cubit.currencyDropList,
                                        onChange: (String? value) {
                                          cubit.changedCurrencyDrop(
                                              change: value);
                                        },
                                        value: cubit.currencySelected,
                                      ),
                                    ],
                                  ),
                                  pSizeboxHeight35(),
                                  Row(
                                    children: [
                                      const Text(
                                        'Push Notification',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                      Switch(
                                        inactiveThumbColor: pSwitchColor,
                                        activeTrackColor:
                                            pActiveTrackSwitchColor,
                                        value: cubit.notificationSwitch,
                                        onChanged: (value) {
                                          cubit.changeNotificationSwitch(
                                            value,
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Center(
                                    child: elevatedButton(
                                      height: 32,
                                      width: 213,
                                      name: 'save',
                                      onPressed: () {},
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // pSizeboxHeight35(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
