import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../dioHelper.dart';
import 'dio_state.dart';

class DioCubit extends Cubit<DioState> {
  DioCubit({this.dateSilver , this.metalPriceSilver}) : super(DioInitial());

  static DioCubit get(BuildContext context) => BlocProvider.of(context);

  List<dynamic> silverHistoryPriceList = [];
  double? metalPriceSilver;
  String? dateSilver;
  
  void getSilverPriceHistory() {
    if (silverHistoryPriceList.isEmpty) {
      emit(GetSilverPriceHistoryLoadingState());
      // https://api.yaffet.com/public/api/prices-history?metal=silver&period=day
      DioHelper.getData(
        url: 'public/api/prices-history',
        query: {
          'metal': 'silver',
          'period': 'day',
        },
      ).then((value) {
        silverHistoryPriceList = value?.data['data'];
        metalPriceSilver = value?.data['data']['metalPrice'];
        dateSilver = value?.data['data']['date'];
      }).catchError((error) {
        print('this is error ${error.toString()}');
        emit(GetSilverPriceHistoryErrorState(error: error.toString()));
      });
    } else {
      emit(GetSilverPriceHistoryCompleteState());
    }
  }


  // void getLastPriceHistory() {
  //   if (silverHistoryPriceList.length == 0) {
  //     emit(GetSilverPriceHistoryLoadingState());
  //     // https://api.yaffet.com/public/api/prices-history?metal=silver&period=day
  //     DioHelper.getData(
  //       url: 'public/api/getLastprice',
  //       query: {
  //         'metal':'gold',
  //         'unit':'gm',
  //         'currency':'USD',
  //         'period': 'day',
  //       },
  //     ).then((value) {

  //     }).catchError((error) {
  //       print('this is error ${error.toString()}');
  //       emit(GetSilverPriceHistoryErrorState(error: error.toString()));
  //     });
  //   } else {
  //     emit(GetSilverPriceHistoryCompleteState());
  //   }
  // }


  
}