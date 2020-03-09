import 'package:rxdart/rxdart.dart';

import 'app_exception.dart';
import 'viewstate.dart';

class ApiManager {
  Observable<ViewState<T>> callApi<T>(Observable source, {customResponse}) {
    return source.map((response) {
      return ViewState<T>.completed(customResponse ?? response);
    }).onErrorReturnWith((error) {
      return ViewState<T>.error(error.toString(),
          error is NoInternetException ? Type.CONNECTION : Type.OTHER);
    }).startWith(ViewState<T>.loading());
  }
}
