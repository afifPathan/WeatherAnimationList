import 'package:rxdart/rxdart.dart';
import 'package:weatheranimationapp/data/staticData.dart';
import 'package:weatheranimationapp/ds/static_ds.dart';

class WeatherRepo {
  final _ds = StaticDS();

  Observable<List<MainData>> getStaticData() {
    return _ds.getData();
  }
}
