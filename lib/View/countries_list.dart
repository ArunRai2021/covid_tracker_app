import 'dart:developer';

import 'package:covid_tracker_app/View/details_screen.dart';
import 'package:covid_tracker_app/controller/CountriesScreen_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatelessWidget {
  CountriesListScreen({Key? key}) : super(key: key);

  CountriesScreenListController countriesController =
      Get.put(CountriesScreenListController());

  var searchString = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                searchString.value = value;
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: "Search with Countries Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: countriesController.fetchCountriesRecords(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return ListView.builder(
                      itemCount: 8,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          highlightColor: Colors.grey.shade100,
                          baseColor: Colors.grey.shade700,
                          child: ListTile(
                            title: Container(
                              height: 10,
                              width: 89,
                              color: Colors.white,
                            ),
                            subtitle: Container(
                              height: 10,
                              width: 89,
                              color: Colors.white,
                            ),
                            leading: Container(
                              height: 50,
                              width: 50,
                              color: Colors.white,
                            ),
                          ),
                        );
                      });
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Obx(
                      () => snapshot.data![index]["country"]
                              .toString()
                              .toLowerCase()
                              .contains(searchString.value.toLowerCase())
                          ? ListTile(
                              onTap: () {
                                Get.to(() => DetailScreen(
                                      test: snapshot.data![index]['tests'],
                                      critical: snapshot.data![index]
                                          ["critical"],
                                      name: snapshot.data![index]["country"],
                                      todayRecovered: snapshot.data![index]
                                          ["todayRecovered"],
                                      todayDeaths: snapshot.data![index]
                                          ["todayDeaths"],
                                      active: snapshot.data![index]["active"],
                                      image: snapshot.data![index]
                                          ["countryInfo"]["flag"],
                                      totalCases: snapshot.data![index]
                                          ['cases'],
                                    ));
                              },
                              title: Text(
                                  snapshot.data![index]["country"].toString()),
                              subtitle: Text(
                                  snapshot.data![index]["cases"].toString()),
                              leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(snapshot.data![index]
                                    ['countryInfo']["flag"]),
                              ),
                            )
                          : const SizedBox(),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
