


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/cubit.dart';
import '../../controllers/states.dart';
import '../ui/styles/colors.dart';
import '../ui/widgets/sizebox.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) => AppCubit(),
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        /// this for don't show fab button when open keyboard
        final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/LOGO YAFFET Complete.png',
                ),
              ),
            ],
          ),
          body: cubit.bottomNavBarItems(cubit.courantScreen),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: showFab
              ? FloatingActionButton(
                  child: Image.asset(
                    'assets/icons/calculator.png',
                    scale: 2,
                  ),
                  onPressed: () {
                    cubit.changeScreenWhenPress(2);
                  },
                )
              :
               null,
          bottomNavigationBar: BottomAppBar(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  pSizeboxWidth30(),
                  IconButton(
                    tooltip: 'HomeScree',
                    color: pColorIconBottomNav,
                    icon: Image.asset('assets/icons/home_screen_icon.png'),
                    onPressed: () {
                      cubit.changeScreenWhenPress(0);
                    },
                  ),
                  IconButton(
                    tooltip: 'CalculatorScreen',
                    color: pColorIconBottomNav,
                    icon: Image.asset('assets/icons/depot_icon.png'),
                    onPressed: () {
                      cubit.changeScreenWhenPress(1);
                    },
                  ),
                  pSizeboxWidth35(),
                  IconButton(
                    tooltip: 'AlertsScreen',
                    color: pColorIconBottomNav,
                    icon: const FittedBox(
                        child: Icon(Icons.notifications_active)),
                    onPressed: () {
                      cubit.changeScreenWhenPress(3);
                    },
                  ),
                  IconButton(
                    tooltip: 'SettingsScreen',
                    color: pColorIconBottomNav,
                    icon: const FittedBox(child: Icon(Icons.settings)),
                    onPressed: () {
                      cubit.changeScreenWhenPress(4);
                    },
                  ),
                  pSizeboxWidth30(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
