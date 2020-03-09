import 'package:flutter/material.dart';
import 'package:weatheranimationapp/base/custom_place_holder.dart';
import 'package:weatheranimationapp/network/viewstate.dart';

class StateHandler extends StatelessWidget {
  final ViewState viewState;
  final Widget body;
  final Widget loadingWidget;
  final Widget errorWidget;

  StateHandler({
    @required this.viewState,
    @required this.body,
    this.loadingWidget,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    switch (viewState?.status) {
      case Status.COMPLETED:
        {
          return body;
        }
      case Status.ERROR:
        {
          return Container(
            height: MediaQuery.of(context).size.height / 2,
            child: errorWidget ??
                CustomPlaceHolder(
                  message: viewState?.message,
                ),
          );
        }
      default:
        {
          return loadingWidget ??
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: CircularProgressIndicator(),
              );
        }
    }
  }
}
