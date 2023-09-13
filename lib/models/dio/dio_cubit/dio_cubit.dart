import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../dio_helper.dart';
import 'dio_state.dart';

class DioCubit extends Cubit<DioState> {
  DioCubit({this.dateSilver, this.metalPriceSilver}) : super(DioInitial());

  static DioCubit get(BuildContext context) => BlocProvider.of(context);

  List<dynamic> silverHistoryPriceList = [];
  double? metalPriceSilver;
  String? dateSilver;

  void getSilverPriceHistory() {
    if (silverHistoryPriceList.isEmpty) {
      emit(GetSilverPriceHistoryLoadingState());
      // https://api.yaffet.com/public/api/prices-history?metal=silver&period=day
      DioHelper.getData(
        url: '/latestPost',
        query: {
          'metal': 'silver',
          'period': 'day',
        },
      ).then((value) {
        
      }).catchError((error) {
        print('this is error ${error.toString()}');
        emit(GetSilverPriceHistoryErrorState(error: error.toString()));
      });
    } else {
      emit(GetSilverPriceHistoryCompleteState());
    }
  }
}
