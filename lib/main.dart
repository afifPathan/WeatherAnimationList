import 'package:flutter/material.dart';
import 'package:weatheranimationapp/base/font_size.dart';
import 'package:weatheranimationapp/colors.dart';
import 'package:weatheranimationapp/ui/weather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _buildTheme(),
      debugShowCheckedModeBanner: false,
      home: Weather(),
    );
  }

  ThemeData _buildTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      accentColor: kBrown900,
      primaryColor: kPurple100,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: kPurple100,
        textTheme: ButtonTextTheme.normal,
      ),
      buttonColor: kPurple500,
      scaffoldBackgroundColor: kBackgroundWhite,
      cardColor: kBackgroundWhite,
      textSelectionColor: kPurple100,
      errorColor: kErrorRed,
      textTheme:  _buildTextThemeForMobile(base.textTheme),
      primaryTextTheme:  _buildTextThemeForMobile(base.textTheme),
      accentTextTheme:  _buildTextThemeForMobile(base.textTheme),
      primaryIconTheme: base.iconTheme.copyWith(color: kPurple500),
    );
  }

  TextTheme _buildTextThemeForMobile(TextTheme base) {
    return base
        .copyWith(
      headline: base.headline.copyWith(
        fontWeight: FontWeight.w500,
        fontFamily: 'OpenSansRegular',
      ),
      title: base.title.copyWith(
        fontSize: kMobileTitle,
        fontFamily: 'OpenSansRegular',
      ),
      subtitle: base.subtitle.copyWith(
        fontSize: kMobileSubTitle,
        fontFamily: 'OpenSansRegular',
      ),
      display1: base.display1.copyWith(
        fontSize: kMobileDisplay1,
        fontFamily: 'OpenSansExtraBold',
      ),
      display2: base.display2.copyWith(
        fontSize: kMobileDisplay2,
        fontFamily: 'OpenSansExtraBold',
      ),
      caption: base.caption.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: kMobileCaption,
        fontFamily: 'OpenSansRegular',
      ),
    )
        .apply(
      displayColor: kPurple500,
      bodyColor: kPurple500,
    );
  }
}