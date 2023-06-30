import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/View/world_states_screen.dart';

class CountriesDetailScreen extends StatefulWidget {
  String name, image;
  int totalCases, totalDeaths, recoverd, critical;
  CountriesDetailScreen(
      {Key? key,
      required this.name,
      required this.image,
      required this.totalCases,
      required this.recoverd,
      required this.totalDeaths,
      required this.critical})
      : super(key: key);

  @override
  State<CountriesDetailScreen> createState() => _CountriesDetailScreenState();
}

class _CountriesDetailScreenState extends State<CountriesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
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
                  padding: EdgeInsets.only(top: 50, left: 13, right: 13),
                  child: Card(
                    shadowColor: Colors.black,
                    elevation: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        ReusableRow(
                            title: widget.name,
                            value: widget.totalCases.toString()),
                        ReusableRow(
                            title: 'Total Cases',
                            value: widget.totalCases.toString()),
                        ReusableRow(
                            title: 'Total Deaths',
                            value: widget.totalDeaths.toString()),
                        ReusableRow(
                            title: 'Recovered',
                            value: widget.recoverd.toString()),
                        ReusableRow(
                            title: 'Critical',
                            value: widget.critical.toString()),
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(widget.image),
                )
              ],
            )
          ]),
    );
  }
}
