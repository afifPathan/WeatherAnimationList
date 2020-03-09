import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weatheranimationapp/base/round_shape.dart';
import 'package:weatheranimationapp/colors.dart';
import 'package:weatheranimationapp/data/staticData.dart';

// ignore: must_be_immutable
class ListWeather extends StatefulWidget {
  List<MainData> dataList;

  ListWeather({@required this.dataList});

  @override
  _ListWeatherState createState() => _ListWeatherState();
}

class _ListWeatherState extends State<ListWeather>
    with TickerProviderStateMixin {
  final controller = PageController();
  int _currentPosition = 0;
  final List<String> pageHistories = [];
  bool reverse =false;
  var screenHeight;
  AnimationController _imageAnimationController;
  Color statusBarColor;

  Animation<Offset> animation;
  Animation<Offset> animationReverse;
  AnimationController animationController;

  @override
  void initState() {
    _imageAnimationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _imageAnimationController.forward();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween<Offset>(begin: Offset(0.7, 0), end: Offset(0, 0))
        .animate(animationController);
    animationReverse = Tween<Offset>(begin: Offset(-0.7, 0), end: Offset(0, 0))
        .animate(animationController);
    animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    statusBarColor = widget.dataList[_currentPosition].color;

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: statusBarColor));

    if (widget.dataList.isEmpty) {
      return Container(
        child: Center(
          child: Text("Data Not available"),
        ),
      );
    }

    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          onPageChanged: (position) {
            setState(() {
              _imageAnimationController.reset();
              animationController.reset();
              _imageAnimationController.forward();
              animationController.forward();
              if(_currentPosition>position){
                reverse = true;
              }else{
                reverse = false;
              }
              this._currentPosition = position;
              statusBarColor = widget.dataList[position].color;
            });
          },
          pageSnapping: true,
          itemCount: widget.dataList.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (_, position) {
            var positionData = widget.dataList[position];
            return Container(
              child: Hero(
                child: mainView(positionData),
                tag: "",
              ),
            );
          },
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(bottom: 20.0),
          child: SmoothPageIndicator(
            controller: controller,
            count: widget.dataList.length,
            effect: WormEffect(
                activeDotColor: statusBarColor,
                dotColor: kPurple50,
                dotHeight: 8.0,
                dotWidth: 12.0),
          ),
        ),
      ],
    );
  }

  Widget mainView(var data) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          imageWidget(data),
          SlideTransition(position: reverse ? animationReverse : animation, child: iconAndText(data)),
          FadeTransition(
            opacity: _imageAnimationController,
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RoundShape(
                      color: data.color,
                      text: "12:00",
                      temp: data.tempList[0],
                    ),
                    RoundShape(
                      color: data.color,
                      text: "14:00",
                      temp: data.tempList[1],
                    ),
                    RoundShape(
                      color: data.color,
                      text: "Now",
                      temp: data.tempList[2],
                    ),
                    RoundShape(
                      color: data.color,
                      text: "16:00",
                      temp: data.tempList[3],
                    ),
                    RoundShape(
                      color: data.color,
                      text: "17:00",
                      temp: data.tempList[4],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight / 2 - 80,
              margin: EdgeInsets.only(
                  left: 20.0, right: 20.0, bottom: 25.0, top: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  daysText("Sunday", "24", "12", MdiIcons.weatherCloudy),
                  daysText("Monday", "22", "10", MdiIcons.weatherSunny),
                  daysText(
                      "Tuesday", "20", "10", MdiIcons.weatherLightningRainy),
                  daysText("Wednesday", "19", "09", MdiIcons.weatherFog),
                  daysText("Thursday", "24", "12", MdiIcons.weatherSnowyHeavy),
                  daysText("friday", "20", "09", MdiIcons.weatherSunny),
                  daysText("Saturday", "19", "08", MdiIcons.weatherNight),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageWidget(var data) {
    return FadeTransition(
      opacity: _imageAnimationController,
      child: Container(
        alignment: Alignment.topCenter,
        height: screenHeight / 2,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              data.image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.clamp,
                  colors: [
                    Colors.grey.withOpacity(0.9),
                    Colors.grey.withOpacity(0.3),
                    Colors.grey.withOpacity(0.1),
                    Colors.grey.withOpacity(0.3),
                    Colors.grey.withOpacity(0.9),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget iconAndText(var data) {
    return FadeTransition(
      opacity: _imageAnimationController,
      child: Container(
        height: screenHeight / 2 - 100,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              data.cityName,
              maxLines: 1,
              style: TextStyle(color: kTextWhite, fontSize: 18.0),
            ),
            Icon(
              MdiIcons.weatherCloudy,
              color: kTextWhite,
              size: 50,
            ),
            Text(
              "${data.season}",
              maxLines: 1,
              style: TextStyle(color: kTextWhite, fontSize: 24.0),
            ),
            RichText(
              text: TextSpan(
                children: [
                  new TextSpan(
                    text: " ${data.temp}",
                    style: TextStyle(
                        color: kTextWhite,
                        fontSize: 60.0,
                        fontWeight: FontWeight.w800),
                  ),
                  new TextSpan(
                    text: '°',
                    style: TextStyle(
                        color: kTextWhite,
                        fontSize: 60.0,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            Container(
              width: 2,
              height: 50.0,
              color: kBackgroundWhite,
            )
          ],
        ),
      ),
    );
  }

  Widget daysText(
      String day, String temp, String temp1, IconData weatherCloudy) {
    return SlideTransition(
      position: reverse ? animationReverse : animation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 100.0,
            child: Text(
              "$day",
              maxLines: 1,
              style:
                  TextStyle(color: kTextBlack.withOpacity(0.5), fontSize: 18.0),
            ),
          ),
          Icon(
            weatherCloudy,
            color: kTextGrey,
            size: 20,
          ),
          Row(
            children: <Widget>[
              Text(
                "$temp",
                maxLines: 1,
                style: TextStyle(
                    color: kTextBlack.withOpacity(0.5), fontSize: 18.0),
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                "$temp1",
                maxLines: 1,
                style: TextStyle(color: kTextGrey, fontSize: 18.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    _imageAnimationController.dispose();
  }
}

/// https://dribbble.com/shots/2573548-Quick-weather-app-UI-animation
