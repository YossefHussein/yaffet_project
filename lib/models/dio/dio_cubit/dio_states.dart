abstract class DioState {}

class DioInitialState extends DioState {}

class DioGetChartSuccessState extends DioState {}

class DioGetChartLoadingState extends DioState {}

class DioGetChartErrorState extends DioState {
  final String? error;
  DioGetChartErrorState({this.error});
}
