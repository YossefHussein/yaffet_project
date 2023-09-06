abstract class DioState {}

class DioInitial extends DioState {}

class GetSilverPriceHistoryCompleteState extends DioState {}

class GetSilverPriceHistoryLoadingState extends DioState {}

class GetSilverPriceHistoryErrorState extends DioState {
  final String? error;
  GetSilverPriceHistoryErrorState({this.error});
}
