import 'package:flutter/material.dart';
import 'package:weatheranimationapp/base/state_handler.dart';
import 'package:weatheranimationapp/bloc/weather_bloc.dart';
import 'package:weatheranimationapp/widget/listWidget.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final _bloc = WeatherBloc();

  @override
  void initState() {
    super.initState();
    _bloc.getStaticWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: _bloc.viewState,
          builder: (context, snapshot) {
            return StateHandler(
              viewState: snapshot?.data,
              body: ListWeather(dataList: snapshot?.data?.data ?? [],),
            );
          },
        ),
      ),
    );
  }
}
