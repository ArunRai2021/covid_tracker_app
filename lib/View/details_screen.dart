import 'package:covid_tracker_app/View/world_states.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  String name;
  String image;
  int totalCases, todayDeaths, active, critical, todayRecovered, test;

  DetailScreen({
    Key? key,
    required this.name,
    required this.totalCases,
    required this.todayDeaths,
    required this.todayRecovered,
    required this.critical,
    required this.active,
    required this.image,
    required this.test,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .06),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                      ),
                      ReUsableRow(title: "Cases", value: totalCases.toString()),
                      ReUsableRow(title: "Active", value: active.toString()),
                      ReUsableRow(
                          title: "Death", value: todayDeaths.toString()),
                      ReUsableRow(
                          title: "Critical", value: critical.toString()),
                      ReUsableRow(
                          title: "Today Recovered",
                          value: todayRecovered.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(image),
              )
            ],
          )
        ],
      ),
    );
  }
}
