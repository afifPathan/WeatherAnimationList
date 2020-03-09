
import 'package:rxdart/rxdart.dart';
import 'package:weatheranimationapp/base/base_bloc.dart';
import 'package:weatheranimationapp/network/viewstate.dart';
import 'package:weatheranimationapp/repo/weather_repo.dart';

class WeatherBloc extends BaseBloc {
  final _repo = WeatherRepo();
  var viewState = PublishSubject<ViewState>();


  void getStaticWeatherData() {
    handleAPICall(_repo.getStaticData()).listen((viewState) {
      this.viewState.add(viewState);
    });
  }

  @override
  void dispose() {
    super.dispose();
    viewState?.close();
  }
}
