import 'package:rxdart/rxdart.dart';
import 'package:weatheranimationapp/network/api_manager.dart';
import 'package:weatheranimationapp/network/viewstate.dart';

class BaseBloc {
  ApiManager _apiManager = ApiManager();
  CompositeSubscription subscription = CompositeSubscription();

  Observable<ViewState<T>> handleAPICall<T>(Observable source,
      {customResponse}) {
    return _apiManager.callApi<T>(source, customResponse: customResponse);
  }

  void dispose() {
    subscription.clear();
  }
}
