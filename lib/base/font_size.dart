import 'package:flutter/material.dart';
import 'package:weatheranimationapp/base/responsiveLayout.dart';

const double kMobileTitle = 18.0;
const double kWebTitle = 18.0;

const double kMobileSubTitle = 14.0;
const double kWebSubTitle = 15.0;

const double kMobileButton = 18.0;
const double kWebButton = 24.0;

const double kMobileDisplay1 = 40.0;
const double kWebDisplay1 = 124.0;

const double kMobileDisplay2 = 24.0;
const double kWebDisplay2 = 60.0;

const double kMobileCaption = 14.0;
const double kWebCaption = 18.0;

double title(BuildContext context) {
  return ResponsiveLayout.isSmall(context) ? kMobileTitle : kWebTitle;
}

double subtitle(BuildContext context) {
  return ResponsiveLayout.isSmall(context) ? kMobileSubTitle : kWebSubTitle;
}

double button(BuildContext context) {
  return ResponsiveLayout.isSmall(context) ? kMobileButton : kWebButton;
}

double display1(BuildContext context) {
  return ResponsiveLayout.isSmall(context) ? kMobileDisplay1 : kWebDisplay1;
}

double display2(BuildContext context) {
  return ResponsiveLayout.isSmall(context) ? kMobileDisplay2 : kWebDisplay2;
}

double caption(BuildContext context) {
  return ResponsiveLayout.isSmall(context) ? kMobileCaption : kWebCaption;
}
