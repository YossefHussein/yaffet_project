import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaffet/controllers/states.dart';
import 'package:yaffet/views/modules/depot_screen.dart';

import '../views/modules/alert_list_screen.dart';
import '../views/modules/calculator_screen.dart';
import '../views/modules/home_screen.dart';
import '../views/modules/setting_screen.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitState());

  // this method for get information
  static AppCubit get(BuildContext context) => BlocProvider.of(context);

// this is first selected of in 'countryDropList'
  String currencySelected = 'USD';

  // this currency of drop list
  List<DropdownMenuItem<String>> get currencyDropList {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: 'USD',
        child: FittedBox(
          child: Text('USD'),
        ),
        // to set center
      ),
      DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: 'EGP',
        child: FittedBox(
          child: Text('EGP'),
        ),
      ),
      DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: 'SAU',
        child: FittedBox(
          child: Text('SAU'),
        ),
      ),
      DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: 'AED',
        child: FittedBox(
          child: Text('AED'),
        ),
      ),
      DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: 'EURO',
        child: FittedBox(
          child: Text('EURO'),
        ),
      ),
    ];
    return menuItems;
  }

  // if click on any item change to it
  void changedCurrencyDrop({required String? change}) {
    currencySelected = change!;
    emit(AppChangeCurrencyDropListState());
  }

  // this is first selected of in 'unitMetalDropList'
  String unitSelected = 'OZ';

  // this is information of unit of drop list
  List<DropdownMenuItem<String>> get unitMetalDropList {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: 'OZ',
        child: FittedBox(
          child: Text('OZ'),
        ),
      ),
      DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: 'G',
        child: FittedBox(
          child: Text('G'),
        ),
      ),
      DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: 'KG',
        child: FittedBox(
          child: Text('KG'),
        ),
      ),
    ];
    return menuItems;
  }

  // if click on any item change to it
  void changedUnitDrop({required String? change}) {
    unitSelected = change!;
    emit(AppChangeUnitDropListState());
  }

  // this is karat of gold
  String karatSelected = '24K';

  // this is information of karat of drop list
  List<DropdownMenuItem<String>> get karatGoldMetalDropList {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: '24K',
        child: FittedBox(
          child: Text('24K'),
        ),
      ),
      DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: '21K',
        child: FittedBox(
          child: Text('21K'),
        ),
      ),
      DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: '18K',
        child: FittedBox(
          child: Text('18K'),
        ),
      ),
    ];
    return menuItems;
  }

  void changeKaratUnitDrop({required String? change}) {
    karatSelected = change!;
    emit(AppChangeUnitDropListState());
  }

  // this variable for language
  String languageSelected = 'English';

  // this is information of language of drop list
  List<DropdownMenuItem<String>> get languageDropList {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: 'English',
        child: FittedBox(
          child: Text('English'),
        ),
      ),
      DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: 'Arabic',
        child: FittedBox(
          child: Text('Arabic'),
        ),
      ),
    ];
    return menuItems;
  }

// this is first selected of in 'countryDropList'
  String depotTypeSelected = 'Gold';

  // this is information of country of drop list
  List<DropdownMenuItem<String>> get depotTypeDropList {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: 'Gold',
        child: FittedBox(
          child: Text('Gold'),
        ),
      ),
      DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: 'Silver',
        child: FittedBox(
          child: Text('Silver'),
        ),
      ),
    ];
    return menuItems;
  }

  // if click on any item change to it
  void changedDepotTypeDrop({required String? change}) {
    depotTypeSelected = change!;
    emit(ChangedDepotTypeDropListState());
  }

  // this for change lang
  void changeLanguageUnitDrop({required String? change}) {
    languageSelected = change!;
    emit(AppChangeUnitDropListState());
  }

  String? countrySelected = 'UAS';

  // this when change drop list of currency change
  changedCountyDrop() {
    if (currencySelected == 'USD') {
      return countrySelected = 'US';
    }
    if (currencySelected == 'EGP') {
      return countrySelected = 'EG';
    }
    if (currencySelected == 'SAU') {
      return countrySelected = 'SA';
    }
    if (currencySelected == 'AED') {
      return countrySelected = 'AE';
    }
    if (currencySelected == 'EURO') {
      return countrySelected = 'Europe';
    }
    emit(AppChangeCountryDropListState());
  }

  // this if user click hide gold card
  bool isCardOfGoldExist = true;

  // this for if user click on silver delete karat gold of card
  void deleteGoldCard() {
    isCardOfGoldExist = false;
    emit(DeleteGoldCardState());
  }

  // and this for reverse the function 'deleteGoldCard'
  void reverseGoldCard() {
    isCardOfGoldExist = true;
    emit(ReverseGoldCardState());
  }

  // courant screen
  int courantScreen = 0;

  // this for change screen when click
  void changeScreenWhenPress(int index) {
    courantScreen = index;
    emit(ChangScreenState());
  }

  // this for change bottomAppBar when call on 'changeScreenWhenPress'
  Widget bottomNavBarItems(int index) {
    if (index == 0) {
      // ignore: prefer_const_constructors
      return HomeScreen();
    } else if (index == 1) {
      // ignore: prefer_const_constructors
      return DepotScreen();
    } else if (index == 2) {
      // ignore: prefer_const_constructors
      return CalculatorScreen();
    } else if (index == 3) {
      // ignore: prefer_const_constructors
      return AlertListScreen();
    } else if (index == 4) {
      // ignore: prefer_const_constructors
      return SettingScreen();
    } else {
      return Container();
    }
  }

  // this for switch button in settings screen
  // this var for chang the button and this control notification
  // when change was 'true' app push notification
  bool notificationSwitch = true;

  void changeNotificationSwitch(value) {
    notificationSwitch = value;
    emit(ChangeNotificationSwitchState());
  }

  // this to control on form filed of weight
  // this use in calculate screen
  TextEditingController weightValueMetalController = TextEditingController();

  // this to control on form filed of price
  TextEditingController priceMetalController = TextEditingController();

  // this to control on form filed of name of depot
  TextEditingController nameDepotController = TextEditingController();

  // this use in depot popup screen in depot screen
  TextEditingController weightValueDepotMetalController =
      TextEditingController();

  // this use in depot popup screen in depot screen
  TextEditingController weightValueAlertMetalController =
      TextEditingController();

  // this to control on form filed of name of alert
  TextEditingController nameAlertController = TextEditingController();

  // this for chick to on gold
  // is gold true see in popScreen for example of alert
  // see gold if false see silver
  bool isGold = true;

  void isGoldCheck() {
    isGold = !isGold;
    emit(CheckOnGoldCalucaltor());
  }

  bool isGoldInAlert = true;

  /// and this for check but for alert screen (popup screen)
  void isGoldInAlertCheck() {
    isGoldInAlert = !isGoldInAlert;
    emit(CheckOnGoldAlert());
  }

  bool isGoldHomeScreen = true;

  changeMetalTypeToSilver() {
    isGoldHomeScreen = false;
    emit(CheckOnGoldHomeScreen());
  }

  changeMetalTypeToGold() {
    isGoldHomeScreen = true;
    emit(CheckOnGoldHomeScreen());
  }
}
