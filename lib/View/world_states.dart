import 'package:covid_tracker_app/View/countries_list.dart';
import 'package:covid_tracker_app/controller/WorldState_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import '../model/WorldStatesModel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorldStateScreen extends StatelessWidget {
  WorldStateController worldStateController = Get.put(WorldStateController());

  WorldStateScreen({Key? key}) : super(key: key);
  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    // worldStateController.fetchWorldStateRecords();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: FutureBuilder(
            future: worldStateController.fetchWorldStateRecords(),
            builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: SpinKitFadingCircle(
                  color: Colors.white,
                  size: 50,
                  controller: worldStateController.controller,
                ));
              } else {
                return SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      PieChart(
                        dataMap: {
                          "Total":
                              double.parse(snapshot.data!.cases!.toString()),
                          "Recovered": double.parse(
                              snapshot.data!.recovered!.toString()),
                          "Deaths":
                              double.parse(snapshot.data!.deaths!.toString()),
                        },
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValuesInPercentage: true,
                        ),
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                        legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left),
                        animationDuration: const Duration(milliseconds: 1200),
                        chartType: ChartType.ring,
                        colorList: colorList,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * .06),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ReUsableRow(
                                    title: "Total",
                                    value: snapshot.data!.cases.toString()),
                                ReUsableRow(
                                    title: "Deaths",
                                    value: snapshot.data!.deaths.toString()),
                                ReUsableRow(
                                    title: "Recovered",
                                    value: snapshot.data!.recovered.toString()),
                                ReUsableRow(
                                    title: "Active",
                                    value: snapshot.data!.active.toString()),
                                ReUsableRow(
                                    title: "Critical",
                                    value: snapshot.data!.critical.toString()),
                                ReUsableRow(
                                    title: "Today Deaths",
                                    value:
                                        snapshot.data!.todayDeaths.toString()),
                                ReUsableRow(
                                    title: "Today Recovered",
                                    value: snapshot.data!.todayRecovered
                                        .toString()),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => CountriesListScreen());
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color(0xff1aa260),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: Text(
                            "Track Countries",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                        ),
                      )
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}

class ReUsableRow extends StatelessWidget {
  String title, value;

  ReUsableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          const Divider()
        ],
      ),
    );
  }
}
