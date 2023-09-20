import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../dio_helper.dart';
import 'dio_state.dart';

class DioCubit extends Cubit<DioState> {
  DioCubit() : super(DioInitial());

  static DioCubit get(BuildContext context) => BlocProvider.of(context);

  var apiLink = "https://live-metal-prices.p.rapidapi.com/v1/latest/XAU/USD";

  List<Map> goldList = [];

  void getGoldPriceHistory() {
    emit(GetSilverPriceHistoryLoadingState());
    DioHelper.getData(
      url: '$apiLink',
      query: {
        "X-RapidAPI-Key": "2ed3be859fmsh4d3672f688e2b14p149dd2jsne26750cf1877",
        "X-RapidAPI-Host": "live-metal-prices.p.rapidapi.com"
      },
    ).then((value) {
      value?.data = goldList;
      emit(GetSilverPriceHistoryCompleteState());
      print("contednt data of respone (${goldList}) ");
    }).catchError((error) {
      print('this is error ${error.toString()}');
      emit(GetSilverPriceHistoryErrorState(error: error.toString()));
    });
  }
}
