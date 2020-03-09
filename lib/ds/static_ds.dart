import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weatheranimationapp/data/staticData.dart';

class StaticDS {
  Observable<List<MainData>> getData() {
    List<MainData> data = [];

    List<int> tempList1 = [24, 26, 28, 30, 32];
    List<int> tempList2 = [12, 14, 16, 18, 20];
    List<int> tempList3 = [30, 32, 34, 32, 34];
    List<int> tempList4 = [18, 16, 18, 20, 22];

    data.add(MainData(
        cityName: "Ahmedabad",
        season: "Windy",
        temp: 28,
        tempList: tempList1,
        color: Colors.purple,
        image: "assets/images/ahmedabad.jpeg"));

    data.add(MainData(
        cityName: "London",
        season: "Summer",
        temp: 16,
        tempList: tempList2,
        color: Colors.brown,
        image: "assets/images/london.jpg"));

    data.add(MainData(
        cityName: "California",
        season: "Spring",
        temp: 28,
        tempList: tempList1,
        color: Colors.lightBlue,
        image: "assets/images/California.jpeg"));

    data.add(MainData(
        cityName: "Singapore",
        season: "Autumn",
        temp: 34,
        tempList: tempList3,
        color: Colors.redAccent,
        image: "assets/images/Singapore.jpeg"));

    data.add(MainData(
        cityName: "Canada",
        season: "Summer",
        temp: 18,
        tempList: tempList4,
        color: Colors.blueGrey,
        image: "assets/images/Canada.jpeg"));
    return Observable.just(data);
  }
}
